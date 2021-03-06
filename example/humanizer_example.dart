import 'package:humanizer/humanizer.dart';

void main() {
  _symbols();
  _stringCasing();
  _stringTruncation();
  _approximateRelativeTime();
  _plurality();
  _ordinalNumbers();
  _cardinalNumbers();
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
    print(
        "'$symbolName'.humanizeSymbolName() => '${symbolName.humanizeSymbolName()}'");
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
    print(
        "'$input'.truncateToFixedLength(12) => '${input.truncateToFixedLength(12)}'");
    print(
        "'$input'.truncateToFixedLength(12, truncateAt: TruncateAt.start) => '${input.truncateToFixedLength(12, truncateAt: TruncateAt.start)}'");
    print(
        "'$input'.truncateToFixedNonWhitespaceLength(12) => '${input.truncateToFixedNonWhitespaceLength(12)}'");
    print(
        "'$input'.truncateToFixedNonWhitespaceLength(12, truncateAt: TruncateAt.start) => '${input.truncateToFixedNonWhitespaceLength(12, truncateAt: TruncateAt.start)}'");
    print(
        "'$input'.truncateToFixedWordLength(3) => '${input.truncateToFixedWordLength(3)}'");
    print(
        "'$input'.truncateToFixedWordLength(3, truncateAt: TruncateAt.start) => '${input.truncateToFixedWordLength(3, truncateAt: TruncateAt.start)}'");
  }
}

void _approximateRelativeTime() {
  _printTitle('Approximate Relative Time');

  final now = DateTime.now();
  final startOfMonth = DateTime(now.year, now.month, 1);
  final startOfDay = DateTime(now.year, now.month, now.day);

  print(
      "startOfMonth.humanizeRelativeDateTime() => '${startOfMonth.humanizeRelativeDateTime()}'");
  print(
      "startOfMonth.humanizeRelativeDateTime(granularity: Granularity.primaryAndSecondaryUnits) => '${startOfMonth.humanizeRelativeDateTime(granularity: Granularity.primaryAndSecondaryUnits)}'");
  print(
      "startOfDay.humanizeRelativeDateTime() => '${startOfDay.humanizeRelativeDateTime()}'");
  print(
      "startOfDay.humanizeRelativeDateTime(granularity: Granularity.primaryAndSecondaryUnits) => '${startOfDay.humanizeRelativeDateTime(granularity: Granularity.primaryAndSecondaryUnits)}'");
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
  print(
      "fileSize.humanize(pattern: '###,##0 U:B') => '${fileSize.humanize(pattern: '###,##0 U:B')}'");

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
  print(
      "speed.humanize(pattern: \"0.# U 'per' R:hr\") => '${speed.humanize(pattern: "0.# U 'per' R:hr")}'");
}

// A simple example of using the transformations API directly rather than the extensions layer.
void _transformationsLayer() {
  _printTitle('Transformations Layer');

  // We're composing multiple transformations together here by using 'then'.
  final transformation = const SymbolNameTransformation()
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
        "transformation.transform('$symbolName', 'en') => '${transformation.transform(symbolName, 'en')}'");
  }
}

void _printTitle(String title) {
  print('');
  print('');
  print(title);
  print('=' * title.length);
  print('');
}
