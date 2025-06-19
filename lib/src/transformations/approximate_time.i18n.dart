import 'package:i18n_extension_core/i18n_extension_core.dart';
import 'package:intl/intl.dart';

final justOver = Object();
final over = Object();
final under = Object();
final justUnder = Object();
final zero = Object();
final now = Object();
final yesterday = Object();
final tomorrow = Object();
final a = Object();
final an = Object();
final ago = Object();
final fromNow = Object();

extension ApproximateTimeLocalization on Object {
  static final _t = Translations.byId('en', {
    justOver: {'en': 'just over', 'pt': 'um pouco mais'},
    over: {'en-US': 'over', 'pt-BR': 'mais de'},
    under: {'en-US': 'under', 'pt-BR': 'menos de'},
    justUnder: {'en-US': 'just under', 'pt-BR': 'um pouco menos'},
    zero: {'en-US': 'zero', 'pt-BR': 'zero'},
    now: {'en-US': 'now', 'pt-BR': 'agora'},
    yesterday: {'en-US': 'yesterday', 'pt-BR': 'ontem'},
    tomorrow: {'en-US': 'tomorrow', 'pt-BR': 'amanhã'},
    an: {'en-US': 'an', 'pt-BR': 'uma'},
    a: {'en-US': 'a', 'pt-BR': 'um'},
    ago: {'en-US': 'ago', 'pt-BR': 'atrás'},
    fromNow: {'en-US': 'from now', 'pt-BR': 'a partir de agora'},
  });

  String i18n({
    String? locale,
  }) =>
      localize(this, _t, locale: locale ?? Intl.getCurrentLocale());
  String plural(value) => localizePlural(value, this, _t);
}
