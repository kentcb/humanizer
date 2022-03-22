import 'package:humanizer/humanizer.dart';
import 'package:humanizer/src/units_of_measurement/rationals.dart';
import 'package:test/test.dart';

void main() {
  _lengthUnits();
  _toString();
}

void _lengthUnits() {
  group('length units', () {
    test('all contains all units', () {
      final all = LengthUnit.values.toSet();
      final missing = all.difference(LengthUnits.all);
      expect(missing, <LengthUnit>{});
    });
  });
}

void _toString() {
  group('toString', () {
    test('Length toString formats using defaults', () {
      void verify({
        required Length value,
        required String expected,
      }) =>
          expect(value.toString(), expected);

      verify(value: Length.fromMeters(ri(3)), expected: '3m');
      verify(value: Length.fromCentimeters(ri(3)), expected: '3cm');
      verify(value: Length.fromMeters(rs('812.7161')), expected: '812.72m');
    });

    test('LengthRate toString formats using defaults', () {
      void verify({
        required LengthRate value,
        required String expected,
      }) =>
          expect(value.toString(), expected);

      verify(value: Length.fromMeters(ri(30)).per(const Duration(minutes: 1)), expected: '30m/min');
      verify(value: Length.fromMeters(rs('0.1')).per(const Duration(minutes: 1)), expected: '6m/hr');
    });
  });
}
