import 'package:humanizer/humanizer.dart';
import 'package:intl/intl.dart';

/// Provides truncation-related extensions on [String].
extension StringTruncateExtensions on String {
  /// Truncates this [String] as necessary to ensure it contains at most [length] characters.
  ///
  /// ```
  /// // 'Some text…'
  /// 'Some text that is too long'.truncateToFixedLength(10);
  /// ```
  ///
  /// See also:
  /// * [TruncateToFixedLengthTransformation]
  String truncateToFixedLength(
    int length, {
    String truncationIndicator = '…',
    TruncateAt truncateAt = TruncateAt.end,
    String? locale,
  }) =>
      TruncateToFixedLengthTransformation(
        length: length,
        truncationIndicator: truncationIndicator,
        truncateAt: truncateAt,
      ).transform(this, locale ?? Intl.getCurrentLocale());

  /// Truncates this [String] as necessary to ensure it contains at most [length] non-whitespace characters.
  ///
  /// ```
  /// // 'Some text t…'
  /// 'Some text that is too long'.truncateToFixedNonWhitespaceLength(10);
  /// ```
  ///
  /// See also:
  /// * [TruncateToFixedNonWhitespaceLengthTransformation]
  String truncateToFixedNonWhitespaceLength(
    int length, {
    String truncationIndicator = '…',
    TruncateAt truncateAt = TruncateAt.end,
    String? locale,
  }) =>
      TruncateToFixedNonWhitespaceLengthTransformation(
        length: length,
        truncationIndicator: truncationIndicator,
        truncateAt: truncateAt,
      ).transform(this, locale ?? Intl.getCurrentLocale());

  /// Truncates this [String] as necessary to ensure it contains at most [length] words.
  ///
  /// ```
  /// // 'Some text that is…'
  /// 'Some text that is too long'.truncateToFixedWordLength(4);
  /// ```
  ///
  /// See also:
  /// * [TruncateToFixedWordLengthTransformation]
  String truncateToFixedWordLength(
    int length, {
    String truncationIndicator = '…',
    TruncateAt truncateAt = TruncateAt.end,
    String? locale,
  }) =>
      TruncateToFixedWordLengthTransformation(
        length: length,
        truncationIndicator: truncationIndicator,
        truncateAt: truncateAt,
      ).transform(this, locale ?? Intl.getCurrentLocale());
}
