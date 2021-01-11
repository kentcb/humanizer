# humanizer

Converts Dart values into human-friendly representations.


## Features

TODO: docs (for now, just keeping track of each feature as I add it)

* `humanizeSymbolName`
* `toSentenceCase`
* `toTitleCase`
* `truncate`

## Design Notes

### API Layers

I think there might be two APIs: humanizing (high level) and transformation ("low" level). Humanizing APIs just use the transformation API to do their work - they just bundle common settings and make it easier to get going. I need to understand the transformation API better as I flesh this out. I may just be imagining it at this point, but I feel like we should maybe have something like this:

```dart
abstract class Transformation<T, U> {
    U transform(T);
}

extension TransformationExtensions on Transformation<T, U> {
    Transformation<T, V> then<T, U, V>(Transformation<U, V> next) {
        ...
    }
}
```

Because Dart doesn't have particularly strong function composition/currying support, I think the above OOP approach makes the most sense. I'd then break down all the transformations in the library into individual types (e.g. `ToTitleCaseTransformation`) and leverage those from the humanizing API.

As an example of documenting the transformation API, I could show how to define a transformation from a Dart enumeration value name to sentence casing, including pros and cons of using `then` (if that's what I call it) versus writing your own wrapper transformation.

### Internationalization

All APIs will need to take an optional locale. I think I'll be forced to take a dependency on `intl` so I can use `defaultLocale` to default that value when it isn't explicitly provided.