# Humanizer
[![pub package](https://img.shields.io/pub/v/humanizer.svg)](https://pub.dartlang.org/packages/humanizer)
<!-- ALL-CONTRIBUTORS-BADGE:START - Do not remove or modify this section -->
<!-- ALL-CONTRIBUTORS-BADGE:END -->

> Humanizer is currently in preview. APIs are not yet finalized. We welcome feedback and suggestions as we work towards a stable release.
## What?

A Dart library to convert values into human-friendly representations.

## Why?

When writing user interfaces we often want to present data we have in a raw format in a way that makes sense to the end user, but doing so is often non-trivial. This library aims to make such conversions easy and flexible.

## Where?

Firstly, [install the humanizer package](https://pub.dev/packages/humanizer/install), then you can import Humanizer into your Dart code as follows:

```dart
import 'package:humanizer/humanizer.dart';
```

## How?

This library has a broad API surface, and in fact has multiple API layers as discussed [here](doc/api_layers.md). The following table gives a high level overview of the various features, with links to deeper discussion:

| Feature | Description |
|-|-|
| [Symbols](doc/symbols.md) | Transform programming symbol names into human-friendly representations. |
| [String casing](doc/string_casing.md) | Transforms input strings to `Sentence case` or `Title Case`. |
| [String truncation](doc/string_truncation.md) | Intelligently truncates input strings. |
| [Approximate relative time](doc/approximate_relative_time.md) | Describes a `DateTime` relative to "now" in a human-friendly manner. |
| [Plurality](doc/plurality.md) | Alters the plurality of an input word. |
| [Ordinal numbers](doc/ordinal_numbers.md) | Converts an integral value to ordinal form (`1st` / `first`, `2nd` / `second` etc). |
| [Cardinal numbers](doc/cardinal_numbers.md) | Converts an integral value to cardinal form (`one`, `two`, `three` etc). |
| [Units of measurement](doc/units_of_measurement.md) | Provides types to represent common units of measurement and the ability to convert those types to a human-readable form. |

Note that whilst this library is locale-aware, it currently only includes an English implementation.

## Who?

Thanks goes to these wonderful people ([emoji key](https://allcontributors.org/docs/en/emoji-key)):

<!-- ALL-CONTRIBUTORS-LIST:START - Do not remove or modify this section -->
<!-- ALL-CONTRIBUTORS-LIST:END -->

This project follows the [all-contributors](https://github.com/all-contributors/all-contributors) specification. Contributions of any kind welcome!

Special thanks to these inspirational open source libraries:
* [Humanizer](https://github.com/Humanizr/Humanizer) (.NET)
* [Pluralize](https://github.com/plurals/pluralize)
* [ByteSize](https://github.com/omar/ByteSize)
