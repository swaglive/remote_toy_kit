import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:remote_toy_kit/remote_toy_kit.dart';

import 'device_provider.dart';
import 'feature_panel.dart';

class DevicePage extends StatefulWidget {
  const DevicePage({
    super.key,
    required this.device,
  });

  final RemoteToyDevice device;

  @override
  State<DevicePage> createState() => _DevicePageState();
}

class _DevicePageState extends State<DevicePage> {
  final PublishSubject<void> _stopDevice$ = PublishSubject();

  @override
  Widget build(BuildContext context) {
    final device = widget.device;
    return Scaffold(
      appBar: AppBar(
        title: Text(device.name()),
      ),
      body: DeviceProvider(
        device: device,
        stopDevice$: _stopDevice$,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: device.features.indexed.map((e) {
              final (index, clientDeviceFeature) = e;
              final child = FeaturePanel(
                featureIndex: clientDeviceFeature.featureIndex,
                clientDeviceFeature: clientDeviceFeature,
              );
              return child;
            }).toList(),
          ),
        ),
      ),
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          FloatingActionButton(
            onPressed: () {
              device
                  .executeCommand(message: const StopDeviceCmdClientMessage())
                  .then((_) {
                _stopDevice$.add(null);
              });
            },
            heroTag: 'btn-stop-all-cmd',
            child: const Icon(Icons.stop),
          ),
          const SizedBox(height: 8.0),
          FloatingActionButton(
            onPressed: () {
              device.disconnect().then((_) {
                if (context.mounted) {
                  Navigator.of(context).maybePop();
                }
              });
            },
            heroTag: 'btn-disconnect',
            child: const Icon(Icons.close),
          ),
        ],
      ),
    );
  }
}
