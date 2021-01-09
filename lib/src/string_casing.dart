import 'package:humanizer/src/string_predicates.dart';

/// Provides casing-related extension methods on [String].
extension StringCasing on String {
  static final _punctuationExpression = RegExp(r'([^\.\!\?]+)?([\.\!\?]+)?');
  static final _whitespaceExpression = RegExp(r'(\s+)?(\S+)?(\s+)?');

  /// Transforms this [String] to sentence casing.
  ///
  /// Sentence casing ensures that only the first letter of each sentence is capitalized. By default, acronyms are
  /// excepted from conversion. However, if [convertAcronyms] is `true`, they will also be converted with the same
  /// logic.
  ///
  /// Sentences are demarcated by a period, exclamation mark, or question mark, but punctuation is optional for the
  /// final sentence. Words within sentences are demarcated by whitespace, which is retained in its original form after
  /// conversion to sentence casing.
  ///
  /// ```
  /// // Here is some text, FYI. I hope you like it! Peace
  /// 'here is some text, FYI. I hope you like it! peace'.toSentenceCase();
  /// ```
  String toSentenceCase({bool convertAcryonyms = false}) {
    String convertSingleSentenceToSentenceCase(String sentence) {
      final words = _whitespaceExpression.allMatches(sentence).toList();

      final convertedSentence = words.fold<_RunningSentence>(_RunningSentence.initial(), (runningSentence, next) {
        final leadingWhitespace = next.group(1);
        final word = next.group(2);
        final trailingWhitespace = next.group(3);

        if (word == null) {
          return runningSentence.appendIfNonNull(leadingWhitespace);
        }

        final preserveCasing = !convertAcryonyms && word.isUpperCase();

        if (preserveCasing) {
          // Don't convert the word because we want to preserve its casing.
          return runningSentence.appendIfNonNull(leadingWhitespace).append(word).appendIfNonNull(trailingWhitespace);
        } else if (runningSentence.isBlank) {
          // Adding the first non-blank portion to the sentence, so capitalize it.
          return runningSentence
              .appendIfNonNull(leadingWhitespace)
              .append(_capitalizeWord(word))
              .appendIfNonNull(trailingWhitespace);
        } else {
          // Sentence already capitalized, so convert the word to lower case.
          return runningSentence
              .appendIfNonNull(leadingWhitespace)
              .append(word.toLowerCase())
              .appendIfNonNull(trailingWhitespace);
        }
      });

      return convertedSentence.value;
    }

    final sentenceMatches = _punctuationExpression.allMatches(this);
    final result = sentenceMatches.map((sentenceMatch) {
      final sentence = sentenceMatch.group(1);
      final punctuation = sentenceMatch.group(2);

      if (sentence == null) {
        return punctuation ?? '';
      } else {
        final sentenceWithSentenceCasing = convertSingleSentenceToSentenceCase(sentence);
        return '$sentenceWithSentenceCasing${punctuation ?? ''}';
      }
    }).join();

    return result;
  }

  // String toTitleCase() {
  // }

  String _capitalizeWord(String word) {
    final result = word.isEmpty ? word : '${word[0].toUpperCase()}${word.substring(1).toLowerCase()}';
    return result;
  }
}

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
