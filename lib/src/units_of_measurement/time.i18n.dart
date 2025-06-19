import 'package:i18n_extension_core/i18n_extension_core.dart';
import 'package:intl/intl.dart';

final nanosecond = Object();
final microsecond = Object();
final millisecond = Object();
final centisecond = Object();
final decisecond = Object();
final second = Object();
final decasecond = Object();
final minute = Object();
final hour = Object();
final day = Object();
final week = Object();
final fortnight = Object();
final month = Object();
final quarter = Object();
final year = Object();
final decade = Object();
final century = Object();

final ns = Object();
final us = Object();
final ms = Object();
final cs = Object();
final ds = Object();
final s = Object();
final das = Object();
final min = Object();
final hr = Object();
final d = Object();
final wk = Object();
final fn = Object();
final mo = Object();
final qr = Object();
final yr = Object();
final dec = Object();
final c = Object();

extension TimeUnitI18n on Object {
  static final _t = Translations.byId('en-US', {
    nanosecond: {'en-US': 'nanosecond', 'pt-BR': 'nanosegundo'},
    microsecond: {'en-US': 'microsecond', 'pt-BR': 'microssegundo'},
    millisecond: {'en-US': 'millisecond', 'pt-BR': 'milissegundo'},
    centisecond: {'en-US': 'centisecond', 'pt-BR': 'centissegundo'},
    decisecond: {'en-US': 'decisecond', 'pt-BR': 'decissegundo'},
    second: {'en-US': 'second', 'pt-BR': 'segundo'},
    decasecond: {'en-US': 'decasecond', 'pt-BR': 'decassegundo'},
    minute: {'en-US': 'minute', 'pt-BR': 'minuto'},
    hour: {'en-US': 'hour', 'pt-BR': 'hora'},
    day: {'en-US': 'day', 'pt-BR': 'dia'},
    week: {'en-US': 'week', 'pt-BR': 'semana'},
    fortnight: {'en-US': 'fortnight', 'pt-BR': 'quinzena'},
    month: {'en-US': 'month', 'pt-BR': 'mês'},
    quarter: {'en-US': 'quarter', 'pt-BR': 'trimestre'},
    year: {'en-US': 'year', 'pt-BR': 'ano'},
    decade: {'en-US': 'decade', 'pt-BR': 'década'},
    century: {'en-US': 'century', 'pt-BR': 'século'},
    ns: {'en-US': 'ns', 'pt-BR': 'ns'},
    us: {'en-US': 'μs', 'pt-BR': 'μs'},
    ms: {'en-US': 'ms', 'pt-BR': 'ms'},
    cs: {'en-US': 'cs', 'pt-BR': 'cs'},
    ds: {'en-US': 'ds', 'pt-BR': 'ds'},
    s: {'en-US': 's', 'pt-BR': 's'},
    das: {'en-US': 'das', 'pt-BR': 'das'},
    min: {'en-US': 'min', 'pt-BR': 'min'},
    hr: {'en-US': 'hr', 'pt-BR': 'h'},
    d: {'en-US': 'd', 'pt-BR': 'd'},
    wk: {'en-US': 'wk', 'pt-BR': 'sem'},
    fn: {'en-US': 'fn', 'pt-BR': 'qnz'},
    mo: {'en-US': 'mo', 'pt-BR': 'mês'},
    qr: {'en-US': 'qr', 'pt-BR': 'tri'},
    yr: {'en-US': 'yr', 'pt-BR': 'a'},
    dec: {'en-US': 'dec', 'pt-BR': 'déc'},
    c: {'en-US': 'c', 'pt-BR': 'séc'},
  });

  String i18n({
    String? locale,
  }) =>
      localize(this, _t, locale: locale ?? Intl.getCurrentLocale());
  String plural(value) => localizePlural(value, this, _t);
}
