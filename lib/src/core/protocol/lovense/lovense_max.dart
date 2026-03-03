/// Lovense Max Protocol Handler
///
/// Reference: Buttplug Rust implementation (buttplug_server/src/device/protocol_impl/lovense/lovense_max.rs)
library core.protocol.lovense.lovense_max;

import 'dart:typed_data';
import 'dart:convert';

import '../../hardware/hardware.dart';
import '../../message/message.dart';
import '../../../util/logger.dart';
import 'lovense_base.dart';

/// Specialized implementation for Lovense Max devices implementing vibrate, oscillate, and constrict features.
class LovenseMax extends LovenseBase {
  LovenseMax();

  @override
  List<HardwareCmd> handleOutputVibrateCmd({
    required int featureIndex,
    required String featureId,
    required int speed,
  }) {
    logger.d('Lovense Max vibrate command: Vibrate:$speed;');
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
  List<HardwareCmd> handleOutputOscillateCmd({
    required int featureIndex,
    required String featureId,
    required int speed,
  }) {
    logger.d('Lovense Max oscillate command: Vibrate:$speed;');
    final Uint8List cmdData = utf8.encode('Vibrate:$speed;');
    return [
      HardwareWriteCmd(
        endpoint: Endpoint.tx,
        data: cmdData,
        writeWithResponse: false,
      ),
    ];
  }

  /// Handle the constrict command for the Lovense Max device
  @override
  List<HardwareCmd> handleOutputConstrictCmd({
    required int featureIndex,
    required String featureId,
    required int level,
  }) {
    logger.d('Lovense Max constrict command: Air:Level:$level;');
    final Uint8List cmdData = utf8.encode('Air:Level:$level;');
    return [
      HardwareWriteCmd(
        endpoint: Endpoint.tx,
        data: cmdData,
        writeWithResponse: false,
      ),
    ];
  }
}
