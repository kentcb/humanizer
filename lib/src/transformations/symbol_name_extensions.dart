import 'package:humanizer/src/transformations/symbol_name.dart';
import 'package:intl/intl.dart';

/// Provides humanizing extensions on [SymbolName].
extension SymbolNameExtensions on SymbolName {
  /// Gets a humanized transformation of this [SymbolName] under the assumption that it is camel-, pascal-, snake-, or
  /// kebab-cased.
  ///
  /// ```
  /// // 'some symbol name'
  /// SymbolName('someSymbolName').toHumanizedName();
  ///
  /// // 'another symbol name'
  /// SymbolName('another_symbol_name').toHumanizedName();
  /// ```
  ///
  /// See also:
  /// * [SymbolToHumanizedNameTransformation]
  String toHumanizedName({String? locale}) =>
      const SymbolToHumanizedNameTransformation()
          .transform(this, locale ?? Intl.getCurrentLocale());
}

/// Provides symbol-related humanizing extensions on [Enum].
extension EnumExtensions on Enum {
  /// Returns a human-readable value of this enumeration value.
  String toHumanizedName({String? locale}) =>
      SymbolName(toString().split('.').last).toHumanizedName(locale: locale);
}
