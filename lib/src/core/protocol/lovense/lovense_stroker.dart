/// Lovense Stroker Protocol Handler
///
/// Reference: Buttplug Rust implementation (buttplug_server/src/device/protocol_impl/lovense/lovense_stroker.rs)
library core.protocol.lovense.lovense_stroker;

import 'dart:convert';
import 'dart:math' as math;
import 'dart:typed_data';

import '../../hardware/hardware.dart';
import '../../message/message.dart';
import '../../../util/logger.dart';
import 'lovense_base.dart';

/// Specialized implementation for Lovense Stroker devices implementing position with duration and oscillate features.
class LovenseStroker extends LovenseBase {
  LovenseStroker({
    required this.hardware,
    required this.needRangeZerod,
  }) {
    _updateLinearMovement(hardware: hardware, linearInfo: linearInfo);
  }

  final Hardware hardware;
  final bool needRangeZerod;
  LinearInfo linearInfo = (0, 0);

  @override
  List<HardwareCmd> handleOutputPositionWithDurationCmd({
    required int featureIndex,
    required String featureId,
    required int position,
    required int duration,
  }) {
    linearInfo = (position, duration);
    return [];
  }

  @override
  List<HardwareCmd> handleOutputOscillateCmd({
    required int featureIndex,
    required String featureId,
    required int speed,
  }) {
    logger.d(
        'Lovense Stroker oscillate command: Mply:$speed:${(speed == 0 && needRangeZerod) ? 0 : 20};');

    final Uint8List cmdData =
        utf8.encode('Mply:$speed:${(speed == 0 && needRangeZerod) ? 0 : 20};');

    return [
      HardwareWriteCmd(
        endpoint: Endpoint.tx,
        data: cmdData,
        writeWithResponse: false,
      ),
    ];
  }

  /// Update the linear movement of the Lovense device
  ///
  /// [hardware] is the hardware instance
  /// [linearInfo] is a pair of (Position, Duration)
  void _updateLinearMovement({
    required Hardware hardware,
    required (int, int) linearInfo,
  }) {
    int lastGoalPosition = 0, currentMoveAmount = 0, currentPosition = 0;
    Future<void> loop() async {
      // If there is no connection, break the loop
      if (!hardware.connected) return;

      // See if we've updated our goal position
      final int goalPosition = linearInfo.$1;
      // If we have and it's not the same, recalculate based on current status.
      if (lastGoalPosition != goalPosition) {
        lastGoalPosition = goalPosition;
        // We move every 100ms, so divide the movement into that many chunks.
        // If we're moving so fast it'd be under our 100ms boundary, just move in 1 step.
        final moveSteps = math.max(linearInfo.$2 ~/ 100, 1);
        currentMoveAmount = (goalPosition - currentPosition) ~/ moveSteps;
      }

      // If we aren't going anywhere, just pause then restart
      if (currentPosition == lastGoalPosition) {
        Future.delayed(const Duration(milliseconds: 100), loop);
        return;
      }

      // Update our position, make sure we don't overshoot
      currentPosition += currentMoveAmount;
      if (currentMoveAmount < 0) {
        if (currentPosition < lastGoalPosition) {
          currentPosition = lastGoalPosition;
        }
      } else {
        if (currentPosition > lastGoalPosition) {
          currentPosition = lastGoalPosition;
        }
      }

      final Uint8List cmdData = utf8.encode('FSetSite:$currentPosition;');
      final HardwareWriteCmd hardwareCmd = HardwareWriteCmd(
        endpoint: Endpoint.tx,
        data: cmdData,
        writeWithResponse: false,
      );
      try {
        await hardware.writeValue(cmd: hardwareCmd);
        Future.delayed(const Duration(milliseconds: 100), loop);
      } catch (e) {
        logger.d('Update linear movement error, stop loop');
      }
    }

    loop();
  }
}
