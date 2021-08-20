import 'package:humanizer/src/transformations/symbol_name.dart';
import 'package:intl/intl.dart';

/// Provides symbol-related humanizing extensions on [SymbolName].
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
      const SymbolToHumanizedNameTransformation().transform(this, locale ?? Intl.getCurrentLocale());
}
