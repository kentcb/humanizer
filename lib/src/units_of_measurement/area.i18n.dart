import 'package:i18n_extension_core/i18n_extension_core.dart';
import 'package:intl/intl.dart';

// Variáveis para os nomes completos das unidades de área (para getName)
final squareNanometer = Object();
final squareMicrometer = Object();
final squareMillimeter = Object();
final squareCentimeter = Object();
final squareDecimeter = Object();
final squareMeter = Object();
final squareDecameter = Object();
final hectare = Object();
final squareKilometer = Object();
final squareMegameter = Object();
final squareGigameter = Object();

final squareThou = Object();
final squareInch = Object();
final squareFoot = Object();
final squareYard = Object();
final acre = Object();
final squareMile = Object();

// Variáveis para os SÍMBOLOS das unidades de área (para getSymbol)
final squareNanometerSymbol = Object();
final squareMicrometerSymbol = Object();
final squareMillimeterSymbol = Object();
final squareCentimeterSymbol = Object();
final squareDecimeterSymbol = Object();
final squareMeterSymbol = Object();
final squareDecameterSymbol = Object();
final hectareSymbol = Object();
final squareKilometerSymbol = Object();
final squareMegameterSymbol = Object();
final squareGigameterSymbol = Object();

final squareThouSymbol = Object();
final squareInchSymbol = Object();
final squareFootSymbol = Object();
final squareYardSymbol = Object();
final acreSymbol = Object();
final squareMileSymbol = Object();

extension AreaUnitI18n on Object {
  static final _t = Translations.byId('en-US', {
    // Nomes completos das unidades (para getName) - SI
    squareNanometer: {
      'en-US': 'square nanometer',
      'pt-BR': 'nanômetro quadrado'
    },
    squareMicrometer: {
      'en-US': 'square micrometer',
      'pt-BR': 'micrômetro quadrado'
    },
    squareMillimeter: {
      'en-US': 'square millimeter',
      'pt-BR': 'milímetro quadrado'
    },
    squareCentimeter: {
      'en-US': 'square centimeter',
      'pt-BR': 'centímetro quadrado'
    },
    squareDecimeter: {
      'en-US': 'square decimeter',
      'pt-BR': 'decímetro quadrado'
    },
    squareMeter: {'en-US': 'square meter', 'pt-BR': 'metro quadrado'},
    squareDecameter: {
      'en-US': 'square decameter',
      'pt-BR': 'decâmetro quadrado'
    },
    hectare: {'en-US': 'hectare', 'pt-BR': 'hectare'},
    squareKilometer: {
      'en-US': 'square kilometer',
      'pt-BR': 'quilômetro quadrado'
    },
    squareMegameter: {
      'en-US': 'square megameter',
      'pt-BR': 'megâmetro quadrado'
    },
    squareGigameter: {
      'en-US': 'square gigameter',
      'pt-BR': 'gigâmetro quadrado'
    },

    // Nomes completos das unidades (para getName) - Imperial
    squareThou: {
      'en-US': 'square thou',
      'pt-BR': 'milésimo de polegada quadrado'
    },
    squareInch: {'en-US': 'square inch', 'pt-BR': 'polegada quadrada'},
    squareFoot: {'en-US': 'square foot', 'pt-BR': 'pé quadrado'},
    squareYard: {'en-US': 'square yard', 'pt-BR': 'jarda quadrada'},
    acre: {'en-US': 'acre', 'pt-BR': 'acre'},
    squareMile: {'en-US': 'square mile', 'pt-BR': 'milha quadrada'},

    // Símbolos das unidades (para getSymbol) - SI
    squareNanometerSymbol: {'en-US': 'nm²', 'pt-BR': 'nm²'},
    squareMicrometerSymbol: {'en-US': 'μm²', 'pt-BR': 'μm²'},
    squareMillimeterSymbol: {'en-US': 'mm²', 'pt-BR': 'mm²'},
    squareCentimeterSymbol: {'en-US': 'cm²', 'pt-BR': 'cm²'},
    squareDecimeterSymbol: {'en-US': 'dm²', 'pt-BR': 'dm²'},
    squareMeterSymbol: {'en-US': 'm²', 'pt-BR': 'm²'},
    squareDecameterSymbol: {'en-US': 'dam²', 'pt-BR': 'dam²'},
    hectareSymbol: {'en-US': 'ha', 'pt-BR': 'ha'},
    squareKilometerSymbol: {'en-US': 'km²', 'pt-BR': 'km²'},
    squareMegameterSymbol: {'en-US': 'Mm²', 'pt-BR': 'Mm²'},
    squareGigameterSymbol: {'en-US': 'Gm²', 'pt-BR': 'Gm²'},

    // Símbolos das unidades (para getSymbol) - Imperial
    squareThouSymbol: {'en-US': 'thou²', 'pt-BR': 'thou²'},
    squareInchSymbol: {
      'en-US': 'in²',
      'pt-BR': 'pol²'
    }, // 'pol²' é um símbolo comum para polegada quadrada
    squareFootSymbol: {'en-US': 'ft²', 'pt-BR': 'pé²'},
    squareYardSymbol: {'en-US': 'yd²', 'pt-BR': 'jd²'},
    acreSymbol: {'en-US': 'ac', 'pt-BR': 'ac'},
    squareMileSymbol: {'en-US': 'mi²', 'pt-BR': 'mi²'},
  });

  String i18n({
    String? locale,
  }) =>
      localize(this, _t, locale: locale ?? Intl.getCurrentLocale());
  String plural(value) => localizePlural(value, this, _t);
}
