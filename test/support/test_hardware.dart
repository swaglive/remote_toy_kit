import 'dart:async';
import 'dart:typed_data';

import 'package:remote_toy_kit/src/core/hardware/hardware.dart';
import 'package:remote_toy_kit/src/core/message/message.dart';

class TestHardware implements Hardware {
  TestHardware({
    required this.name,
    this.connected = false,
  });

  @override
  String name;

  @override
  String id = 'test-id';

  @override
  List<Endpoint> endpoints = const [Endpoint.rx, Endpoint.tx];

  @override
  bool connected;

  @override
  Stream<bool> get connected$ => Stream<bool>.value(connected);

  final StreamController<HardwareEvent> _events =
      StreamController<HardwareEvent>.broadcast();

  @override
  Stream<HardwareEvent> get events$ => _events.stream;

  final List<HardwareWriteCmd> writes = [];
  final List<HardwareSubscribeCmd> subscriptions = [];

  Future<void> Function(HardwareWriteCmd cmd)? onWrite;

  void emit(HardwareEvent event) => _events.add(event);

  Future<void> dispose() => _events.close();

  @override
  Future<void> disconnect() async {}

  @override
  Future<void> execute({required HardwareCmd cmd}) async {
    switch (cmd) {
      case HardwareWriteCmd():
        await writeValue(cmd: cmd);
      case HardwareSubscribeCmd():
        await subscribe(cmd: cmd);
      case HardwareUnsubscribeCmd():
        await unsubscribe(cmd: cmd);
      case HardwareReadCmd():
        await readValue(cmd: cmd);
    }
  }

  @override
  Future<({Endpoint endpoint, Uint8List data})> readValue(
          {required HardwareReadCmd cmd}) =>
      throw UnimplementedError();

  @override
  Future<void> writeValue({required HardwareWriteCmd cmd}) async {
    writes.add(cmd);
    if (onWrite != null) {
      await onWrite!(cmd);
    }
  }

  @override
  Future<void> subscribe({required HardwareSubscribeCmd cmd}) async {
    subscriptions.add(cmd);
  }

  @override
  Future<void> unsubscribe({required HardwareUnsubscribeCmd cmd}) async {}
}
