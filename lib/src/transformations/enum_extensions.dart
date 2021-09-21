/// Provides extensions for [Enum] type
extension EnumExtensions on Enum {
  /// Returns an human readable value of this enum value.
  String get humanized => toString().split('.').last;
}
