import 'package:flutter/material.dart';
import 'package:remote_toy_kit/remote_toy_kit.dart';
import 'package:remote_toy_kit_example/src/rotate_cmd_control_view.dart';
import 'package:remote_toy_kit_example/src/scalar_cmd_control_view.dart';
import 'package:remote_toy_kit_example/src/sensor_read_cmd_control_view.dart';

class FeaturePanel extends StatelessWidget {
  const FeaturePanel({
    super.key,
    required this.featureIndex,
    required this.clientDeviceFeature,
  });

  final int featureIndex;
  final RemoteToyDeviceFeature clientDeviceFeature;

  @override
  Widget build(BuildContext context) {
    final outputType =
        OutputType.tryFrom(value: clientDeviceFeature.featureType);
    List<Widget> views = [];
    if (outputType != null) {
      final feature = clientDeviceFeature.feature;
      views.addAll(feature.output?.outputTypes.map((e) {
            switch (e) {
              case OutputType.vibrate:
              case OutputType.oscillate:
              case OutputType.constrict:
                return ScalarCmdControlView(
                  featureIndex: featureIndex,
                  clientDeviceFeature: clientDeviceFeature,
                  outputType: e,
                );
              case OutputType.rotate:
                return RotateCmdControlView(
                  featureIndex: featureIndex,
                  clientDeviceFeature: clientDeviceFeature,
                  outputType: e,
                );
              default:
                return const SizedBox.shrink();
            }
          }) ??
          []);
    }
    final inputType = InputType.tryFrom(type: clientDeviceFeature.featureType);
    if (inputType != null) {
      views.add(SensorReadCmdControlView(
        featureIndex: featureIndex,
        clientDeviceFeature: clientDeviceFeature,
        inputType: inputType,
      ));
    }
    return Card(
      margin: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 8.0, left: 16.0),
            child: Text(
              clientDeviceFeature.feature.description.isNotEmpty
                  ? clientDeviceFeature.feature.description
                  : clientDeviceFeature.featureType.name,
              style: Theme.of(context)
                  .textTheme
                  .titleMedium
                  ?.copyWith(fontWeight: FontWeight.w600),
            ),
          ),
          ...views,
        ],
      ),
    );
  }
}
