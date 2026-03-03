/// Lovense Dual Actuator Protocol Handler
///
/// Reference: Buttplug Rust implementation (buttplug_server/src/device/protocol_impl/lovense/lovense_dual_actuator.rs)
library core.protocol.lovense.lovense_dual_actuator;

import 'dart:typed_data';
import 'dart:convert';

import '../../hardware/hardware.dart';
import '../../message/message.dart';
import '../../../util/logger.dart';
import 'lovense_base.dart';

/// Specialized implementation for Lovense Dual Actuator devices implementing vibrate and oscillate features.
class LovenseDualActuator extends LovenseBase {
  LovenseDualActuator();

  /// Handle the vibrate command for the dual-actuator Lovense device
  @override
  List<HardwareCmd> handleOutputVibrateCmd({
    required int featureIndex,
    required String featureId,
    required int speed,
  }) {
    logger.d(
        'Lovense Dual Actuator vibrate command: Vibrate${featureIndex + 1}:$speed;');

    final Uint8List cmdData = utf8.encode('Vibrate${featureIndex + 1}:$speed;');
    return [
      HardwareWriteCmd(
        endpoint: Endpoint.tx,
        data: cmdData,
        writeWithResponse: false,
      ),
    ];
  }

  /// Handle the oscillate command for the dual-actuator Lovense device
  @override
  List<HardwareCmd> handleOutputOscillateCmd({
    required int featureIndex,
    required String featureId,
    required int speed,
  }) {
    logger.d(
        'Lovense Dual Actuator oscillate command: Vibrate${featureIndex + 1}:$speed;');
    final Uint8List cmdData = utf8.encode('Vibrate${featureIndex + 1}:$speed;');
    return [
      HardwareWriteCmd(
        endpoint: Endpoint.tx,
        data: cmdData,
        writeWithResponse: false,
      ),
    ];
  }
}
