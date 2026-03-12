import 'dart:async';

import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:remote_toy_kit/remote_toy_kit.dart';
import 'package:remote_toy_kit_example/src/device_provider.dart';

class ScalarCmdControlView extends StatefulWidget {
  const ScalarCmdControlView({
    super.key,
    required this.featureIndex,
    required this.clientDeviceFeature,
    required this.outputType,
  });

  final int featureIndex;
  final OutputType outputType;
  final RemoteToyDeviceFeature clientDeviceFeature;

  @override
  State<ScalarCmdControlView> createState() => _ScalarCmdControlViewState();
}

class _ScalarCmdControlViewState extends State<ScalarCmdControlView> {
  final BehaviorSubject<double> _value$ = BehaviorSubject.seeded(0.0);

  RemoteToyDevice? _device;
  StreamSubscription<void>? _stopDeviceSubscription;

  @override
  void initState() {
    _value$
        .skip(1)
        .throttleTime(const Duration(milliseconds: 100), trailing: true)
        .listen((value) {
      switch (widget.outputType) {
        case OutputType.vibrate:
        case OutputType.constrict:
        case OutputType.oscillate:
          final clientOutputCommand = ClientDeviceOutputCommand.tryFrom(
              widget.outputType,
              ClientDeviceCommandValue.fromDouble(value: value));
          if (clientOutputCommand == null) {
            break;
          }

          final OutputCmd outputCmd = widget.clientDeviceFeature
              .convertClientCmdtoOutputCmd(clientOutputCommand);

          _device?.executeCommand(
            message: OutputCmdClientMessage(command: outputCmd),
          );
          break;
        default:
          break;
      }
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
    });
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<double>(
        initialData: _value$.value,
        stream: _value$,
        builder: (context, snapshot) {
          return Slider(
              value: snapshot.data ?? _value$.value,
              onChanged: (val) {
                _value$.add(val);
              });
        });
  }
}
