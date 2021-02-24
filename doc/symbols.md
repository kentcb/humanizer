# Symbols

This feature allows you to convert programming symbol names into human-friendly representations. It supports camel-, pascal-, snake-, and kebab-cased symbol names. It intelligently identifies acronyms and leaves them unaltered, as well as special-casing the word "I".

## Extensions

The `humanizeSymbolName` extension method implements the extensions layer for this feature.

```dart
// 'some symbol name'
'someSymbolName'.humanizeSymbolName();

// 'another symbol name'
'another_symbol_name'.humanizeSymbolName();

// 'you and I are GOAT'
'YouAndIAreGOAT'.humanizeSymbolName();
```

## Transformations

The `SymbolNameTransformation` class implements the transformation layer for this feature.

```dart
const transformation = SymbolNameTransformation();

// 'you and I are GOAT'
transformation.transform('YouAndIAreGOAT', 'en');
```