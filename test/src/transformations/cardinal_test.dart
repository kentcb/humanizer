import 'package:humanizer/src/transformations/cardinal.dart';
import 'package:test/test.dart';

void main() {
  _cardinalWords();
}

void _cardinalWords() {
  group('cardinal words', () {
    group('transform', () {
      void verifyTransform({
        required int input,
        required String expected,
      }) {
        const transformation = CardinalWordsTransformation();
        final result = transformation.transform(input, '');
        expect(result, expected);
      }

      test('correct output', () {
        verifyTransform(input: 0, expected: 'zero');
        verifyTransform(input: 1, expected: 'one');
        verifyTransform(input: 2, expected: 'two');
        verifyTransform(input: 3, expected: 'three');
        verifyTransform(input: 4, expected: 'four');
        verifyTransform(input: 5, expected: 'five');
        verifyTransform(input: 6, expected: 'six');
        verifyTransform(input: 7, expected: 'seven');
        verifyTransform(input: 8, expected: 'eight');
        verifyTransform(input: 9, expected: 'nine');
        verifyTransform(input: 10, expected: 'ten');
        verifyTransform(input: 11, expected: 'eleven');
        verifyTransform(input: 12, expected: 'twelve');
        verifyTransform(input: 13, expected: 'thirteen');
        verifyTransform(input: 14, expected: 'fourteen');
        verifyTransform(input: 15, expected: 'fifteen');
        verifyTransform(input: 16, expected: 'sixteen');
        verifyTransform(input: 17, expected: 'seventeen');
        verifyTransform(input: 18, expected: 'eighteen');
        verifyTransform(input: 19, expected: 'nineteen');
        verifyTransform(input: 20, expected: 'twenty');
        verifyTransform(input: 21, expected: 'twenty-one');
        verifyTransform(input: 22, expected: 'twenty-two');
        verifyTransform(input: 23, expected: 'twenty-three');
        verifyTransform(input: 24, expected: 'twenty-four');
        verifyTransform(input: 25, expected: 'twenty-five');
        verifyTransform(input: 26, expected: 'twenty-six');
        verifyTransform(input: 27, expected: 'twenty-seven');
        verifyTransform(input: 28, expected: 'twenty-eight');
        verifyTransform(input: 29, expected: 'twenty-nine');
        verifyTransform(input: 30, expected: 'thirty');
        verifyTransform(input: 101, expected: 'one hundred and one');
        verifyTransform(input: 103, expected: 'one hundred and three');
        verifyTransform(input: 105, expected: 'one hundred and five');
        verifyTransform(input: 111, expected: 'one hundred and eleven');
        verifyTransform(input: 123, expected: 'one hundred and twenty-three');
        verifyTransform(
          input: 13238189,
          expected: 'thirteen million two hundred and thirty-eight thousand one hundred and eighty-nine',
        );
      });

      test('negative values are supported', () {
        verifyTransform(input: -1, expected: 'negative one');
        verifyTransform(input: -2, expected: 'negative two');
        verifyTransform(input: -3, expected: 'negative three');
        verifyTransform(input: -4, expected: 'negative four');
        verifyTransform(input: -5, expected: 'negative five');
        verifyTransform(input: -6, expected: 'negative six');
        verifyTransform(input: -7, expected: 'negative seven');
        verifyTransform(input: -8, expected: 'negative eight');
        verifyTransform(input: -9, expected: 'negative nine');
        verifyTransform(input: -10, expected: 'negative ten');
        verifyTransform(input: -11, expected: 'negative eleven');
        verifyTransform(input: -12, expected: 'negative twelve');
        verifyTransform(input: -13, expected: 'negative thirteen');
        verifyTransform(input: -14, expected: 'negative fourteen');
        verifyTransform(input: -15, expected: 'negative fifteen');
        verifyTransform(input: -16, expected: 'negative sixteen');
        verifyTransform(input: -17, expected: 'negative seventeen');
        verifyTransform(input: -18, expected: 'negative eighteen');
        verifyTransform(input: -19, expected: 'negative nineteen');
        verifyTransform(input: -20, expected: 'negative twenty');
        verifyTransform(input: -21, expected: 'negative twenty-one');
        verifyTransform(input: -22, expected: 'negative twenty-two');
        verifyTransform(input: -23, expected: 'negative twenty-three');
        verifyTransform(input: -24, expected: 'negative twenty-four');
        verifyTransform(input: -25, expected: 'negative twenty-five');
        verifyTransform(input: -26, expected: 'negative twenty-six');
        verifyTransform(input: -27, expected: 'negative twenty-seven');
        verifyTransform(input: -28, expected: 'negative twenty-eight');
        verifyTransform(input: -29, expected: 'negative twenty-nine');
        verifyTransform(input: -30, expected: 'negative thirty');
        verifyTransform(input: -101, expected: 'negative one hundred and one');
        verifyTransform(input: -103, expected: 'negative one hundred and three');
        verifyTransform(input: -105, expected: 'negative one hundred and five');
        verifyTransform(input: -111, expected: 'negative one hundred and eleven');
        verifyTransform(input: -123, expected: 'negative one hundred and twenty-three');
        verifyTransform(
          input: -13238189,
          expected: 'negative thirteen million two hundred and thirty-eight thousand one hundred and eighty-nine',
        );
      });
    });
  });
}
