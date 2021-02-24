import 'package:humanizer/humanizer.dart';
import 'package:humanizer/src/transformations/number_to_words.dart';

/// A transformation to convert an input [int] into cardinal form.
///
/// This transformation converts the input [input] to its cardinal form (`1` becomes `one`, `2` becomes `two`
/// etcetera). Negative inputs are supported, in which case the output is prefixed with "negative".
///
/// ```
/// const transformation = CardinalWordsTransformation();
///
/// // 'one'
/// transformation.transform(1, 'en');
///
/// // 'two'
/// transformation.transform(2, 'en');
///
/// // 'one hundred and four'
/// transformation.transform(104, 'en');
///
/// // 'one thousand one hundred and thirteen'
/// transformation.transform(1113, 'en');
/// ```
class CardinalWordsTransformation extends Transformation<int, String> {
  const CardinalWordsTransformation();

  @override
  String transform(int input, String locale) => NumberToWordsConverter.convert(
        input,
        isOrdinal: false,
      );
}
