import 'package:humanizer/humanizer.dart';
import 'package:intl/intl.dart';

/// Provides cardinal-related extensions on [int].
///
/// See also:
/// * [CardinalWordsTransformation]
extension CardinalExtensions on int {
  /// Converts this [int] to cardinal word format, such as converting `1` to `'one'`, or `42` to `'forty-two'`.
  String toCardinalWords({
    String? locale,
  }) {
    const transformation = CardinalWordsTransformation();
    final result = transformation.transform(this, locale ?? Intl.getCurrentLocale());
    return result;
  }
}
