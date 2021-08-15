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
    void verify({
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

    verify(
      input: '',
      length: 0,
      expected: '',
    );
    verify(
      input: '',
      length: 10,
      expected: '',
    );
    verify(
      input: 'A',
      length: 1,
      expected: 'A',
    );
    verify(
      input: 'A',
      length: 10,
      expected: 'A',
    );

    verify(
      input: 'Some text that is too long',
      length: 10,
      expected: 'Some text…',
    );
    verify(
      input: 'Some text that is too long',
      length: 10,
      expected: '… too long',
      truncateAt: TruncateAt.start,
    );

    verify(
      input: 'Some text that is too long',
      length: 10,
      expected: 'Some te---',
      truncationIndicator: '---',
    );
    verify(
      input: 'Some text that is too long',
      length: 10,
      expected: '---oo long',
      truncateAt: TruncateAt.start,
      truncationIndicator: '---',
    );

    verify(
      input: 'Text',
      length: 2,
      expected: 'Te',
      truncationIndicator: '---',
    );

    verify(
      input: 'Some text with 😎 an emoji',
      length: 19,
      expected: 'Some text with 😎 a…',
    );
    verify(
      input: 'Some text with 😎 an emoji',
      length: 13,
      expected: '…h 😎 an emoji',
      truncateAt: TruncateAt.start,
    );
  });
}

void _truncateFixedNonWhitespaceLength() {
  group('truncate fixed non-whitespace length', () {
    void verify({
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

    verify(
      input: '',
      length: 0,
      expected: '',
    );
    verify(
      input: '',
      length: 10,
      expected: '',
    );
    verify(
      input: 'A',
      length: 1,
      expected: 'A',
    );
    verify(
      input: 'A',
      length: 10,
      expected: 'A',
    );

    verify(
      input: 'Some text that is too long',
      length: 10,
      expected: 'Some text t…',
    );
    verify(
      input: 'Some text that is too long',
      length: 10,
      expected: '…is too long',
      truncateAt: TruncateAt.start,
    );

    verify(
      input: 'Some text that is too long',
      length: 10,
      expected: 'Some tex---',
      truncationIndicator: '---',
    );
    verify(
      input: 'Some text that is too long',
      length: 10,
      expected: '---too long',
      truncateAt: TruncateAt.start,
      truncationIndicator: '---',
    );

    verify(
      input: 'Text',
      length: 2,
      expected: 'Te',
      truncationIndicator: '---',
    );
    verify(
      input: '    T  e  x  t  ',
      length: 2,
      expected: '    T  e',
      truncationIndicator: '---',
    );
    verify(
      input: '  T  e  x  t    ',
      length: 2,
      expected: 'x  t    ',
      truncateAt: TruncateAt.start,
      truncationIndicator: '---',
    );

    verify(
      input: 'Some text with 😎 an emoji',
      length: 15,
      expected: 'Some text with 😎 a…',
    );
    verify(
      input: 'Some text with 😎 an emoji',
      length: 10,
      expected: '…h 😎 an emoji',
      truncateAt: TruncateAt.start,
    );
  });
}

void _truncateFixedWordLength() {
  group('truncate fixed word length', () {
    void verify({
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

    verify(
      input: '',
      length: 0,
      expected: '…',
    );
    verify(
      input: '',
      length: 0,
      expected: '…',
      truncateAt: TruncateAt.start,
    );
    verify(
      input: '',
      length: 10,
      expected: '',
    );
    verify(
      input: '',
      length: 10,
      expected: '',
      truncateAt: TruncateAt.start,
    );
    verify(
      input: 'A',
      length: 1,
      expected: 'A',
    );
    verify(
      input: 'A',
      length: 1,
      expected: 'A',
      truncateAt: TruncateAt.start,
    );
    verify(
      input: 'A',
      length: 10,
      expected: 'A',
    );

    verify(
      input: '  Some text that is too long  ',
      length: 4,
      expected: '  Some text that is…',
    );
    verify(
      input: '  Some text that is too long  ',
      length: 4,
      expected: '…that is too long  ',
      truncateAt: TruncateAt.start,
    );

    verify(
      input: 'Some text that is too long',
      length: 4,
      expected: 'Some text that is---',
      truncationIndicator: '---',
    );
    verify(
      input: 'Some text that is too long',
      length: 4,
      expected: '---that is too long',
      truncateAt: TruncateAt.start,
      truncationIndicator: '---',
    );

    verify(
      input: 'Some   text  that  is    too  long  ',
      length: 4,
      expected: 'Some   text  that  is…',
    );
    verify(
      input: 'Some   text  that  is    too  long  ',
      length: 4,
      expected: '…that  is    too  long  ',
      truncateAt: TruncateAt.start,
    );

    verify(
      input: 'Some text with 😎 an emoji',
      length: 5,
      expected: 'Some text with 😎 an…',
    );
    verify(
      input: 'Some text with 😎 an emoji',
      length: 4,
      expected: '…with 😎 an emoji',
      truncateAt: TruncateAt.start,
    );
  });
}
