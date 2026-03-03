/// Lovense Rotate Vibrator Protocol Handler implementation.
///
/// Reference: Buttplug Rust implementation (buttplug_server/src/device/protocol_impl/lovense/lovense_rotate_vibrator.rs)
library core.protocol.lovense.lovense_rotate_vibrator;

import 'dart:typed_data';
import 'dart:convert';

import '../../hardware/hardware.dart';
import '../../message/message.dart';
import '../../../util/logger.dart';
import 'lovense_base.dart';

/// Specialized implementation for Lovense Rotate Vibrator devices implementing vibrate and rotate features.
class LovenseRotateVibrator extends LovenseBase {
  LovenseRotateVibrator();

  /// To memorize the last rotate speed
  int _lastRotateSpeed = 0;

  @override
  List<HardwareCmd> handleOutputVibrateCmd({
    required int featureIndex,
    required String featureId,
    required int speed,
  }) {
    logger.d('Lovense rotate vibrator vibrate command: Vibrate:$speed;');
    final Uint8List cmdData = utf8.encode('Vibrate:$speed;');
    return [
      HardwareWriteCmd(
        endpoint: Endpoint.tx,
        data: cmdData,
        writeWithResponse: false,
      ),
    ];
  }

  @override
  List<HardwareCmd> handleOutputRotateCmd({
    required int featureIndex,
    required String featureId,
    required int speed,
  }) {
    final List<HardwareCmd> cmds = [];
    final int previousSpeed = _lastRotateSpeed;
    _lastRotateSpeed = speed;
    final bool changeDirection =
        (previousSpeed < 0 && speed >= 0) || (previousSpeed >= 0 && speed < 0);

    /// If the value is changed to positive or negative, send rotate change command
    if (changeDirection) {
      logger
          .d('Lovense rotate vibrator change direction command: RotateChange;');
      cmds.add(
        HardwareWriteCmd(
          endpoint: Endpoint.tx,
          data: utf8.encode('RotateChange;'),
          writeWithResponse: false,
        ),
      );
    }

    /// Add rotate command
    logger.d('Lovense rotate vibrator rotate command: Rotate:${speed.abs()};');
    final Uint8List cmdData = utf8.encode('Rotate:${speed.abs()};');
    cmds.add(
      HardwareWriteCmd(
        endpoint: Endpoint.tx,
        data: cmdData,
        writeWithResponse: false,
      ),
    );

    return cmds;
  }
}
