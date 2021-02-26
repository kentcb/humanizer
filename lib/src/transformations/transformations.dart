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
