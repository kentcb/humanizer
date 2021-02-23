import 'package:humanizer/humanizer.dart';
import 'package:humanizer/src/units_of_measurement/decimals.dart';
import 'package:test/test.dart';

void main() {
  _temperatureUnits();
  _celsius();
  _fahrenheit();
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
        final sut = Temperature.fromCelsius(di(value));
        expect(sut.celsius, di(value));
      });
    });
  });
}

void _fahrenheit() {
  group('Fahrenheit', () {
    test('converts as expected', () {
      <int>[100, 42].forEach((value) {
        final sut = Temperature.fromFahrenheit(di(value));
        expect(sut.fahrenheit, di(value));
      });
    });
  });
}
