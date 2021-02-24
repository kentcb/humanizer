import 'package:humanizer/humanizer.dart';
import 'package:humanizer/src/transformations/localization.dart';
import 'package:humanizer/src/transformations/number_to_words.dart';
import 'package:intl/intl.dart';

/// A transformation to convert an input [int] into numerical ordinal form.
///
/// This transformation converts the input [input] to its numerical ordinal form (`1` becomes `1st`, `2` becomes `2nd`
/// etcetera). Negative inputs are supported, even though the usage of negative ordinals is at best unorthodox.
///
/// The input is formatted using [inputFormat], which defaults to [inputFormat.decimalPattern()] if unspecified. The
/// [grammaticalGender] can also be specified, though it currently has no effect (but may with future non-English
/// implementations).
///
/// ```
/// const transformation = OrdinalNumericalTransformation();
///
/// // '1st'
/// transformation.transform(1, 'en');
///
/// // '2nd'
/// transformation.transform(2, 'en');
///
/// // '104th'
/// transformation.transform(104, 'en');
///
/// // '1,113th'
/// transformation.transform(1113, 'en');
/// ```
class OrdinalNumericalTransformation extends Transformation<int, String> {
  const OrdinalNumericalTransformation({
    this.grammaticalGender = GrammaticalGender.neuter,
    this.numberFormat,
  });

  /// The grammatical gender to apply during transformation if relevant to the target locale.
  final GrammaticalGender grammaticalGender;

  /// The [NumberFormat] with which to format the input [int].
  final NumberFormat? numberFormat;

  @override
  String transform(int input, String locale) {
    final numberFormat = this.numberFormat ?? NumberFormat.decimalPattern();
    final formattedInput = numberFormat.format(input);
    final indicator = _getOrdinalIndicator(input);
    return '$formattedInput$indicator';
  }

  static String _getOrdinalIndicator(int value) {
    final absValue = value.abs();
    final valueMod100 = absValue % 100;

    if (valueMod100 >= 4 && valueMod100 <= 20) {
      return 'th';
    }

    final valueMod10 = absValue % 10;

    switch (valueMod10) {
      case 1:
        return 'st';
      case 2:
        return 'nd';
      case 3:
        return 'rd';
      default:
        return 'th';
    }
  }
}

/// A transformation to convert an input [int] into word ordinal form.
///
/// This transformation converts the input [input] to its word ordinal form (`1` becomes `first`, `2` becomes `second`
/// etcetera). Negative inputs are supported, even though the usage of negative ordinals is at best unorthodox.
///
/// The current implementation assumes the input [int] is representable in 64 bits, even though integers on the web are
/// not constrained as such.
///
/// ```
/// const transformation = OrdinalWordsTransformation();
///
/// // 'first'
/// transformation.transform(1);
///
/// // 'second'
/// transformation.transform(2);
///
/// // 'hundred and fourth'
/// transformation.transform(104);
/// ```
class OrdinalWordsTransformation extends Transformation<int, String> {
  const OrdinalWordsTransformation();

  @override
  String transform(int input, String locale) => NumberToWordsConverter.convert(
        input,
        isOrdinal: true,
      );
}
