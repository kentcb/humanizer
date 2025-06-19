import 'package:i18n_extension_core/i18n_extension_core.dart';
import 'package:intl/intl.dart';

final second = Object();
final minute = Object();
final hour = Object();
final day = Object();
final week = Object();

final s = Object();
final min = Object();
final hr = Object();
final wk = Object();

extension RateUnitExtensions on Object {
  static final _t = Translations.byId('en-US', {
    second: {'en-US': 'second', 'pt-BR': 'segundo'},
    minute: {'en-US': 'minute', 'pt-BR': 'minuto'},
    hour: {'en-US': 'hour', 'pt-BR': 'hora'},
    day: {'en-US': 'day', 'pt-BR': 'dia'},
    week: {'en-US': 'week', 'pt-BR': 'semana'},
    s: {'en-US': 's', 'pt-BR': 's'},
    min: {'en-US': 'min', 'pt-BR': 'min'},
    hr: {'en-US': 'hr', 'pt-BR': 'h'},
    wk: {'en-US': 'wk', 'pt-BR': 'sem'},
  });

  String i18n({
    String? locale,
  }) =>
      localize(this, _t, locale: locale ?? Intl.getCurrentLocale());
  String plural(value) => localizePlural(value, this, _t);
}
