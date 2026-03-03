import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:remote_toy_kit/remote_toy_kit.dart';

class DeviceProvider extends InheritedWidget {
  const DeviceProvider({
    super.key,
    required super.child,
    required this.device,
    required PublishSubject<void> stopDevice$,
  }) : _stopDevice$ = stopDevice$;

  static DeviceProvider of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<DeviceProvider>()!;

  final RemoteToyDevice device;
  final PublishSubject<void> _stopDevice$;

  Stream<void> get stopDevice$ => _stopDevice$.stream;

  void stopDevice() => _stopDevice$.add(null);

  @override
  bool updateShouldNotify(covariant DeviceProvider oldWidget) {
    return device != oldWidget.device || _stopDevice$ != oldWidget._stopDevice$;
  }
}
