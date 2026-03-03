/// Base class for Lovense protocol handlers implementing common functionality.
library core.protocol.lovense.lovense_base;

import 'package:rxdart/rxdart.dart';
import 'dart:typed_data';
import 'dart:convert';
import 'dart:async';

import '../../message/message.dart';
import '../../hardware/hardware.dart';
import '../../../util/logger.dart';
import '../protocol.dart';

/// Base class for Lovense protocol handlers
class LovenseBase extends ProtocolHandler {
  LovenseBase();

  /// Stream of server messages
  final PublishSubject<RemoteToyServerMessage> _events$ = PublishSubject();

  @override
  Stream<RemoteToyServerMessage> get events$ => _events$.stream;

  @override
  Future<RemoteToyServerMessage> handleInputBatteryLevelCmd({
    required Hardware hardware,
    required int featureIndex,
    required String featureId,
    required InputType inputType,
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
      featureIndex: featureIndex,
      inputType: inputType,
      data: data,
    );
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
}
