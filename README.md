# humanizer

Converts Dart values into human-friendly representations.

## Features

TODO: docs (for now, just keeping track of each feature as I add it)
TODO: review all these extension methods (and their containing types) and try to come up with a super consistent and natural naming scheme. Also, the API docs should all include examples of the extension methods rather than only transformations themselves.

* `humanizeSymbolName`
* `toSentenceCase`
* `toTitleCase`
* `truncate`
* `humanizeRelativeDateTime`
* `toPluralForm`/`toSingularForm`/`toPluralFormForQuantity`
* `toOrdinalNumerical`/`toOrdinalWords`
* `toCardinalWords`
* units of measure

### API Layers

Three layers:

* humanizing (high level): provides convenience extension methods. Uses the transformation level layer to do work.
* transformation (mid level): provides a general mechanism for transforming values and composing those
  transformations.
* value types (low level): some humanizing requires custom value types because Dart has nothing built in. e.g. units of measure.

Demonstrate the differences between these by implementing Dart enumeration member name transformation.

### Internationalization

All APIs take a locale, but currently the library is English-only. i.e. The API is i18n ready, but only English in
practice.

## Shoutouts

Humanizer .NET
pluralize (https://github.com/plurals/pluralize)
ByteSize (https://github.com/omar/ByteSize)

## TODO

* overall docs (see notes above)
* what/how/who style readme
* contributors
* CI?