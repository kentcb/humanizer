import 'package:i18n_extension_core/i18n_extension_core.dart';
import 'package:intl/intl.dart';

// Variáveis para os nomes completos das unidades de temperatura (para getName)
final nanokelvin = Object();
final microkelvin = Object();
final millikelvin = Object();
final centikelvin = Object();
final decikelvin = Object();
final kelvin = Object();

final celsius = Object();
final fahrenheit = Object();

// Variáveis para os SÍMBOLOS das unidades de temperatura (para getSymbol)
final nanokelvinSymbol = Object();
final microkelvinSymbol = Object();
final millikelvinSymbol = Object();
final centikelvinSymbol = Object();
final decikelvinSymbol = Object();
final kelvinSymbol = Object();

final celsiusSymbol = Object();
final fahrenheitSymbol = Object();

extension TemperatureUnitI18n on Object {
  static final _t = Translations.byId('en-US', {
    // Nomes completos das unidades (para getName) - SI
    nanokelvin: {'en-US': 'nanokelvin', 'pt-BR': 'nanokelvin'},
    microkelvin: {'en-US': 'microkelvin', 'pt-BR': 'microkelvin'},
    millikelvin: {'en-US': 'millikelvin', 'pt-BR': 'millikelvin'},
    centikelvin: {'en-US': 'centikelvin', 'pt-BR': 'centikelvin'},
    decikelvin: {'en-US': 'decikelvin', 'pt-BR': 'decikelvin'},
    kelvin: {'en-US': 'kelvin', 'pt-BR': 'kelvin'},

    // Nomes completos das unidades (para getName) - Celsius
    celsius: {'en-US': 'Celsius', 'pt-BR': 'Celsius'},

    // Nomes completos das unidades (para getName) - Fahrenheit
    fahrenheit: {'en-US': 'Fahrenheit', 'pt-BR': 'Fahrenheit'},

    // Símbolos das unidades (para getSymbol) - SI
    nanokelvinSymbol: {'en-US': 'nK', 'pt-BR': 'nK'},
    microkelvinSymbol: {'en-US': 'μK', 'pt-BR': 'μK'},
    millikelvinSymbol: {'en-US': 'mK', 'pt-BR': 'mK'},
    centikelvinSymbol: {'en-US': 'cK', 'pt-BR': 'cK'},
    decikelvinSymbol: {'en-US': 'dK', 'pt-BR': 'dK'},
    kelvinSymbol: {'en-US': 'K', 'pt-BR': 'K'},

    // Símbolos das unidades (para getSymbol) - Celsius
    celsiusSymbol: {'en-US': '°C', 'pt-BR': '°C'},

    // Símbolos das unidades (para getSymbol) - Fahrenheit
    fahrenheitSymbol: {'en-US': '°F', 'pt-BR': '°F'},
  });

  String i18n({
    String? locale,
  }) =>
      localize(this, _t, locale: locale ?? Intl.getCurrentLocale());
  String plural(value) => localizePlural(value, this, _t);
}
