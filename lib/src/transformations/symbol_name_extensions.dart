import 'package:humanizer/src/transformations/symbol_name.dart';
import 'package:intl/intl.dart';

/// Provides symbol-related humanizing extensions on [String].
extension SymbolNameExtensions on String {
  /// Gets a humanized transformation of this [String] under the assumption that it is camel-, pascal-, snake-, or
  /// kebab-cased.
  ///
  /// ```
  /// // 'some symbol name'
  /// 'someSymbolName'.humanizeSymbolName();
  ///
  /// // 'another symbol name'
  /// 'another_symbol_name'.humanizeSymbolName();
  /// ```
  ///
  /// See also:
  /// * [SymbolNameTransformation]
  String humanizeSymbolName({String? locale}) =>
      const SymbolNameTransformation()
          .transform(this, locale ?? Intl.getCurrentLocale());
}
