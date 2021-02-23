import 'package:humanizer/humanizer.dart';
import 'package:test/test.dart';

void main() {
  _informationUnits();
}

void _informationUnits() {
  group('information units', () {
    test('all contains all units', () {
      final all = InformationUnit.values.toSet();
      final missing = all.difference(InformationUnits.all);
      expect(missing, <InformationUnit>{});
    });
  });
}
