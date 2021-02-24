import 'package:humanizer/humanizer.dart';
import 'package:humanizer/src/string_predicate_extensions.dart';

/// A transformation to convert a [String] into a truncated variant that contains at most [length] characters.
///
/// If the input value exceeds [length] characters, it is truncated. If [truncationIndicator] does not exceed [length]
/// characters, it is incorporated into the return value. The [input] will be truncated at either its start or end
/// according to [truncateAt].
///
/// ```
/// final transformation = TruncateToFixedLengthTransformation(
///   length: 12,
///   truncationIndicator: '~',
///   truncateAt: TruncateAt.end,
/// );
///
/// // 'A string th~'
/// transformation.transform('A string that is too long', 'en_US');
/// ```
class TruncateToFixedLengthTransformation extends Transformation<String, String> {
  const TruncateToFixedLengthTransformation({
    required this.length,
    required this.truncationIndicator,
    required this.truncateAt,
  });

  /// The maximum number of characters to allow in a transformed [String].
  final int length;

  /// The truncation indicator that should be prepended or appended if a [String] is truncated, subject to available
  /// space.
  final String truncationIndicator;

  /// Whether to truncate from the start or end of the input.
  final TruncateAt truncateAt;

  @override
  String transform(String input, String locale) {
    assert(length >= 0);

    final inputRunes = input.runes;

    if (inputRunes.length <= length) {
      return input;
    } else if (truncationIndicator.runes.length > length) {
      // Can't use the truncation indicator because it's longer than the desired length, so we'll just truncate without
      // it.
      final result = truncateAt == TruncateAt.end ? input.substring(0, length) : input.substring(input.length - length);
      return result;
    } else {
      // We need to incorporate the truncation indicator and take its length into account during truncation.
      if (truncateAt == TruncateAt.start) {
        final suffix =
            String.fromCharCodes(inputRunes.skip(inputRunes.length - length + truncationIndicator.runes.length));
        final result = '$truncationIndicator$suffix';
        return result;
      } else {
        final prefix = String.fromCharCodes(inputRunes.take(length - truncationIndicator.runes.length));
        final result = '$prefix$truncationIndicator';
        return result;
      }
    }
  }
}

/// A transformation to convert a [String] into a truncated variant that contains at most [length] non-whitespace
/// characters.
///
/// If the input value exceeds [length] non-whitespace characters, it is truncated. If [truncationIndicator] does not
/// exceed [length] characters, it is incorporated into the return value. The [input] will be truncated at either its
/// start or end according to [truncateAt].
///
/// ```
/// final transformation = TruncateToFixedNonWhitespaceLengthTransformation(
///   length: 12,
///   truncationIndicator: '~',
///   truncateAt: TruncateAt.end,
/// );
///
/// // 'A string that~'
/// transformation.transform('A string that is too long', 'en_US');
/// ```
class TruncateToFixedNonWhitespaceLengthTransformation extends Transformation<String, String> {
  const TruncateToFixedNonWhitespaceLengthTransformation({
    required this.length,
    required this.truncationIndicator,
    required this.truncateAt,
  });

  /// The maximum number of non-whitespace characters to allow in a transformed [String].
  final int length;

  /// The truncation indicator that should be prepended or appended if a [String] is truncated, subject to available
  /// space.
  final String truncationIndicator;

  /// Whether to truncate from the start or end of the input.
  final TruncateAt truncateAt;

  @override
  String transform(String input, String locale) {
    assert(length >= 0);

    final inputRunes = input.runes.toList();

    if (inputRunes.length <= length) {
      return input;
    }

    final isTruncatedAtStart = truncateAt == TruncateAt.start;
    final inputIndexes = Iterable<int>.generate(
      input.length,
      (i) => isTruncatedAtStart ? inputRunes.length - 1 - i : i,
    );
    final includeTruncationIndicator = truncationIndicator.runes.length < length;
    final truncationIndicatorLength = includeTruncationIndicator ? truncationIndicator.runes.length : 0;
    var buffer = <int>[];
    var nonWhitespaceLength = 0;

    for (var i in inputIndexes) {
      final rune = inputRunes[i];
      final isWhitespace = String.fromCharCodes([rune]).isBlank();

      buffer.add(rune);

      if (!isWhitespace) {
        ++nonWhitespaceLength;

        if (nonWhitespaceLength == length - truncationIndicatorLength) {
          break;
        }
      }
    }

    if (includeTruncationIndicator) {
      buffer.addAll(truncationIndicator.runes);
    }

    if (isTruncatedAtStart) {
      buffer = buffer.reversed.toList();
    }

    return String.fromCharCodes(buffer);
  }
}

/// A transformation to convert a [String] into a truncated variant that contains at most [length] words.
///
/// If the input contains more than [length] words, it is truncated. The [truncationIndicator] will be prepended or
/// appended depending on [truncateAt].
///
/// ```
/// final transformation = TruncateToFixedWordLengthTransformation(
///   length: 4,
///   truncationIndicator: '~',
///   truncateAt: TruncateAt.end,
/// );
///
/// // 'A string that is~'
/// transformation.transform('A string that is too long', 'en_US');
/// ```
class TruncateToFixedWordLengthTransformation extends Transformation<String, String> {
  const TruncateToFixedWordLengthTransformation({
    required this.length,
    required this.truncationIndicator,
    required this.truncateAt,
  });

  // Used to identify words and optional leading whitespace.
  static final _wordWithLeadingWhitespaceExpression = RegExp(r'(\s+)?(\S+)');

  // Used to identify words and optional trailing whitespace.
  static final _wordWithTrailingWhitespaceExpression = RegExp(r'(\S+)(\s+)?');

  /// The maximum number of words to allow in a transformed [String].
  final int length;

  /// The truncation indicator that should be prepended or appended if a [String] is truncated, subject to available
  /// space.
  final String truncationIndicator;

  /// Whether to truncate from the start or end of the input.
  final TruncateAt truncateAt;

  @override
  String transform(String input, String locale) {
    assert(length >= 0);

    if (length == 0) {
      return truncationIndicator;
    }

    final isTruncatedAtStart = truncateAt == TruncateAt.start;
    final wordExpression =
        isTruncatedAtStart ? _wordWithTrailingWhitespaceExpression : _wordWithLeadingWhitespaceExpression;
    final wordMatches = wordExpression.allMatches(input).toList();
    final wordMatchIndexes = Iterable<int>.generate(
      wordMatches.length,
      (i) => isTruncatedAtStart ? wordMatches.length - 1 - i : i,
    );

    final buffer = <int>[];
    var wordCount = 0;

    for (var i in wordMatchIndexes) {
      final wordMatch = wordMatches[i];
      final word = isTruncatedAtStart ? wordMatch.group(1) : wordMatch.group(2);
      final wordWithOptionalWhitespace = wordMatch.group(0);

      if (isTruncatedAtStart && word != null && wordCount == length) {
        buffer.insertAll(0, truncationIndicator.runes);
        break;
      } else if (!isTruncatedAtStart && word != null && wordCount == length) {
        buffer.addAll(truncationIndicator.runes);
        break;
      }

      if (wordWithOptionalWhitespace != null) {
        if (isTruncatedAtStart) {
          buffer.insertAll(0, wordWithOptionalWhitespace.runes);
        } else {
          buffer.addAll(wordWithOptionalWhitespace.runes);
        }

        if (word != null) {
          ++wordCount;
        }
      }
    }

    final result = String.fromCharCodes(buffer);
    return result;
  }
}

/// Defines possible locations to truncate a [String].
enum TruncateAt {
  /// If necessary, the start of the [String] should be truncated.
  start,

  /// If necessary, the end of the [String] should be truncated.
  end,
}
