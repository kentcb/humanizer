import 'package:humanizer/humanizer.dart';
import 'package:humanizer/src/transformations/number_to_words.dart';

class CardinalWordsTransformation extends Transformation<int, String> {
  const CardinalWordsTransformation();

  @override
  String transform(int input, String locale) => NumberToWordsConverter.convert(
        input,
        isOrdinal: false,
      );
}
