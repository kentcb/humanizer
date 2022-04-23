import 'package:humanizer/humanizer.dart';
import 'package:humanizer/src/units_of_measurement/rationals.dart';
import 'package:intl/intl.dart';
import 'package:test/test.dart';

void main() {
  _quantityUnits();
  _toString();
}

void _quantityUnits() {
  group('quantity units', () {
    test('all contains all units', () {
      final all = QuantityUnit.values.toSet();
      final missing = all.difference(QuantityUnits.all);
      expect(missing, <QuantityUnit>{});
    });
  });
}

void _toString() {
  group('toString', () {
    test('Quantity toString formats using defaults', () {
      void verify({
        required String locale,
        required Quantity value,
        required String expected,
      }) =>
          Intl.withLocale(locale, () => expect(value.toString(), expected));

      verify(
        locale: 'en_US',
        value: Quantity.fromOnes(Rational.fromInt(3)),
        expected: '3',
      );
      verify(
        locale: 'en_US',
        value: Quantity.fromOnes(Rational.fromInt(2000)),
        expected: '2K',
      );
      verify(
        locale: 'en_US',
        value: Quantity.fromMillions(Rational.fromInt(8127161, 10000)),
        expected: '812.72M',
      );
      verify(
        locale: 'en_GB',
        value: Quantity.fromOnes(Rational.fromInt(2000)),
        expected: '2k',
      );
      verify(
        locale: 'en_GB',
        value: Quantity.fromMillions(Rational.fromInt(8127161, 10000)),
        expected: '812.72m',
      );
    });

    test('Unit names are not pluralized', () {
      void verify({
        required String pattern,
        required Quantity value,
        required String expected,
      }) {
        final format = QuantityFormat(
          pattern: pattern,
          locale: 'en',
        );
        final result = format.format(value);
        expect(result, expected);
      }

      verify(
        pattern: '0.# U',
        value: Quantity.fromThousands(Rational.fromInt(3)),
        expected: '3 thousand',
      );
      verify(
        pattern: '0.# U',
        value: Quantity.fromMillions(Rational.fromInt(42)),
        expected: '42 million',
      );
    });

    test('QuantityRate toString formats using defaults', () {
      void verify({
        required QuantityRate value,
        required String expected,
      }) =>
          expect(value.toString(), expected);

      verify(
          value: Quantity.fromOnes(Rational.fromInt(30))
              .per(const Duration(seconds: 1)),
          expected: '30/s');
      verify(
          value: Quantity.fromThousands(Rational.fromInt(15))
              .per(const Duration(minutes: 1)),
          expected: '15K/min');
    });
  });
}
