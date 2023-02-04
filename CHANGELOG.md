## 2.1.0 - 4th Feb, 2023

* Update dependencies

## 2.0.0 - 23rd Apr, 2022

* Switched to using `Rational` as the basis for units of measurement rather than `Decimal`
  > This is a breaking change. It allows for running calculations to be performed without loss of precision. A `Decimal` is a wrapper around `Rational`, so most call sites can be fixed by simple substitution.
* Added support for dimensionless quantities to units of measurement feature, which allows you to humanize large numbers

## 1.0.0 - 16th Oct, 2021

* Improved the design and implementation of units of measurement, particularly around formatting
* Add ability to humanize `Enum` instances
* Symbol related extensions now operate against a `SymbolName` class rather than `String`
* Generalize approximate relative time to approximate time
* Switch to using `DecimalIntl` now that [this issue](https://github.com/a14n/dart-decimal/issues/35) is resolved

## 0.0.2 - 26th Feb, 2021

* Add permissible units to units of measurement `humanize` extensions
* Add example
* Bump `decimal` dependency to stable, null-safe version (`1.0.0`)

## 0.0.1-nullsafety - 25th Feb, 2021

* Initial release