import 'package:i18n_extension_core/i18n_extension_core.dart';
import 'package:intl/intl.dart';

// Variáveis para os nomes completos das unidades de quantidade (para getName)
final quantityOne = Object();
final quantityThousand = Object();
final quantityMillion = Object();
final quantityBillion = Object();
final quantityTrillion = Object();

// Variáveis para os SÍMBOLOS das unidades de quantidade (para getSymbol)
final quantityThousandSymbolUS = Object(); // K
final quantityThousandSymbolUK = Object(); // k
final quantityMillionSymbolUS = Object(); // M
final quantityMillionSymbolUK = Object(); // m
final quantityBillionSymbolUS = Object(); // B
final quantityBillionSymbolUK = Object(); // bn
final quantityTrillionSymbolUS = Object(); // T
final quantityTrillionSymbolUK = Object(); // tn

extension QuantityUnitI18n on Object {
  static final _t = Translations.byId('en-US', {
    // Nomes completos das unidades (para getName)
    quantityOne: {'en-US': '', 'pt-BR': ''}, // Vazio para "one"
    quantityThousand: {'en-US': 'thousand', 'pt-BR': 'mil'},
    quantityMillion: {'en-US': 'million', 'pt-BR': 'milhão'},
    quantityBillion: {'en-US': 'billion', 'pt-BR': 'bilhão'},
    quantityTrillion: {'en-US': 'trillion', 'pt-BR': 'trilhão'},

    // Símbolos das unidades (para getSymbol) - US (padrão)
    quantityThousandSymbolUS: {'en-US': 'K', 'pt-BR': 'K'},
    quantityMillionSymbolUS: {'en-US': 'M', 'pt-BR': 'M'},
    quantityBillionSymbolUS: {'en-US': 'B', 'pt-BR': 'B'},
    quantityTrillionSymbolUS: {'en-US': 'T', 'pt-BR': 'T'},

    // Símbolos das unidades (para getSymbol) - UK
    quantityThousandSymbolUK: {'en-US': 'k', 'pt-BR': 'k'},
    quantityMillionSymbolUK: {'en-US': 'm', 'pt-BR': 'm'},
    quantityBillionSymbolUK: {'en-US': 'bn', 'pt-BR': 'bi'},
    quantityTrillionSymbolUK: {'en-US': 'tn', 'pt-BR': 'tri'},
  });

  String i18n({
    String? locale,
  }) =>
      localize(this, _t, locale: locale ?? Intl.getCurrentLocale());
  String plural(value) => localizePlural(value, this, _t);
}
