# Symbols

This feature allows you to convert programming symbol names into human-friendly representations. It supports camel-, pascal-, snake-, and kebab-cased symbol names. It intelligently identifies acronyms and leaves them unaltered, as well as special-casing the word "I".

## Extensions

The `toHumanizedName` extension method implements the extensions layer for this feature.

```dart
// 'some symbol name'
SymbolName('someSymbolName').toHumanizedName();

// 'another symbol name'
SymbolName('another_symbol_name').toHumanizedName();

// 'you and I are GOAT'
SymbolName('YouAndIAreGOAT').toHumanizedName();
```

Note the use of the `SymbolName` wrapper type, avoiding the need to define the extension method against `String`, which would pollute code completion.

## Transformations

The `SymbolToHumanizedNameTransformation` class implements the transformation layer for this feature.

```dart
const transformation = SymbolToHumanizedNameTransformation();

// 'you and I are GOAT'
transformation.transform(SymbolName('YouAndIAreGOAT'), 'en');
```