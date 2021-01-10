import 'package:humanizer/src/string_predicates.dart';

/// Provides casing-related extension methods on [String].
extension StringCasing on String {
  // Used to identify sentences, which are optionally terminated with a fixed set of punctuation symbols as recommended
  // by https://apastyle.apa.org/style-grammar-guidelines/capitalization/sentence-case.
  static final _sentenceExpression = RegExp(r'([^\.\!\?\:\—]+)?([\.\!\?\:\—]+)?');

  // Used to identify words and optional surrounding whitespace.
  static final _wordExpression = RegExp(r'(\s+)?(\S+)?(\s+)?');

  /// Transforms this [String] to sentence casing.
  ///
  /// Sentence casing ensures that only the first letter of each sentence is capitalized. By default, acronyms are
  /// excepted from conversion. However, if [convertAcronyms] is `true`, they will also be converted with the same
  /// logic.
  ///
  /// Sentences are demarcated by a period, exclamation mark, question mark, colon, or em dash, but punctuation is
  /// optional for the final sentence. Words within sentences are demarcated by whitespace, which is retained in its
  /// original form after conversion to sentence casing.
  ///
  /// ```
  /// // Here is some text, FYI. I hope you like it! Peace
  /// 'here is some text, FYI. I hope you like it! peace'.toSentenceCase();
  /// ```
  String toSentenceCase({bool convertAcryonyms = false}) {
    final result = _transformSentences(
      this,
      convertAcronyms: convertAcryonyms,
      transformWord: (word, isFirstWordInSentence) =>
          isFirstWordInSentence ? _capitalizeWord(word) : word.toLowerCase(),
    );
    return result;
  }

  /// Transforms this [String] to title casing.
  ///
  /// Title casing ensures that the first letter of each word is capitalized. By default, acronyms are excepted from
  /// conversion. However, if [convertAcronyms] is `true`, they will also be converted with the same logic.
  ///
  /// Words are demarcated by whitespace, which is retained in its original form after conversion to title casing. No
  /// attempt is made to identify short prepositions in order to avoid capitalizing them.
  ///
  /// ```
  /// // Here Is Some Text, FYI. I Hope You Like It! Peace
  /// 'here is some text, FYI. I hope you like it! peace'.toTitleCase();
  /// ```
  String toTitleCase({bool convertAcryonyms = false}) {
    final result = _transformSentences(
      this,
      convertAcronyms: convertAcryonyms,
      transformWord: (word, isFirstWordInSentence) => _capitalizeWord(word),
    );
    return result;
  }

  String _transformSentences(
    String sentences, {
    required bool convertAcronyms,
    required _TransformWord transformWord,
  }) {
    final sentenceMatches = _sentenceExpression.allMatches(this);
    final result = sentenceMatches.map((sentenceMatch) {
      final sentence = sentenceMatch.group(1);
      final punctuation = sentenceMatch.group(2);

      if (sentence == null) {
        return punctuation ?? '';
      } else {
        final sentenceWithSentenceCasing = _transformSentence(
          sentence,
          convertAcronyms: convertAcronyms,
          transformWord: transformWord,
        );
        return '$sentenceWithSentenceCasing${punctuation ?? ''}';
      }
    }).join();

    return result;
  }

  String _transformSentence(
    String sentence, {
    required bool convertAcronyms,
    required _TransformWord transformWord,
  }) {
    final wordMatches = _wordExpression.allMatches(sentence).toList();

    final convertedSentence = wordMatches.fold<_RunningSentence>(_RunningSentence.initial(), (runningSentence, next) {
      final leadingWhitespace = next.group(1);
      final word = next.group(2);
      final trailingWhitespace = next.group(3);

      if (word == null) {
        return runningSentence.appendIfNonNull(leadingWhitespace);
      }

      final preserveCasing = !convertAcronyms && word.isUpperCase();

      if (preserveCasing) {
        // Don't convert the word because we want to preserve its casing.
        return runningSentence.appendIfNonNull(leadingWhitespace).append(word).appendIfNonNull(trailingWhitespace);
      } else {
        final isFirstWordInSentence = runningSentence.isBlank;

        return runningSentence
            .appendIfNonNull(leadingWhitespace)
            .append(transformWord(word, isFirstWordInSentence))
            .appendIfNonNull(trailingWhitespace);
      }
    });

    return convertedSentence.value;
  }

  String _capitalizeWord(String word) {
    final result = word.isEmpty ? word : '${word[0].toUpperCase()}${word.substring(1).toLowerCase()}';
    return result;
  }
}

typedef _TransformWord = String Function(String word, bool isFirstWordInSentence);

class _RunningSentence {
  _RunningSentence._({
    required this.value,
    required this.isBlank,
  });

  _RunningSentence.initial()
      : value = '',
        isBlank = true;

  final String value;
  final bool isBlank;

  _RunningSentence append(String part) => _RunningSentence._(
        value: '$value$part',
        isBlank: isBlank && part.isBlank(),
      );

  _RunningSentence appendIfNonNull(String? part) => part == null
      ? this
      : _RunningSentence._(
          value: '$value$part',
          isBlank: isBlank && part.isBlank(),
        );
}
