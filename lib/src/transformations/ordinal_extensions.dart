import 'package:humanizer/humanizer.dart';
import 'package:intl/intl.dart';

/// Provides ordinal-related extensions on [int].
///
/// See also:
/// * [OrdinalNumericalTransformation]
/// * [OrdinalWordsTransformation]
extension OrdinalExtensions on int {
  /// Converts this [int] to ordinal numerical format, such as converting `1` to `'1st'`, or `42` to `'42nd'`.
  String toOrdinalNumerical({
    String? locale,
  }) {
    const transformation = OrdinalNumericalTransformation();
    final result =
        transformation.transform(this, locale ?? Intl.getCurrentLocale());
    return result;
  }

  /// Converts this [int] to ordinal word format, such as converting `1` to `'first'`, or `42` to `'forty-second'`.
  String toOrdinalWords({
    String? locale,
  }) {
    const transformation = OrdinalWordsTransformation();
    final result =
        transformation.transform(this, locale ?? Intl.getCurrentLocale());
    return result;
  }
}
