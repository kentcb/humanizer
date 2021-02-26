class NumberToWordsConverter {
  static final _unitNames = <String>[
    'zero',
    'one',
    'two',
    'three',
    'four',
    'five',
    'six',
    'seven',
    'eight',
    'nine',
    'ten',
    'eleven',
    'twelve',
    'thirteen',
    'fourteen',
    'fifteen',
    'sixteen',
    'seventeen',
    'eighteen',
    'nineteen',
  ];

  static final _tensNames = <String>[
    'zero',
    'ten',
    'twenty',
    'thirty',
    'forty',
    'fifty',
    'sixty',
    'seventy',
    'eighty',
    'ninety',
  ];

  // Exceptions to the general rule of suffixing the unit name with 'th'.
  static final _ordinalUnitNameExceptions = <int, String>{
    1: 'first',
    2: 'second',
    3: 'third',
    4: 'fourth',
    5: 'fifth',
    8: 'eighth',
    9: 'ninth',
    12: 'twelfth',
  };

  // We only define place values that will fit within 64 bits, even though ints on web are not limited to 64 bits.
  static const _placeValues = <_PlaceValue>[
    _PlaceValue('quintillion', 1000000000000000000),
    _PlaceValue('quadrillion', 1000000000000000),
    _PlaceValue('trillion', 1000000000000),
    _PlaceValue('billion', 1000000000),
    _PlaceValue('million', 1000000),
    _PlaceValue('thousand', 1000),
    _PlaceValue('hundred', 100),
  ];

  static String convert(
    int value, {
    bool isOrdinal = false,
    bool addAnd = true,
  }) {
    if (value < 0) {
      return 'negative ${convert(value.abs(), isOrdinal: isOrdinal)}';
    }

    if (value == 0) {
      return _getUnitName(
        value: value,
        isOrdinal: isOrdinal,
      );
    }

    final parts = <String>[];

    for (final placeValue in _placeValues) {
      final quantity = value ~/ placeValue.value;

      if (quantity > 0) {
        parts.add('${convert(quantity)} ${placeValue.name}');
        value %= placeValue.value;
      }
    }

    if (value > 0) {
      if (parts.isNotEmpty && addAnd) {
        parts.add('and');
      }

      if (value < 20) {
        parts.add(_getUnitName(
          value: value,
          isOrdinal: isOrdinal,
        ));
      } else {
        var lastPart = _tensNames[value ~/ 10];

        if ((value % 10) > 0) {
          lastPart =
              '$lastPart-${_getUnitName(value: value % 10, isOrdinal: isOrdinal)}';
        } else if (isOrdinal) {
          lastPart = '${_removeSuffix(lastPart, 'y')}ieth';
        }

        parts.add(lastPart);
      }
    } else if (isOrdinal) {
      parts[parts.length - 1] += 'th';
    }

    var toWords = parts.join(' ');

    if (isOrdinal) {
      toWords = _removePrefix(toWords, 'one ');
    }

    return toWords;
  }

  static String _getUnitName({
    required int value,
    required bool isOrdinal,
  }) {
    assert(value <= 19);

    if (isOrdinal) {
      final exception = _ordinalUnitNameExceptions[value];

      if (exception != null) {
        return exception;
      }

      return '${_unitNames[value]}th';
    } else {
      return _unitNames[value];
    }
  }

  static String _removePrefix(String words, String prefix) {
    if (words.startsWith(prefix)) {
      return words.substring(prefix.length);
    }

    return words;
  }

  static String _removeSuffix(String words, String suffix) {
    if (words.endsWith(suffix)) {
      return words.substring(0, words.length - suffix.length);
    }

    return words;
  }
}

class _PlaceValue {
  const _PlaceValue(
    this.name,
    this.value,
  );

  final String name;
  final int value;
}
