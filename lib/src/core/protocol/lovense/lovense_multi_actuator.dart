/// Lovense Multi Actuator Protocol Handler
///
/// Reference: Buttplug Rust implementation (buttplug_server/src/device/protocol_impl/lovense/lovense_multi_actuator.rs)
library core.protocol.lovense.lovense_multi_actuator;

import 'dart:convert';

import '../../hardware/hardware.dart';
import '../../message/message.dart';
import '../../../util/logger.dart';
import 'lovense_base.dart';

/// Specialized implementation for Lovense Multi Actuator devices implementing vibrate and oscillate features.
class LovenseMultiActuator extends LovenseBase {
  LovenseMultiActuator({
    required this.outputCount,
  });

  /// Number of outputs (actuators count)
  final int outputCount;

  /// Tracks the current speed of each actuator so that updating one
  /// doesn't reset the others to zero in the Mply packet.
  late final List<int> _vibratorValues = List.filled(outputCount, 0);

  /// Generate the list of [HardwareCmd] based on updated [_vibratorValues]
  List<HardwareCmd> get _formPacket {
    return [
      HardwareWriteCmd(
        endpoint: Endpoint.tx,
        data: utf8.encode(
          'Mply:${_vibratorValues.map((v) => v.toString()).join(':')};',
        ),
        writeWithResponse: false,
      ),
    ];
  }

  @override
  List<HardwareCmd> handleOutputVibrateCmd({
    required int featureIndex,
    required String featureId,
    required int speed,
  }) {
    _vibratorValues[featureIndex] = speed;
    logger.d(
        'Lovense Multi Actuator vibrate command: Mply:${_vibratorValues.map((v) => v.toString()).join(':')};');

    return _formPacket;
  }

  @override
  List<HardwareCmd> handleOutputOscillateCmd({
    required int featureIndex,
    required String featureId,
    required int speed,
  }) {
    _vibratorValues[featureIndex] = speed.abs();
    logger.d(
        'Lovense Multi Actuator oscillate command: Mply:${_vibratorValues.map((v) => v.toString()).join(':')};');

    return _formPacket;
  }
}
