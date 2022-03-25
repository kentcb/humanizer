// ignore_for_file: avoid_function_literals_in_foreach_calls

import 'package:humanizer/humanizer.dart';
import 'package:humanizer/src/units_of_measurement/rationals.dart';
import 'package:test/test.dart';

void main() {
  _temperatureUnits();
  _celsius();
  _fahrenheit();
  _toString();
}

void _temperatureUnits() {
  group('temperature units', () {
    test('all contains all units', () {
      final all = TemperatureUnit.values.toSet();
      final missing = all.difference(TemperatureUnits.all);
      expect(missing, <TemperatureUnit>{});
    });
  });
}

void _celsius() {
  group('Celsius', () {
    test('converts as expected', () {
      <int>[0, 100, 42].forEach((value) {
        final sut = Temperature.fromCelsius(Rational.fromInt(value));
        expect(sut.celsius, Rational.fromInt(value));
      });
    });
  });
}

void _fahrenheit() {
  group('Fahrenheit', () {
    test('converts as expected', () {
      <int>[100, 42].forEach((value) {
        final sut = Temperature.fromFahrenheit(Rational.fromInt(value));
        expect(sut.fahrenheit, Rational.fromInt(value));
      });
    });
  });
}

void _toString() {
  group('toString', () {
    test('Temperature toString formats using defaults', () {
      void verify({
        required Temperature value,
        required String expected,
      }) =>
          expect(value.toString(), expected);

      verify(value: Temperature.fromCelsius(Rational.fromInt(3)), expected: '3°C');
      verify(value: Temperature.fromFahrenheit(Rational.fromInt(8127161, 10000)), expected: '433.73°C');
    });

    test('TemperatureRate toString formats using defaults', () {
      void verify({
        required TemperatureRate value,
        required String expected,
      }) =>
          expect(value.toString(), expected);

      verify(
          value: Temperature.fromCelsius(Rational.fromInt(30)).per(const Duration(minutes: 1)), expected: '30°C/min');
      verify(
          value: Temperature.fromFahrenheit(Rationals.tenth).per(const Duration(minutes: 1)), expected: '-17.72°C/min');
    });
  });
}
