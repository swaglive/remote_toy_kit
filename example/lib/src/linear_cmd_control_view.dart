import 'dart:async';

import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:remote_toy_kit/remote_toy_kit.dart';
import 'package:remote_toy_kit_example/src/device_provider.dart';

class LinearCmdControlView extends StatefulWidget {
  const LinearCmdControlView({
    super.key,
    required this.featureIndex,
    required this.stepRange,
  });

  final int featureIndex;
  final RangeInclusive? stepRange;

  @override
  State<LinearCmdControlView> createState() => _LinearCmdControlViewState();
}

class _LinearCmdControlViewState extends State<LinearCmdControlView> {
  final BehaviorSubject<double> _position$ = BehaviorSubject.seeded(0.0);
  final BehaviorSubject<double> _duration$ = BehaviorSubject.seeded(1.0);

  RemoteToyDevice? _device;
  StreamSubscription<void>? _stopDeviceSubscription;

  @override
  void initState() {
    Rx.combineLatest2(
            _position$,
            _duration$,
            (position, duration) =>
                (position, Duration(milliseconds: (3000 * duration).toInt())))
        .skip(1)
        .throttleTime(const Duration(milliseconds: 100), trailing: true)
        .listen((event) {
      final (position, duration) = event;
      _device?.executeCommand(
        message: LinearCmdClientMessage(vectors: [
          VectorSubcommand(
            featureIndex: widget.featureIndex,
            duration: duration,
            position: position,
          ),
        ]),
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
      _position$.add(0.0);
      _duration$.add(1.0);
    });
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            const Text('Position'),
            Expanded(
              child: StreamBuilder<double>(
                  initialData: _position$.value,
                  stream: _position$,
                  builder: (context, snapshot) {
                    return Slider(
                        value: snapshot.data ?? _position$.value,
                        divisions: widget.stepRange?.count ?? 0,
                        onChanged: (val) {
                          _position$.add(val);
                        });
                  }),
            ),
          ],
        ),
        Row(
          children: [
            const Text('Duration'),
            Expanded(
              child: StreamBuilder<double>(
                  initialData: _duration$.value,
                  stream: _duration$,
                  builder: (context, snapshot) {
                    return Slider(
                        value: snapshot.data ?? _duration$.value,
                        onChanged: (val) {
                          _duration$.add(val);
                        });
                  }),
            ),
          ],
        ),
      ],
    );
  }
}
