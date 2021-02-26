import 'package:humanizer/humanizer.dart';
import 'package:intl/intl.dart';

/// Provides plurality-related extension methods on [String].
///
/// ```
/// // 'dogs'
/// 'dog'.toPluralForm();
///
/// // 'dog'
/// 'dogs'.toSingularForm();
///
/// // '2 dogs'
/// 'dog'.toPluralFormForQuantity(2);
/// ```
///
/// See also:
/// * [PluralityTransformation]
extension PluralityExtensions on String {
  /// Converts this [String] to singular form.
  String toSingularForm({
    String? locale,
  }) {
    const transformation =
        PluralityTransformation(targetPlurality: Plurality.singular);
    final result =
        transformation.transform(this, locale ?? Intl.getCurrentLocale());
    return result;
  }

  /// Converts this [String] to plural form.
  String toPluralForm({
    String? locale,
  }) {
    const transformation =
        PluralityTransformation(targetPlurality: Plurality.plural);
    final result =
        transformation.transform(this, locale ?? Intl.getCurrentLocale());
    return result;
  }

  /// Converts this string to the appropriate plural form to describe the specified [quantity], including the quantity
  /// in the returned result if [includeQuantity] is `true`.
  String toPluralFormForQuantity({
    required num quantity,
    bool includeQuantity = true,
    String? locale,
  }) {
    final pluralized = quantity == 1
        ? toSingularForm(locale: locale)
        : toPluralForm(locale: locale);
    final result = '${includeQuantity ? '$quantity ' : ''}$pluralized';
    return result;
  }
}
