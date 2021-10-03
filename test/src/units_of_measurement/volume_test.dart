import 'package:humanizer/humanizer.dart';
import 'package:humanizer/src/units_of_measurement/decimals.dart';
import 'package:test/test.dart';

void main() {
  _volumeUnits();
  _toString();
}

void _volumeUnits() {
  group('volume units', () {
    test('all contains all units', () {
      final all = VolumeUnit.values.toSet();
      final missing = all.difference(VolumeUnits.all);
      expect(missing, <VolumeUnit>{});
    });
  });
}

void _toString() {
  group('toString', () {
    test('Volume toString formats using defaults', () {
      void verify({
        required Volume value,
        required String expected,
      }) =>
          expect(value.toString(), expected);

      verify(value: Volume.fromCubicMeters(di(3)), expected: '3000L');
      verify(value: Volume.fromMilliliters(di(3)), expected: '3mL');
      verify(value: Volume.fromCubicMeters(ds('812.71615')), expected: '812716.15L');
    });

    test('VolumeRate toString formats using defaults', () {
      void verify({
        required VolumeRate value,
        required String expected,
      }) =>
          expect(value.toString(), expected);

      verify(value: Volume.fromCubicMeters(di(30)).per(const Duration(minutes: 1)), expected: '500L/s');
      verify(value: Volume.fromCubicMeters(ds('0.1')).per(const Duration(minutes: 1)), expected: '100L/min');
    });
  });
}
