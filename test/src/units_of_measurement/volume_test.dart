import 'package:humanizer/humanizer.dart';
import 'package:test/test.dart';

void main() {
  _volumeUnits();
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
