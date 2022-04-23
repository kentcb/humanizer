import 'package:humanizer/humanizer.dart';
import 'package:test/test.dart';

void main() {
  _functionTransformation();
}

void _functionTransformation() {
  group('function transformation', () {
    test('function is invoked to perform transformation', () {
      final toStringTransformation = FunctionTransformation<Object, String>(
          (input, locale) => input.toString());
      expect(
        toStringTransformation.transform(42, 'en'),
        '42',
      );
      expect(
        toStringTransformation.transform(
            const Duration(hours: 1, minutes: 12, seconds: 5), 'en'),
        '1:12:05.000000',
      );
    });
  });
}
