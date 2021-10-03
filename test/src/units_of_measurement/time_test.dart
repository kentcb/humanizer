import 'package:humanizer/humanizer.dart';
import 'package:humanizer/src/units_of_measurement/decimals.dart';
import 'package:test/test.dart';

void main() {
  _timeUnits();
  _toString();
}

void _timeUnits() {
  group('time units', () {
    test('all contains all units', () {
      final all = TimeUnit.values.toSet();
      final missing = all.difference(TimeUnits.all);
      expect(missing, <TimeUnit>{});
    });
  });
}

void _toString() {
  group('toString', () {
    test('Time toString formats using defaults', () {
      void verify({
        required Time value,
        required String expected,
      }) =>
          expect(value.toString(), expected);

      verify(value: Time.fromMinutes(di(3)), expected: '3min');
      verify(value: Time.fromHours(di(3)), expected: '3hr');
      verify(value: Time.fromHours(ds('812.7161')), expected: '1.11mo');
    });

    test('TimeRate toString formats using defaults', () {
      void verify({
        required TimeRate value,
        required String expected,
      }) =>
          expect(value.toString(), expected);

      verify(value: Time.fromMinutes(di(30)).per(const Duration(minutes: 1)), expected: '30s/s');
      verify(value: Time.fromDays(ds('0.1')).per(const Duration(minutes: 1)), expected: '6d/hr');
    });
  });
}
