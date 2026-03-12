import 'package:flutter_test/flutter_test.dart';
import 'package:remote_toy_kit/src/util/value_stream_controller.dart';

void main() {
  group('ValueStreamController', () {
    late ValueStreamController<int> controller;

    setUp(() {
      controller = ValueStreamController<int>(0);
    });

    tearDown(() async {
      if (!controller.isClosed) {
        await controller.close();
      }
    });

    test('exposes seed as initial value', () {
      // Assert
      expect(controller.value, 0);
    });

    test('updates value synchronously on add', () {
      // Act
      controller.add(42);

      // Assert
      expect(controller.value, 42);
    });

    test('emits events to stream listeners', () async {
      // Arrange
      final values = <int>[];
      controller.stream.listen(values.add);

      // Act
      controller.add(1);
      controller.add(2);
      controller.add(3);
      await Future<void>.delayed(Duration.zero);

      // Assert
      expect(values, [1, 2, 3]);
    });

    test('supports multiple listeners (broadcast)', () async {
      // Arrange
      final a = <int>[];
      final b = <int>[];
      controller.stream.listen(a.add);
      controller.stream.listen(b.add);

      // Act
      controller.add(10);
      await Future<void>.delayed(Duration.zero);

      // Assert
      expect(a, [10]);
      expect(b, [10]);
    });

    test('isClosed returns false before close and true after', () async {
      // Assert
      expect(controller.isClosed, false);

      // Act
      await controller.close();

      // Assert
      expect(controller.isClosed, true);
    });

    test('retains last value after multiple adds', () {
      // Act
      controller.add(1);
      controller.add(2);
      controller.add(99);

      // Assert
      expect(controller.value, 99);
    });

    test('works with nullable types', () async {
      // Arrange
      final nullableController = ValueStreamController<String?>(null);
      final values = <String?>[];
      nullableController.stream.listen(values.add);

      // Act
      nullableController.add('hello');
      nullableController.add(null);
      nullableController.add('world');
      await Future<void>.delayed(Duration.zero);

      // Assert
      expect(nullableController.value, 'world');
      expect(values, ['hello', null, 'world']);

      await nullableController.close();
    });
  });
}
