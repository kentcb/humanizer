import 'package:humanizer/humanizer.dart';
import 'package:test/test.dart';

void main() {
  _areaUnits();
}

void _areaUnits() {
  group('area units', () {
    test('all contains all units', () {
      final all = AreaUnit.values.toSet();
      final missing = all.difference(AreaUnits.all);
      expect(missing, <AreaUnit>{});
    });
  });
}
