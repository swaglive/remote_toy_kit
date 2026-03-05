import 'dart:async';

/// A broadcast [StreamController] that retains the latest value.
///
/// Mirrors the subset of `BehaviorSubject` used in this SDK:
/// seeded initial value, synchronous [value] access, and standard
/// [add] / [stream] / [close] / [isClosed] interface.
class ValueStreamController<T> {
  ValueStreamController(T seed) : _value = seed;

  final StreamController<T> _controller = StreamController<T>.broadcast();

  T _value;

  T get value => _value;

  Stream<T> get stream => _controller.stream;

  bool get isClosed => _controller.isClosed;

  void add(T event) {
    _value = event;
    _controller.add(event);
  }

  Future<void> close() => _controller.close();
}
