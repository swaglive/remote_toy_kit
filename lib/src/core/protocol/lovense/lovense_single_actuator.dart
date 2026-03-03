/// Specialized implementation for Lovense Single Actuator devices implementing vibrate and oscillate features.
///
/// Reference: Buttplug Rust implementation (buttplug_server/src/device/protocol_impl/lovense/lovense_single_actuator.rs)
library core.protocol.lovense.lovense_single_actuator;

import 'dart:typed_data';
import 'dart:convert';

import '../../hardware/hardware.dart';
import '../../message/message.dart';
import '../../../util/logger.dart';
import 'lovense_base.dart';

/// Specialized implementation for Lovense Single Actuator devices implementing vibrate and oscillate features.
class LovenseSingleActuator extends LovenseBase {
  LovenseSingleActuator();

  @override
  List<HardwareCmd> handleOutputVibrateCmd({
    required int featureIndex,
    required String featureId,
    required int speed,
  }) {
    logger.d('Lovense Single Actuator vibrate command: Vibrate:$speed;');
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
    logger.d('Lovense Single Actuator oscillate command: Vibrate:$speed;');
    final Uint8List cmdData = utf8.encode('Vibrate:$speed;');
    return [
      HardwareWriteCmd(
        endpoint: Endpoint.tx,
        data: cmdData,
        writeWithResponse: false,
      ),
    ];
  }
}
