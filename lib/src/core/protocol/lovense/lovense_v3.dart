/// Handler for Lovense Spec V3 Protocol (legacy)
/// This class implements support for Buttplug Spec 3.0 devices and is currently used in production.
/// It will be phased out after full implementation and testing of Spec 4.0.
///
library core.protocol.lovense.lovense_v3;

import 'dart:typed_data';
import 'dart:convert';
import 'dart:async';

import '../../../util/logger.dart';
import '../../hardware/hardware.dart';
import '../../message/message.dart';
import 'lovense_base.dart';

/// Specialized implementation for Spec V3 Lovense devices
@Deprecated(
    'LovenseSpecV3 is deprecated, will be removed after spec 4.0 is fully released.')
class LovenseSpecV3 extends LovenseBase {
  LovenseSpecV3({
    required this.rotationDirection,
    required this.vibratorCount,
    required this.useMply,
    required this.deviceType,
    required this.linearInfo,
  });

  /// Linear movement information used for stroker devices
  (int, int) linearInfo;

  /// Rotation direction used for rotate vibrator devices
  bool rotationDirection;

  /// Whether to use Mply command for vibrate and oscillate features
  final bool useMply;

  /// Device type used for device identification
  /// possible values: "H", "BA", "OC"
  final String deviceType;

  /// Number of vibrators
  final int vibratorCount;

  @override
  List<HardwareCmd> handleScalarCmd({
    required List<(OutputType, int)?> cmds,
  }) {
    /// Seems like lvs has been deprecated, it also been commented out in the Rust implementation
    // if (useLvs) {
    //   final List<int> speeds = [0x4c, 0x56, 0x53, 0x3a]; // ASCII: "LVS:"
    //   speeds.addAll(cmds.map((e) => e?.$2 ?? 0xff));
    //   speeds.add(0x3b);

    //   return <HardwareCmd>[
    //     HardwareWriteCmd(
    //       endpoint: Endpoint.tx,
    //       data: Uint8List.fromList(speeds),
    //       writeWithResponse: false,
    //     ),
    //   ];
    // }

    if (useMply) {
      final speeds = cmds.map((e) => e?.$2.toString() ?? '-1').toList();
      if (speeds.length == 1 && deviceType == 'H') {
        // Max range unless stopped
        speeds.add(speeds[0] == '0' ? '0' : '20');
      }

      final Uint8List lovenseCmd = utf8.encode('Mply:${speeds.join(':')};');
      return [
        HardwareWriteCmd(
          endpoint: Endpoint.tx,
          data: lovenseCmd,
          writeWithResponse: false,
        ),
      ];
    }

    final List<HardwareCmd> hardwareCmds = [];

    final List<(OutputType, int)> vibrateCmds = cmds
        .whereType<(OutputType, int)>()
        .where((e) => [OutputType.vibrate, OutputType.oscillate].contains(e.$1))
        .toList();

    if (vibrateCmds.isNotEmpty) {
      // The command message for controlling all vibrators is different from controlling individual ones
      if (vibratorCount == vibrateCmds.length &&
          (vibratorCount == 1 ||
              vibrateCmds.every((e) => e == vibrateCmds.first))) {
        // Control all
        final Uint8List lovenseCmd =
            utf8.encode('Vibrate:${vibrateCmds.first.$2};');
        hardwareCmds.add(
          HardwareWriteCmd(
            endpoint: Endpoint.tx,
            data: lovenseCmd,
            writeWithResponse: false,
          ),
        );
      } else {
        // Individual control
        for (final (int i, (OutputType, int)? cmd) in cmds.indexed) {
          if (cmd != null) {
            final (OutputType output, int speed) = cmd;
            if (![OutputType.vibrate, OutputType.oscillate].contains(output)) {
              continue;
            }
            final Uint8List lovenseCmd = utf8.encode('Vibrate$i:$speed;');
            hardwareCmds.add(
              HardwareWriteCmd(
                endpoint: Endpoint.tx,
                data: lovenseCmd,
                writeWithResponse: false,
              ),
            );
          }
        }
      }
    }

    // Handle constriction commands.
    final constrictCmds = cmds
        .whereType<(OutputType, int)>()
        .where((e) => e.$1 == OutputType.constrict)
        .toList();
    if (constrictCmds.isNotEmpty) {
      // Only the max has a constriction system, and there's only one, so just parse the first command.
      final Uint8List lovenseCmd =
          utf8.encode('Air:Level:${constrictCmds.first.$2};');
      hardwareCmds.add(
        HardwareWriteCmd(
          endpoint: Endpoint.tx,
          data: lovenseCmd,
          writeWithResponse: false,
        ),
      );
    }

    return hardwareCmds;
  }

  @override
  List<HardwareCmd> handleRotateCmd({
    required List<(int, bool)?> cmds,
  }) {
    final List<HardwareCmd> hardwareCmds = [];
    final cmd = cmds.firstOrNull;
    if (cmd != null) {
      final (speed, clockwise) = cmd;
      final lovenseCmd = utf8.encode('Rotate:$speed;');
      hardwareCmds.add(
        HardwareCmd.write(
          endpoint: Endpoint.tx,
          data: lovenseCmd,
          writeWithResponse: false,
        ),
      );
      if (rotationDirection != clockwise) {
        rotationDirection = clockwise;
        hardwareCmds.add(
          HardwareWriteCmd(
            endpoint: Endpoint.tx,
            data: utf8.encode('RotateChange;'),
            writeWithResponse: false,
          ),
        );
      }
    }
    return hardwareCmds;
  }

  void _handleBatteryEvent(
    Completer<int?> completer,
    HardwareEvent event,
  ) {
    if (event is NotificationHardwareEvent) {
      final String data = utf8.decode(event.data);
      final startPos = data.indexOf('s');

      final String formattedString = data.substring(
        startPos < 0 ? 0 : startPos + 1,
        data.length - 1,
      );
      logger.d(
        'Lovense event received',
        context: {
          'rawData': event.data,
          'decodedData': data,
          'formattedData': formattedString,
        },
      );
      final level = int.tryParse(formattedString);
      if (!completer.isCompleted) {
        completer.complete(level);
      }
    }
  }

  @override
  Future<RemoteToyServerMessage> handleBatteryLevelCmd({
    required Hardware hardware,
    required SensorReadCmdClientMessage message,
  }) async {
    final Completer<int?> batteryLevelCompleter = Completer();

    int? batteryLevel;
    StreamSubscription? subscription;

    try {
      subscription = hardware.events$.listen(
        (event) => _handleBatteryEvent(batteryLevelCompleter, event),
      );
      await hardware.writeValue(
        cmd: HardwareWriteCmd(
          endpoint: Endpoint.tx,
          data: utf8.encode('Battery;'),
          writeWithResponse: false,
        ),
      );
      batteryLevel = await batteryLevelCompleter.future.timeout(
        const Duration(seconds: 2),
        onTimeout: () => null,
      );
    } catch (e) {
      /// https://swaglive.sentry.io/issues/6274692813/?project=6453506&referrer=project-issue-stream
      /// The device may return OK, which cannot be parsed as an integer
      /// This causes noise in Sentry
      batteryLevel = null;
    } finally {
      subscription?.cancel();
    }
    final data = batteryLevel == null
        ? Uint8List(0)
        : Uint8List.fromList(
            [
              batteryLevel,
            ],
          );

    return RemoteToyServerReadingMessage(
      featureIndex: message.featureIndex,
      inputType: message.inputType,
      data: data,
    );
  }

  @override
  List<HardwareCmd> handleLinearCmd({
    required LinearCmdClientMessage message,
  }) {
    final vector = message.vectors.firstOrNull;
    if (vector != null) {
      linearInfo =
          ((vector.position * 100.0).toInt(), vector.duration.inMilliseconds);
    }
    return <HardwareCmd>[];
  }
}
