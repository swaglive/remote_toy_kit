import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:remote_toy_kit/remote_toy_kit.dart';
import 'package:remote_toy_kit_example/src/device_provider.dart';

class SensorReadCmdControlView extends StatefulWidget {
  const SensorReadCmdControlView({
    super.key,
    required this.featureIndex,
    required this.clientDeviceFeature,
    required this.inputType,
  });

  final int featureIndex;
  final InputType inputType;
  final RemoteToyDeviceFeature clientDeviceFeature;

  @override
  State<SensorReadCmdControlView> createState() =>
      _SensorReadCmdControlViewState();
}

class _SensorReadCmdControlViewState extends State<SensorReadCmdControlView> {
  final BehaviorSubject<Uint8List?> _value$ = BehaviorSubject.seeded(null);

  RemoteToyDevice? _device;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    _device = DeviceProvider.of(context).device;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 4.0, right: 16.0, bottom: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: [
          TextButton(
            onPressed: () {
              _device?.executeCommand(
                message: RemoteToyClientMessage.inputCmd(
                  command: InputCmdV4(
                    featureIndex: widget.featureIndex,
                    inputType: widget.inputType,
                    inputCommandType: InputCommandType.read,
                  ),
                ),
              );
            },
            child: const Text('Read Sensor'),
          ),
          StreamBuilder<Uint8List?>(
              stream: _value$,
              builder: (context, snapshot) {
                final data = snapshot.data;
                if (data == null || data.isEmpty) return const SizedBox();
                if (widget.inputType == InputType.battery) {
                  return Text('${data.first}');
                }
                return Text(data.toString());
              }),
        ],
      ),
    );
  }
}
