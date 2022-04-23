/// Facilitates transforming a value of type [T] to type [U].
///
/// This abstraction is used to encapsulate the many transformations provided by the Humanizer library. The advantages
/// of this abstraction include consistency and unification.
abstract class Transformation<T, U> {
  /// Creates an instance of [Transformation].
  const Transformation();

  /// Transforms [input] into an instance of [U] using the provided [locale].
  U transform(T input, String locale);
}

/// A definition for functions that can be passed into [FunctionTransformation].
typedef TransformationFunction<T, U> = U Function(T input, String locale);

/// A [Transformation] that invokes a given function of type [TransformationFunction].
///
/// This class is intended as a convenience, and is typically used in conjunction with a lambda. It can be used when
/// a transformation is required as part of a larger transformation, but that transformation is not typically useful
/// outside that context.
///
/// ```
/// final letterCountForNumber = const CardinalWordsTransformation().then(FunctionTransformation<String, String>(
///     (input, locale) => 'That number has ${input.length} characters when written in cardinal form'));
/// ```
class FunctionTransformation<T, U> extends Transformation<T, U> {
  const FunctionTransformation(this.lambda);

  final TransformationFunction<T, U> lambda;

  @override
  U transform(T input, String locale) => lambda(input, locale);
}

/// Provides useful extensions against [Transformation].
extension TransformationExtensions<T, U, V> on Transformation<T, U> {
  /// Chains together two transformations where the output of the first transformation becomes the input of the second.
  ///
  /// This method can be used to compose compatible transformations. The output type of the first transformation must
  /// match the input type of the second.
  Transformation<T, V> then(Transformation<U, V> transformation) =>
      _ComposedTransition(
        first: this,
        second: transformation,
      );
}

class _ComposedTransition<T, U, V> extends Transformation<T, V> {
  _ComposedTransition({
    required this.first,
    required this.second,
  });

  final Transformation<T, U> first;
  final Transformation<U, V> second;

  @override
  V transform(T input, String locale) {
    final firstResult = first.transform(input, locale);
    final secondResult = second.transform(firstResult, locale);
    return secondResult;
  }
}
