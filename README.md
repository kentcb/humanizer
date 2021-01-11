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

Two layers:

* humanizing (high level): provides convenience extension methods. Uses the transformation level layer to do work.
* transformation ("low" level): provides a general mechanism for transforming values and composing those
  transformations.

Demonstrate the differences between these by implementing Dart enumeration member name transformation.
### Internationalization

All APIs take a locale, but currently the library is English-only.