import 'package:humanizer/humanizer.dart';

/// Provides extensions for [Enum] type
extension EnumExtensions on Enum {
  /// Returns a human-readable value of this enumeration value.
  String toHumanizedName({String? locale}) => SymbolName(toString().split('.').last).toHumanizedName(locale: locale);
}
