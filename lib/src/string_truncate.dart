import 'package:humanizer/src/string_predicates.dart';

/// Provides truncation-related extensions on [String].
extension StringTruncateExtensions on String {
  /// Truncates this [String] to the specified maximum [length] according to the semantics of the given [truncator].
  ///
  /// This method returns a [String] that is truncated when it exceeds [length] according to the semantics of the
  /// [truncator]. The default truncator is [StringTruncators.fixedLength], which will truncate if this [String]
  /// consists of more than [length] characters. See [StringTruncators] for other possible truncation algorithsm, or
  /// you can provide your own implementation.
  ///
  /// A truncated [String] should include the [truncationIndicator] to show where truncation occurred. The default
  /// truncation indicator is a single-character ellipsis (`…`), to ensure minimal impact on the remaining length.
  ///
  /// [truncateAt] can be used to specify whether the start or end of the [String] should be truncated, with end being
  /// the default. In both cases, it's up to the [truncator] implementation to honor these requests, and all built-in
  /// truncators do so.
  ///
  /// ```
  /// // No need to truncate
  /// 'No need to truncate'.truncate(100);
  ///
  /// // Some text…
  /// 'Some text that is too long'.truncate(10);
  ///
  /// // … too long
  /// 'Some text that is too long'.truncate(10, truncateAt: TruncateAt.start);
  ///
  /// // Some te---
  /// 'Some text that is too long'.truncate(10, truncationIndicator: '---');
  ///
  /// // Some text that is…
  /// 'Some text that is too long'.truncate(4, truncator: StringTruncators.fixedWordLength);
  /// ```
  ///
  /// See also:
  /// * [StringTruncators]
  String truncate(
    int length, {
    String truncationIndicator = '…',
    TruncateAt truncateAt = TruncateAt.end,
    StringTruncator truncator = StringTruncators.fixedLength,
  }) =>
      truncator(this, length, truncationIndicator, truncateAt);
}

/// Defines possible locations to truncate a [String].
enum TruncateAt {
  /// If necessary, the start of the [String] should be truncated.
  start,

  /// If necessary, the end of the [String] should be truncated.
  end,
}

/// Function to perform [String] truncation on behalf of [StringTruncateExtensions.truncate].
///
/// Implementations should truncate [input] such that it conforms to the given [length] according to the semantics of
/// the implementation. If truncation is required, [truncationIndicator] should be included in the result to indicate
/// where truncation has occurred (assuming the indicator itself doesn't exceed the desired [length]), and [truncateAt]
/// should be used to determine which part of [input] should be truncated.
///
/// See also:
///
/// * [StringTruncators]
/// * [StringTruncateExtensions.truncate]
typedef StringTruncator = String Function(String input, int length, String truncationIndicator, TruncateAt truncateAt);

/// Contains useful [StringTruncator] functions.
class StringTruncators {
  // Used to identify words and optional leading whitespace.
  static final _wordWithLeadingWhitespaceExpression = RegExp(r'(\s+)?(\S+)');

  // Used to identify words and optional trailing whitespace.
  static final _wordWithTrailingWhitespaceExpression = RegExp(r'(\S+)(\s+)?');

  /// A fixed-length [StringTruncator] implementation, which ensures that the return value is at most [length]
  /// characters long. If [input] exceeds [length] characters, it is truncated. If [truncationIndicator] does not exceed
  /// [length] characters, it is incorporated into the return value. The [input] will be truncated at either its start
  /// or end according to [truncateAt].
  static String fixedLength(
    String input,
    int length,
    String truncationIndicator,
    TruncateAt truncateAt,
  ) {
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

  /// A fixed non-whitespace length [StringTruncator] implementation, which ensures that the return value has at most
  /// [length] non-whitespace characters in it.
  static String fixedNonWhitespaceLength(
    String input,
    int length,
    String truncationIndicator,
    TruncateAt truncateAt,
  ) {
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

  /// A fixed word length [StringTruncator] implementation, which ensures that the return value has at most [length]
  /// words in it.
  static String fixedWordLength(
    String input,
    int length,
    String truncationIndicator,
    TruncateAt truncateAt,
  ) {
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
