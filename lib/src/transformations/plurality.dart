import 'package:humanizer/humanizer.dart';

/// A transformation to convert the plural form of an input [String].
///
/// This transformation attempts to convert the input [String] such that its plural form is modified to
/// [targetPlurality]. If it is known that inputs do not have the target plurality, setting
/// [inputMayAlreadyHaveTargetPlurality] to `false` will improve performance. Leaving it as `true` (the default value)
/// will ensure that transforming a word already of the target plurality will simply return that same word.
///
/// ```
/// final transformation = PluralityTransformation(targetPlurality: Plurality.plural);
///
/// // 'dogs'
/// transformation.transform('dog', 'en_US');
///
/// // 'dogs'
/// transformation.transform('dogs', 'en_US');
///
/// // 'foxes'
/// transformation.transform('fox', 'en_US');
///
/// // 'oxen'
/// transformation.transform('ox', 'en_US');
/// ```
class PluralityTransformation extends Transformation<String, String> {
  const PluralityTransformation({
    required this.targetPlurality,
    this.inputMayAlreadyHaveTargetPlurality = true,
  });

  static final _pluralizationRules = _createEnglishPluralizationRules();

  /// The desired plurality for transformed inputs.
  final Plurality targetPlurality;

  /// If `true`, serves as an indicator that the plurality of the input may already match the target plurality. In
  /// scenarios where the input plurality is known to differ, set this to `false` to optimize the transformation
  /// process.
  final bool inputMayAlreadyHaveTargetPlurality;

  @override
  String transform(String input, String locale) {
    switch (targetPlurality) {
      case Plurality.plural:
        final result = _pluralizationRules.pluralize(
          input,
          wordIsKnownToBeSingular: !inputMayAlreadyHaveTargetPlurality,
        );
        return result;
      case Plurality.singular:
        final result = _pluralizationRules.singularize(
          input,
          wordIsKnownToBePlural: !inputMayAlreadyHaveTargetPlurality,
        );
        return result;
    }
  }
}

/// Defines possible plurality values.
enum Plurality {
  /// Singular form.
  singular,

  /// Plural form.
  plural,
}

/// Encapsulates a set of rules used to transform the plurality of words.
class _PluralizationRules {
  final _pluralRules = <_PluralizationRule>[];
  final _singularRules = <_PluralizationRule>[];
  final _uncountables = <String>{};

  /// Adds a rule that replaces [pattern] with [replacement] when converting to singular form.
  ///
  /// Patterns are matched in the order they are added, and only the first matching pattern is applied when converting
  /// to singular form.
  void addSingularRule({
    required Pattern pattern,
    required String replacement,
  }) =>
      _singularRules.add(_PluralizationRule(
        pattern: pattern,
        replacement: replacement,
      ));

  /// Adds a rule that replaces [pattern] with [replacement] when converting to plural form.
  ///
  /// Patterns are matched in the order they are added, and only the first matching pattern is applied when converting
  /// to plural form.
  void addPluralRule({
    required Pattern pattern,
    required String replacement,
  }) =>
      _pluralRules.add(_PluralizationRule(
        pattern: pattern,
        replacement: replacement,
      ));

  /// Adds a [pattern] that, when matched, is considered a word without a plural form and is therefore returned as is
  /// when attempting to change pluralization.
  void addUncountable(String word) => _uncountables.add(word.toLowerCase());

  /// Adds the appropriate rules to assume [singular] pluralizes to [plural] and vice-versa, which is useful for cases
  /// that are not readily expressed using a more general rule.
  ///
  /// If [matchEnding] is `true`, the added rules will apply if [singular] or [plural] appear after other characters,
  /// not just when they appear in isolation.
  void addIrregularRule({
    required String singular,
    required String plural,
    required matchEnding,
  }) {
    if (matchEnding) {
      addSingularRule(
        pattern: RegExp(
          '(${plural[0]})${plural.substring(1)}\\b',
          caseSensitive: false,
        ),
        replacement: '\$1${singular.substring(1)}',
      );
      addPluralRule(
        pattern: RegExp(
          '(${singular[0]})${singular.substring(1)}\\b',
          caseSensitive: false,
        ),
        replacement: '\$1${plural.substring(1)}',
      );
    } else {
      addSingularRule(
        pattern: RegExp(
          '\\b(\\s*?)$plural\\b',
          caseSensitive: false,
        ),
        replacement: '\$1$singular',
      );
      addPluralRule(
        pattern: RegExp(
          '\\b(\\s*?)$singular\\b',
          caseSensitive: false,
        ),
        replacement: '\$1$plural',
      );
    }
  }

  /// Convert [word] to plural form using the configured rules.
  ///
  /// [wordIsKnownToBeSingular] should be set to `true` only if [word] is definitely singular. Doing so is an
  /// optimization.
  String pluralize(
    String word, {
    bool wordIsKnownToBeSingular = false,
  }) {
    final result = _applyRules(word, _pluralRules);

    if (wordIsKnownToBeSingular) {
      return result;
    }

    // Convert to singular and back to plural on the assumption that word is plural.
    final singular = _applyRules(word, _singularRules);
    final singularAsPlural = _applyRules(singular, _pluralRules);

    // Figure out whether we actually started with plural form and, if so, return that.
    if (singular != word && '${singular}s' != word && singularAsPlural == word && result != word) {
      return word;
    }

    return result;
  }

  /// Convert [word] to singular form using the configured rules.
  ///
  /// [wordIsKnownToBePlural] should be set to `true` only if [word] is definitely plural. Doing so is an
  /// optimization.
  String singularize(
    String word, {
    bool wordIsKnownToBePlural = false,
  }) {
    final result = _applyRules(word, _singularRules);

    if (wordIsKnownToBePlural) {
      return result;
    }

    // Convert to singular and back to plural on the assumption that word is plural.
    final plural = _applyRules(word, _pluralRules);
    final pluralAsSingular = _applyRules(plural, _singularRules);

    // Figure out whether we actually started with singular form and, if so, return that.
    if (plural != word && '${word}s' != plural && pluralAsSingular == word && result != word) {
      return word;
    }

    return result;
  }

  bool _isUncountable(String word) => _uncountables.contains(word.toLowerCase());

  String _applyRules(String word, Iterable<_PluralizationRule> rules) {
    final trimmedWord = word.trim();

    if (trimmedWord.isEmpty) {
      return word;
    }

    if (_isUncountable(trimmedWord)) {
      return word;
    }

    for (final rule in rules) {
      final result = rule.apply(word);

      if (result != null) {
        return result;
      }
    }

    return word;
  }
}

class _PluralizationRule {
  _PluralizationRule({
    required this.pattern,
    required this.replacement,
  });

  final Pattern pattern;
  final String replacement;

  String? apply(String word) {
    if (!word.contains(pattern)) {
      return null;
    }

    final result = word.replaceAllMapped(
      pattern,
      _getReplaceMatch(replacement),
    );

    return result;
  }
}

// See https://github.com/dart-lang/sdk/issues/2336
typedef _ReplaceMatch = String Function(Match match);

final _replacementsExpression = RegExp(r'\$(\d+)');

_ReplaceMatch _getReplaceMatch(String pattern) =>
    (Match match) => pattern.replaceAllMapped(_replacementsExpression, (m) {
          final groupNumber = int.parse(m[1]!);
          final result = match[groupNumber] ?? '';
          return result;
        });

_PluralizationRules _createEnglishPluralizationRules() {
  final result = _PluralizationRules();

  _irregularWordsWithMatchEnding.forEach((singular, plural) => result.addIrregularRule(
        singular: singular,
        plural: plural,
        matchEnding: true,
      ));

  _irregularWordsWithoutMatchEnding.forEach((singular, plural) => result.addIrregularRule(
        singular: singular,
        plural: plural,
        matchEnding: false,
      ));

  _pluralRules.forEach((pattern, replacement) => result.addPluralRule(
        pattern: RegExp(
          pattern,
          caseSensitive: false,
        ),
        replacement: replacement,
      ));

  _singularRules.forEach((pattern, replacement) => result.addSingularRule(
        pattern: RegExp(
          pattern,
          caseSensitive: false,
        ),
        replacement: replacement,
      ));

  _uncountables.forEach(result.addUncountable);

  return result;
}

final _pluralRules = <String, String>{
  r'(apheli|hyperbat|periheli|asyndet|noumen|phenomen|criteri|organ|prolegomen|hedr|automat)(?:a|on)\b': r'$1a',
  r'(alumn|alg|larv|vertebr)a\b': r'$1ae',
  r'(hoo|lea|loa|thie)f\b': r'$1ves',
  r'(buz|blit|walt)z\b': r'$1zes',
  r'(quiz)\b': r'$1zes',
  r'(\b[m|l])ouse\b': r'$1ice',
  r'(matr|vert|ind|d)ix|ex\b': r'$1ices',
  r'(x|ch|ss|sh)\b': r'$1es',
  r'([^aeiouy]|qu)y\b': r'$1ies',
  r'(hive)\b': r'$1s',
  r'(?:(kni|wi|li)fe|(ar|l|ea|eo|oa|hoo)f)\b': r'$1$2ves',
  r'sis\b': 'ses',
  r'([dti])um\b': r'$1a',
  r'(buffal|tomat|volcan|ech|embarg|her|mosquit|potat|torped|vet)o\b': r'$1oes',
  r'(alias|bias|hippopotamus|octopus|iris|status|campus|apparatus|virus|walrus|trellis)\b': r'$1es',
  r'(vir|alumn|fung|cact|foc|radi|stimul|syllab|nucle)us\b': r'$1i',
  r'(ax|test)is\b': r'$1es',
  r'(seraph|cherub)(?:im)?\b': r'$1im',
  r's\b': 's',
  r'(\w)\b': r'$1s',
};

final _singularRules = <String, String>{
  r'([b|r|c]ook|room|smooth)ies\b': r'$1ie',
  r'(criteri|phenomen)a\b': r'$1on',
  r'(alumn|alg|larv|vertebr)ae\b': r'$1a',
  r'(buz|blit|walt)zes\b': r'$1z',
  r'(quiz)zes\b': r'$1',
  r'(vert|ind)ices\b': r'$1ex',
  r'(matr|d)ices\b': r'$1ix',
  r'(alias|bias|hippopotamus|octopus|iris|status|campus|apparatus|virus|walrus|trellis)es\b': r'$1',
  r'(vir|alumn|fung|cact|foc|radi|stimul|syllab|nucle)i\b': r'$1us',
  r'(cris|ax|test)es\b': r'$1is',
  r'(shoe)s\b': r'$1',
  r'(o)es\b': r'$1',
  r'(\b[m|l])ice\b': r'$1ouse',
  r'(x|ch|ss|sh)es\b': r'$1',
  r'(m)ovies\b': r'$1ovie',
  r'(s)eries\b': r'$1eries',
  r'(\bzomb)?([^aeiouy]|qu)ies\b': r'$2y',
  r'([lr]|hoo|lea|loa|thie)ves\b': r'$1f',
  r'(tive)s\b': r'$1',
  r'(hive)s\b': r'$1',
  r'(wi|kni|(?:after|half|high|low|mid|non|night|[^\w]|^)li)ves\b': r'$1fe',
  r'(analy|ba|diagno|parenthe|progno|synop|the|ellip|empha|neuro|oa|paraly)ses\b': r'$1sis',
  r'([dti])a\b': r'$1um',
  r'(n)ews\b': r'$1ews',
  r'(seraph|cherub)im\b': r'$1',
  r's\b': '',
};

// Words that don't pluralize in a manner best described with rules, matched at ending (full match not required).
final _irregularWordsWithMatchEnding = <String, String>{
  'cache': 'caches',
  'child': 'children',
  'curriculum': 'curricula',
  'database': 'databases',
  'die': 'dice',
  'foot': 'feet',
  'glove': 'gloves',
  'goose': 'geese',
  'human': 'humans',
  'man': 'men',
  'move': 'moves',
  'person': 'people',
  'personnel': 'personnel',
  'sex': 'sexes',
  'tooth': 'teeth',
  'wave': 'waves',
  'zombie': 'zombies',
};

// Same, but don't fully match only.
final _irregularWordsWithoutMatchEnding = <String, String>{
  'bus': 'buses',
  'ex': 'exes',
  'he': 'they',
  'herself': 'themselves',
  'himself': 'themselves',
  'i': 'we',
  'is': 'are',
  'it': 'they',
  'itself': 'themselves',
  'me': 'us',
  'myself': 'ourselves',
  'ox': 'oxen',
  'she': 'they',
  'staff': 'staff',
  'that': 'those',
  'this': 'these',
  'training': 'training',
};

// Singular form words with no plural.
final _uncountables = <String>{
  'adulthood',
  'advice',
  'agenda',
  'aid',
  'aircraft',
  'alcohol',
  'ammo',
  'analytics',
  'anime',
  'athletics',
  'audio',
  'bison',
  'blood',
  'bream',
  'butter',
  'carp',
  'cash',
  'chassis',
  'chess',
  'clothing',
  'cod',
  'commerce',
  'cooperation',
  'corn',
  'corps',
  'debris',
  'deer',
  'diabetes',
  'digestion',
  'elk',
  'energy',
  'equipment',
  'excretion',
  'expertise',
  'firmware',
  'fish',
  'flounder',
  'fun',
  'gallows',
  'garbage',
  'graffiti',
  'grass',
  'hair',
  'hardware',
  'headquarters',
  'health',
  'herpes',
  'highjinks',
  'homework',
  'housework',
  'information',
  'jeans',
  'justice',
  'kudos',
  'l',
  'labour',
  'literature',
  'luggage',
  'machinery',
  'mackerel',
  'mail',
  'manga',
  'means',
  'mews',
  'milk',
  'ml',
  'money',
  'moose',
  'mud',
  'music',
  'news',
  'offspring',
  'only',
  'oz',
  'personnel',
  'pike',
  'plankton',
  'pliers',
  'police',
  'pollution',
  'premises',
  'rain',
  'research',
  'rice',
  'salmon',
  'scissors',
  'semen',
  'series',
  'sewage',
  'shambles',
  'sheep',
  'shrimp',
  'software',
  'someone',
  'species',
  'sperm',
  'staff',
  'swine',
  'tbsp',
  'tennis',
  'traffic',
  'transportation',
  'trout',
  'tsp',
  'tuna',
  'water',
  'waters',
  'wealth',
  'welfare',
  'which',
  'whiting',
  'who',
  'wildebeest',
  'wildlife',
  'you',
};
