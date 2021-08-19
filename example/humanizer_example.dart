import 'package:humanizer/humanizer.dart';

void main() {
  _approximateTime();
  _cardinalNumbers();
  _ordinalNumbers();
  _plurality();
  _stringCasing();
  _stringTruncation();
  _symbols();
  _unitsOfMeasurement();

  _transformationsLayer();
}

void _symbols() {
  _printTitle('Symbols');

  final symbolNames = <String>[
    'someCamelCasedSymbol',
    'SomePascalCasedSymbol',
    'some_snake_cased_symbol',
    'some-kebab-cased-symbol',
    'aSymbolWithAnACRONYMInIt',
  ];

  for (final symbolName in symbolNames) {
    print("SymbolName('$symbolName').toHumanizedName() => '${SymbolName(symbolName).toHumanizedName()}'");
  }
}

void _stringCasing() {
  _printTitle('String Casing');

  final sentences = <String>[
    'A silly sentenCE With vArIeD casing!',
    'a lowercase sentence with an ACRONYM',
  ];

  for (final sentence in sentences) {
    print("'$sentence'.toSentenceCase() => '${sentence.toSentenceCase()}'");
    print("'$sentence'.toTitleCase() => '${sentence.toTitleCase()}'");
  }
}

void _stringTruncation() {
  _printTitle('String Truncation');

  final inputs = <String>[
    'An input string that is too long',
  ];

  for (final input in inputs) {
    print("'$input'.truncateToFixedLength(12) => '${input.truncateToFixedLength(12)}'");
    print(
        "'$input'.truncateToFixedLength(12, truncateAt: TruncateAt.start) => '${input.truncateToFixedLength(12, truncateAt: TruncateAt.start)}'");
    print("'$input'.truncateToFixedNonWhitespaceLength(12) => '${input.truncateToFixedNonWhitespaceLength(12)}'");
    print(
        "'$input'.truncateToFixedNonWhitespaceLength(12, truncateAt: TruncateAt.start) => '${input.truncateToFixedNonWhitespaceLength(12, truncateAt: TruncateAt.start)}'");
    print("'$input'.truncateToFixedWordLength(3) => '${input.truncateToFixedWordLength(3)}'");
    print(
        "'$input'.truncateToFixedWordLength(3, truncateAt: TruncateAt.start) => '${input.truncateToFixedWordLength(3, truncateAt: TruncateAt.start)}'");
  }
}

void _approximateTime() {
  _printTitle('Approximate Time');

  print("Duration.zero.toApproximateTime() => '${Duration.zero.toApproximateTime()}'");
  print(
      "Duration.zero.toApproximateTime(isRelativeToNow: false) => '${Duration.zero.toApproximateTime(isRelativeToNow: false)}'");
  print("const Duration(seconds: 28).toApproximateTime() => '${const Duration(seconds: 28).toApproximateTime()}'");
  print(
      "const Duration(seconds: 28).toApproximateTime(isRelativeToNow: false) => '${const Duration(seconds: 28).toApproximateTime(isRelativeToNow: false)}'");
  print("const Duration(seconds: -28).toApproximateTime() => '${const Duration(seconds: -28).toApproximateTime()}'");
  print(
      "const Duration(seconds: -28).toApproximateTime(isRelativeToNow: false) => '${const Duration(seconds: -28).toApproximateTime(isRelativeToNow: false)}'");
  print(
      "const Duration(hours: 2, minutes: 40).toApproximateTime() => '${const Duration(hours: 2, minutes: 40).toApproximateTime()}'");
  print(
      "const Duration(hours: 2, minutes: 40).toApproximateTime(isRelativeToNow: false) => '${const Duration(hours: 2, minutes: 40).toApproximateTime(isRelativeToNow: false)}'");
  print(
      "const Duration(hours: 2, minutes: 40).toApproximateTime(round: false) => '${const Duration(hours: 2, minutes: 40).toApproximateTime(round: false)}'");
  print(
      "const Duration(hours: 2, minutes: 40).toApproximateTime(isRelativeToNow: false, round: false) => '${const Duration(hours: 2, minutes: 40).toApproximateTime(isRelativeToNow: false, round: false)}'");
  print(
      "const Duration(hours: 2, minutes: 40).toApproximateTime(granularity: Granularity.primaryAndSecondaryUnits) => '${const Duration(hours: 2, minutes: 40).toApproximateTime(granularity: Granularity.primaryAndSecondaryUnits)}'");
  print(
      "const Duration(hours: 2, minutes: 40).toApproximateTime(isRelativeToNow: false, granularity: Granularity.primaryAndSecondaryUnits) => '${const Duration(hours: 2, minutes: 40).toApproximateTime(isRelativeToNow: false, granularity: Granularity.primaryAndSecondaryUnits)}'");
}

void _plurality() {
  _printTitle('Plurality');

  final words = <String>[
    'dog',
    'fox',
    'man',
    'spokesperson',
    'ox',
  ];

  for (final word in words) {
    final plural = word.toPluralForm();
    print("'$word'.toPluralForm() => '$plural'");
    print("'$plural'.toSingularForm() => '${plural.toSingularForm()}'");
  }
}

void _ordinalNumbers() {
  _printTitle('Ordinal Numbers');

  final numbers = <int>[
    1,
    2,
    3,
    42,
    101,
    38471,
  ];

  for (final number in numbers) {
    print("$number.toOrdinalNumerical() => '${number.toOrdinalNumerical()}'");
    print("$number.toOrdinalWords() => '${number.toOrdinalWords()}'");
  }
}

void _cardinalNumbers() {
  _printTitle('Cardinal Numbers');

  final numbers = <int>[
    1,
    2,
    3,
    42,
    101,
    38471,
  ];

  for (final number in numbers) {
    print("$number.toCardinalWords() => '${number.toCardinalWords()}'");
  }
}

void _unitsOfMeasurement() {
  _printTitle('Units of Measurement');

  final fileSize = 3417885.bytes();
  print("fileSize.humanize() => '${fileSize.humanize()}'");
  print(
      "fileSize.humanize(permissibleValueUnits: InformationUnits.siBytes) => '${fileSize.humanize(permissibleValueUnits: InformationUnits.siBytes)}'");
  print("fileSize.humanize(pattern: '###,##0 U:B') => '${fileSize.humanize(pattern: '###,##0 U:B')}'");

  // You can use arithmetic on units of measurement values.
  final weight = 79.kilograms() + 28.grams();
  print("weight.humanize() => '${weight.humanize()}'");
  print(
      "weight.humanize(permissibleValueUnits: WeightUnits.usImperial) => '${weight.humanize(permissibleValueUnits: WeightUnits.usImperial)}'");

  final length = 20.meters() + 38.centimeters();
  print("length.humanize() => '${length.humanize()}'");

  // Any unit of measurement value can be turned into a "rated" value via the per method.
  final speed = length.per(const Duration(seconds: 1));
  print("speed.humanize() => '${speed.humanize()}'");
  print("speed.humanize(pattern: \"0.# U 'per' R:hr\") => '${speed.humanize(pattern: "0.# U 'per' R:hr")}'");
}

// A simple example of using the transformations API directly rather than the extensions layer.
void _transformationsLayer() {
  _printTitle('Transformations Layer');

  // We're composing multiple transformations together here by using 'then'.
  final transformation = const SymbolToHumanizedNameTransformation()
      .then(const ToSentenceCaseTransformation(convertAcronyms: false))
      .then(const TruncateToFixedWordLengthTransformation(
        length: 3,
        truncateAt: TruncateAt.end,
        truncationIndicator: '...',
      ));

  final symbolNames = <String>[
    'someCamelCasedSymbol',
    'SomePascalCasedSymbol',
    'some_snake_cased_symbol',
    'some-kebab-cased-symbol',
    'aSymbolWithAnACRONYMInIt',
  ];

  for (final symbolName in symbolNames) {
    print(
        "transformation.transform(SymbolName('$symbolName'), 'en') => '${transformation.transform(SymbolName(symbolName), 'en')}'");
  }
}

void _printTitle(String title) {
  print('');
  print('');
  print(title);
  print('=' * title.length);
  print('');
}
