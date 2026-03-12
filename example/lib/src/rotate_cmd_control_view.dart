import 'dart:async';

import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:remote_toy_kit/remote_toy_kit.dart';
import 'package:remote_toy_kit_example/src/device_provider.dart';

class RotateCmdControlView extends StatefulWidget {
  const RotateCmdControlView({
    super.key,
    required this.featureIndex,
    required this.clientDeviceFeature,
    required this.outputType,
  });

  final int featureIndex;
  final RemoteToyDeviceFeature clientDeviceFeature;
  final OutputType outputType;

  @override
  State<RotateCmdControlView> createState() => _RotateCmdControlViewState();
}

class _RotateCmdControlViewState extends State<RotateCmdControlView> {
  final BehaviorSubject<double> _value$ = BehaviorSubject.seeded(0.0);
  final BehaviorSubject<bool> _clockwiseValue$ = BehaviorSubject.seeded(false);

  RemoteToyDevice? _device;
  StreamSubscription<void>? _stopDeviceSubscription;

  @override
  void initState() {
    Rx.combineLatest2(
            _value$, _clockwiseValue$, (value, clockwise) => (value, clockwise))
        .skip(1)
        .throttleTime(const Duration(milliseconds: 100), trailing: true)
        .listen((event) {
      final (value, clockwise) = event;

      // Convert value: if clockwise is true, value is positive, otherwise negative
      final convertedValue = clockwise ? value : -value;

      final clientOutputCommand = ClientDeviceOutputCommand.tryFrom(
          widget.outputType,
          ClientDeviceCommandValue.fromDouble(value: convertedValue));
      if (clientOutputCommand == null) {
        return;
      }

      final OutputCmd outputCmd = widget.clientDeviceFeature
          .convertClientCmdtoOutputCmd(clientOutputCommand);

      _device?.executeCommand(
        message: OutputCmdClientMessage(command: outputCmd),
      );
    });
    super.initState();
  }

  @override
  void didChangeDependencies() {
    final provider = DeviceProvider.of(context);
    _device = provider.device;

    _stopDeviceSubscription?.cancel();
    _stopDeviceSubscription = provider.stopDevice$.listen((_) {
      _value$.add(0.0);
      _clockwiseValue$.add(false);
    });
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: StreamBuilder<double>(
              initialData: _value$.value,
              stream: _value$,
              builder: (context, snapshot) {
                return Slider(
                    value: snapshot.data ?? _value$.value,
                    onChanged: (val) {
                      _value$.add(val);
                    });
              }),
        ),
        const Text('Clockwise'),
        StreamBuilder<bool>(
            initialData: _clockwiseValue$.value,
            stream: _clockwiseValue$,
            builder: (context, snapshot) {
              return Checkbox(
                  value: snapshot.data,
                  onChanged: (val) {
                    _clockwiseValue$.add(val ?? false);
                  });
            })
      ],
    );
  }
}
