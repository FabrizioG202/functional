import 'package:test/test.dart';
import 'package:functional/functional.dart';

void main() {
  group('PanicError', () {
    test('should create a PanicError with message', () {
      const message = 'Test panic message';
      final error = PanicError(message);

      expect(error.message, equals(message));
      expect(error.toString(), equals(message));
    });
  });

  group('panic function', () {
    test('should throw PanicError with the given message', () {
      const message = 'Test panic message';

      expect(() => panic(message), throwsA(isA<PanicError>()));
      try {
        panic(message);
      } catch (e) {
        expect(e, isA<PanicError>());
        expect((e as PanicError).message, equals(message));
      }
    });
  });

  group('panicFn function', () {
    test('should return a function that throws PanicError when called', () {
      const message = 'Test panic function message';
      final fn = panicFn(message);

      expect(() => fn(), throwsA(isA<PanicError>()));
      try {
        fn();
      } catch (e) {
        expect(e, isA<PanicError>());
        expect((e as PanicError).message, equals(message));
      }
    });
  });

  group('FunctionalX extension', () {
    test('let should apply the function to the value', () {
      const value = 'test';
      final result = value.let((it) => it.toUpperCase());

      expect(result, equals('TEST'));
    });

    test('let should work with different return types', () {
      const value = 'test';
      final result = value.let((it) => it.length);

      expect(result, equals(4));
    });
  });

  group('NullableX extension', () {
    test('whenNull should return the value when not null', () {
      const String? value = 'not null';
      final result = value.whenNull(() => 'default');

      expect(result, equals('not null'));
    });

    test('whenNull should return the default when value is null', () {
      const String? value = null;
      final result = value.whenNull(() => 'default');

      expect(result, equals('default'));
    });
  });
}
