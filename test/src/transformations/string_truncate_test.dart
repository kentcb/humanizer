import 'package:test/test.dart';
import 'package:humanizer/humanizer.dart';

void main() {
  group('truncate', () {
    _truncateFixedLength();
    _truncateFixedNonWhitespaceLength();
    _truncateFixedWordLength();
  });
}

void _truncateFixedLength() {
  group('truncate fixed length', () {
    void verifyTruncateFixedLength({
      required String input,
      required int length,
      required String expected,
      String truncationIndicator = '…',
      TruncateAt truncateAt = TruncateAt.end,
    }) {
      test(
        '$input : $length : $truncationIndicator : $truncateAt → $expected',
        () {
          final transformation = TruncateToFixedLengthTransformation(
            length: length,
            truncationIndicator: truncationIndicator,
            truncateAt: truncateAt,
          );
          final result = transformation.transform(input, '');
          expect(result, expected);
        },
      );
    }

    verifyTruncateFixedLength(
      input: '',
      length: 0,
      expected: '',
    );
    verifyTruncateFixedLength(
      input: '',
      length: 10,
      expected: '',
    );
    verifyTruncateFixedLength(
      input: 'A',
      length: 1,
      expected: 'A',
    );
    verifyTruncateFixedLength(
      input: 'A',
      length: 10,
      expected: 'A',
    );

    verifyTruncateFixedLength(
      input: 'Some text that is too long',
      length: 10,
      expected: 'Some text…',
    );
    verifyTruncateFixedLength(
      input: 'Some text that is too long',
      length: 10,
      expected: '… too long',
      truncateAt: TruncateAt.start,
    );

    verifyTruncateFixedLength(
      input: 'Some text that is too long',
      length: 10,
      expected: 'Some te---',
      truncationIndicator: '---',
    );
    verifyTruncateFixedLength(
      input: 'Some text that is too long',
      length: 10,
      expected: '---oo long',
      truncateAt: TruncateAt.start,
      truncationIndicator: '---',
    );

    verifyTruncateFixedLength(
      input: 'Text',
      length: 2,
      expected: 'Te',
      truncationIndicator: '---',
    );

    verifyTruncateFixedLength(
      input: 'Some text with 😎 an emoji',
      length: 19,
      expected: 'Some text with 😎 a…',
    );
    verifyTruncateFixedLength(
      input: 'Some text with 😎 an emoji',
      length: 13,
      expected: '…h 😎 an emoji',
      truncateAt: TruncateAt.start,
    );
  });
}

void _truncateFixedNonWhitespaceLength() {
  group('truncate fixed non-whitespace length', () {
    void verifyTruncateFixedNonWhitespaceLength({
      required String input,
      required int length,
      required String expected,
      String truncationIndicator = '…',
      TruncateAt truncateAt = TruncateAt.end,
    }) {
      test(
        '$input : $length : $truncationIndicator : $truncateAt → $expected',
        () {
          final transformation = TruncateToFixedNonWhitespaceLengthTransformation(
            length: length,
            truncationIndicator: truncationIndicator,
            truncateAt: truncateAt,
          );
          final result = transformation.transform(input, '');
          expect(result, expected);
        },
      );
    }

    verifyTruncateFixedNonWhitespaceLength(
      input: '',
      length: 0,
      expected: '',
    );
    verifyTruncateFixedNonWhitespaceLength(
      input: '',
      length: 10,
      expected: '',
    );
    verifyTruncateFixedNonWhitespaceLength(
      input: 'A',
      length: 1,
      expected: 'A',
    );
    verifyTruncateFixedNonWhitespaceLength(
      input: 'A',
      length: 10,
      expected: 'A',
    );

    verifyTruncateFixedNonWhitespaceLength(
      input: 'Some text that is too long',
      length: 10,
      expected: 'Some text t…',
    );
    verifyTruncateFixedNonWhitespaceLength(
      input: 'Some text that is too long',
      length: 10,
      expected: '…is too long',
      truncateAt: TruncateAt.start,
    );

    verifyTruncateFixedNonWhitespaceLength(
      input: 'Some text that is too long',
      length: 10,
      expected: 'Some tex---',
      truncationIndicator: '---',
    );
    verifyTruncateFixedNonWhitespaceLength(
      input: 'Some text that is too long',
      length: 10,
      expected: '---too long',
      truncateAt: TruncateAt.start,
      truncationIndicator: '---',
    );

    verifyTruncateFixedNonWhitespaceLength(
      input: 'Text',
      length: 2,
      expected: 'Te',
      truncationIndicator: '---',
    );
    verifyTruncateFixedNonWhitespaceLength(
      input: '    T  e  x  t  ',
      length: 2,
      expected: '    T  e',
      truncationIndicator: '---',
    );
    verifyTruncateFixedNonWhitespaceLength(
      input: '  T  e  x  t    ',
      length: 2,
      expected: 'x  t    ',
      truncateAt: TruncateAt.start,
      truncationIndicator: '---',
    );

    verifyTruncateFixedNonWhitespaceLength(
      input: 'Some text with 😎 an emoji',
      length: 15,
      expected: 'Some text with 😎 a…',
    );
    verifyTruncateFixedNonWhitespaceLength(
      input: 'Some text with 😎 an emoji',
      length: 10,
      expected: '…h 😎 an emoji',
      truncateAt: TruncateAt.start,
    );
  });
}

void _truncateFixedWordLength() {
  group('truncate fixed word length', () {
    void verifyTruncateFixedWordLength({
      required String input,
      required int length,
      required String expected,
      String truncationIndicator = '…',
      TruncateAt truncateAt = TruncateAt.end,
    }) {
      test(
        '$input : $length : $truncationIndicator : $truncateAt → $expected',
        () {
          final transformation = TruncateToFixedWordLengthTransformation(
            length: length,
            truncationIndicator: truncationIndicator,
            truncateAt: truncateAt,
          );
          final result = transformation.transform(input, '');
          expect(result, expected);
        },
      );
    }

    verifyTruncateFixedWordLength(
      input: '',
      length: 0,
      expected: '…',
    );
    verifyTruncateFixedWordLength(
      input: '',
      length: 0,
      expected: '…',
      truncateAt: TruncateAt.start,
    );
    verifyTruncateFixedWordLength(
      input: '',
      length: 10,
      expected: '',
    );
    verifyTruncateFixedWordLength(
      input: '',
      length: 10,
      expected: '',
      truncateAt: TruncateAt.start,
    );
    verifyTruncateFixedWordLength(
      input: 'A',
      length: 1,
      expected: 'A',
    );
    verifyTruncateFixedWordLength(
      input: 'A',
      length: 1,
      expected: 'A',
      truncateAt: TruncateAt.start,
    );
    verifyTruncateFixedWordLength(
      input: 'A',
      length: 10,
      expected: 'A',
    );

    verifyTruncateFixedWordLength(
      input: '  Some text that is too long  ',
      length: 4,
      expected: '  Some text that is…',
    );
    verifyTruncateFixedWordLength(
      input: '  Some text that is too long  ',
      length: 4,
      expected: '…that is too long  ',
      truncateAt: TruncateAt.start,
    );

    verifyTruncateFixedWordLength(
      input: 'Some text that is too long',
      length: 4,
      expected: 'Some text that is---',
      truncationIndicator: '---',
    );
    verifyTruncateFixedWordLength(
      input: 'Some text that is too long',
      length: 4,
      expected: '---that is too long',
      truncateAt: TruncateAt.start,
      truncationIndicator: '---',
    );

    verifyTruncateFixedWordLength(
      input: 'Some   text  that  is    too  long  ',
      length: 4,
      expected: 'Some   text  that  is…',
    );
    verifyTruncateFixedWordLength(
      input: 'Some   text  that  is    too  long  ',
      length: 4,
      expected: '…that  is    too  long  ',
      truncateAt: TruncateAt.start,
    );

    verifyTruncateFixedWordLength(
      input: 'Some text with 😎 an emoji',
      length: 5,
      expected: 'Some text with 😎 an…',
    );
    verifyTruncateFixedWordLength(
      input: 'Some text with 😎 an emoji',
      length: 4,
      expected: '…with 😎 an emoji',
      truncateAt: TruncateAt.start,
    );
  });
}
