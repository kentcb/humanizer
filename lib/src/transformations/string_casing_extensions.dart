import 'package:humanizer/src/transformations/string_casing.dart';
import 'package:intl/intl.dart';

/// Provides casing-related extension methods on [String].
///
/// See also:
/// * [ToSentenceCaseTransformation]
/// * [ToTitleCaseTransformation]
extension StringCasingExtensions on String {
  /// Converts this [String] to sentence casing.
  ///
  /// ```
  /// // 'Here is some text, FYI. I hope you like it! Peace'
  /// 'here is some text, FYI. I hope you like it! peace'.toSentenceCase();
  /// ```
  ///
  /// See also:
  /// * [ToSentenceCaseTransformation]
  String toSentenceCase({
    bool convertAcryonyms = false,
    String? locale,
  }) =>
      ToSentenceCaseTransformation(convertAcronyms: convertAcryonyms)
          .transform(this, locale ?? Intl.getCurrentLocale());

  /// Converts this [String] to title casing.
  ///
  /// ```
  /// // 'Here Is Some Text, FYI. I Hope You Like It! Peace'
  /// 'here is some text, FYI. I hope you like it! peace'.toTitleCase();
  /// ```
  ///
  /// See also:
  /// * [ToTitleCaseTransformation]
  String toTitleCase({
    bool convertAcryonyms = false,
    String? locale,
  }) =>
      ToTitleCaseTransformation(convertAcronyms: convertAcryonyms)
          .transform(this, locale ?? Intl.getCurrentLocale());
}
