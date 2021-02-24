# API Layers

The Humanizer library is designed in a layered fashion, providing multiple levels of API surfaces to increase usability and flexibility. The layers, from highest level to lowest, are:

1. Extensions
1. Transformations
1. Domain (where relevant)

##  Extensions

The easiest way to use Humanizer is via its extensions layer, which exposes lower layers in a quick and simple manner, albeit with reduced flexibility. It's called the extensions layer because it consists entirely of extension method that forward onto the next layer (transformations).

An example of using the extensions layer is:

```dart
// 'forty-two'
final words = 42.toCardinalWords();
```

Whilst the extensions layer is convenient and often a good first option, it has some limitations:

* It may not expose all underlying options from the transformations layer.
* It does not include any out-of-the-box composition support like the transformations layer does (see discussion below).
* It may have poorer performance than using the transformations layer directly depending on whether it needs to recreate a transformation on each invocation (i.e. the transformation cannot be a `const`).

It is recommended that you use the extensions layer until compelled otherwise, at which point you may want to look at using the transformations layer.

> To understand the extensions provided for each Humanizer feature, see the documentation for that feature and the API documentation.

## Transformations

The transformations layer formalizes the process of transformation via an interface:

```dart
abstract class Transformation<T, U> {
  const Transformation();

  U transform(T input, String locale);
}
```

As you can see, it simply provides a `transform` method that turns a generic `T` into a generic `U` given a locale. All transformations in Humanizer provide an implementation of this interface. In fact, many primarily manifest within such an implementation with little else to them other than extension methods for the extensions layer.

The advantages of formalizing and reifying transformations in this manner are consistency and composition. The afforded consistency is self-evident, given that all transformations adhere to the same interface. It also has a positive impact on the code base, making it easier to understand and work with. The composition advantage is perhaps more subtle, but it means it is possible to easily string together transformations so that the output of one feeds into the input of the next. Indeed, Humanizer provides a general composition extension to do exactly that, which makes the following code possible:

```dart
final composed = const CardinalWordsTransformation()
    .then(const ToTitleCaseTransformation(convertAcronyms: false))
    .then(const TruncateToFixedLengthTransformation(
      length: 20,
      truncationIndicator: '…',
      truncateAt: TruncateAt.start,
    ));
// 'Forty-two'
final result1 = composed.transform(42, 'en');

// '…ndred And Forty-two'
final result2 = composed.transform(1642, 'en');
```

This code strings together three distinct transformations to achieve a (somewhat contrived) desired result. Notice the use of `then` to pipe one transformation output into the input of the next.

> To understand the transformations provided for each Humanizer feature, see the documentation for that feature and the API documentation.

## Domain

Some Humanizer features (at the time of writing, only units of measurement) do not have corresponding Dart types to represent the underlying domain. In that case, the feature will provide lower-level types in lieu of something from the Dart SDK. For example, the units of measurement feature provides value types to represent specific unit values, as well as format types that convert said values to strings. That said, it still exposes this lower-level functionality through both the transformations and extensions layers.

> To understand the types provided for relevant Humanizer feature, see the documentation for that feature and the API documentation.
