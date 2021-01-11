import 'package:humanizer/src/transformations/humanize_symbol_name.dart';
import 'package:intl/intl.dart';

/// Provides symbol-related humanizing extensions on [String].
extension HumanizeSymbolNameExtensions on String {
  /// Gets a humanized transformation of this [String] under the assumption that it is camel-, pascal-, snake-, or
  /// kebab-cased.
  ///
  /// ```
  /// // 'Some symbol name'
  /// 'someSymbolName'.humanizeSymbolName();
  ///
  /// // 'Another symbol name'
  /// 'another_symbol_name'.humanizeSymbolName();
  /// ```
  ///
  /// See also:
  /// * [HumanizeSymbolNameTransformation]
  String humanizeSymbolName({String? locale}) =>
      const HumanizeSymbolNameTransformation().transform(this, locale ?? Intl.getCurrentLocale());
}
