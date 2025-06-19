import 'package:i18n_extension_core/i18n_extension_core.dart';
import 'package:intl/intl.dart';

// Variáveis para os nomes completos das unidades de volume (para getName)
final cubicNanometer = Object();
final cubicMicrometer = Object();
final cubicMillimeter = Object();
final milliliter = Object();
final liter = Object();
final cubicMeter = Object();
final cubicDecameter = Object();
final cubicKilometer = Object();
final cubicMegameter = Object();
final cubicGigameter = Object();

final cubicThou = Object();
final imperialTeaspoon = Object();
final imperialTablespoon = Object();
final imperialFluidOunce = Object();
final imperialCup = Object();
final imperialPint = Object();
final imperialQuart = Object();
final imperialGallon = Object();
final cubicInch = Object();
final cubicFoot = Object();
final cubicYard = Object();
final cubicMile = Object();

final usTeaspoon = Object();
final usTablespoon = Object();
final usFluidOunce = Object();
final usCustomaryCup = Object();
final usLegalCup = Object();
final usLiquidPint = Object();
final usLiquidQuart = Object();
final usLiquidGallon = Object();

final cubicNanometerSymbol = Object();
final cubicMicrometerSymbol = Object();
final cubicMillimeterSymbol = Object();
final milliliterSymbol = Object();
final literSymbol = Object();
final cubicMeterSymbol = Object();
final cubicDecameterSymbol = Object();
final cubicKilometerSymbol = Object();
final cubicMegameterSymbol = Object();
final cubicGigameterSymbol = Object();

final cubicThouSymbol = Object();
final imperialTeaspoonSymbol = Object();
final imperialTablespoonSymbol = Object();
final imperialFluidOunceSymbol = Object();
final imperialCupSymbol = Object();
final imperialPintSymbol = Object();
final imperialQuartSymbol = Object();
final imperialGallonSymbol = Object();
final cubicInchSymbol = Object();
final cubicFootSymbol = Object();
final cubicYardSymbol = Object();
final cubicMileSymbol = Object();

final usTeaspoonSymbol = Object();
final usTablespoonSymbol = Object();
final usFluidOunceSymbol = Object();
final usCustomaryCupSymbol = Object();
final usLegalCupSymbol = Object();
final usLiquidPintSymbol = Object();
final usLiquidQuartSymbol = Object();
final usLiquidGallonSymbol = Object();

// Variáveis para os patternSpecifiers
final imperialTeaspoonPattern = Object();
final imperialTablespoonPattern = Object();
final imperialFluidOuncePattern = Object();
final imperialCupPattern = Object();
final imperialPintPattern = Object();
final imperialGallonPattern = Object();

final usTeaspoonPattern = Object();
final usTablespoonPattern = Object();
final usCustomaryCupPattern = Object();
final usLegalCupPattern = Object();
final usFluidOuncePattern = Object();
final usLiquidPintPattern = Object();
final usLiquidGallonPattern = Object();

extension VolumeUnitI18n on Object {
  static final _t = Translations.byId('en-US', {
    // SI
    cubicNanometer: {'en-US': 'cubic nanometer', 'pt-BR': 'nanômetro cúbico'},
    cubicMicrometer: {
      'en-US': 'cubic micrometer',
      'pt-BR': 'micrômetro cúbico'
    },
    cubicMillimeter: {'en-US': 'cubic millimeter', 'pt-BR': 'milímetro cúbico'},
    milliliter: {'en-US': 'milliliter', 'pt-BR': 'mililitro'},
    liter: {'en-US': 'Liter', 'pt-BR': 'Litro'},
    cubicMeter: {'en-US': 'Cubic meter', 'pt-BR': 'Metro cúbico'},
    cubicDecameter: {'en-US': 'Cubic decameter', 'pt-BR': 'Decâmetro cúbico'},
    cubicKilometer: {'en-US': 'Cubic kilometer', 'pt-BR': 'Quilômetro cúbico'},
    cubicMegameter: {'en-US': 'Cubic megameter', 'pt-BR': 'Megâmetro cúbico'},
    cubicGigameter: {'en-US': 'Cubic gigameter', 'pt-BR': 'Gigâmetro cúbico'},

    // Imperial
    cubicThou: {'en-US': 'cubic thou', 'pt-BR': 'milésimo de polegada cúbico'},
    imperialTeaspoon: {
      'en-US': 'imperial teaspoon',
      'pt-BR': 'colher de chá imperial'
    },
    imperialTablespoon: {
      'en-US': 'Imperial tablespoon',
      'pt-BR': 'colher de sopa imperial'
    },
    imperialFluidOunce: {
      'en-US': 'Imperial fluid ounce',
      'pt-BR': 'onça fluida imperial'
    },
    imperialCup: {'en-US': 'Imperial cup', 'pt-BR': 'xícara imperial'},
    imperialPint: {'en-US': 'Imperial pint', 'pt-BR': 'pinta imperial'},
    imperialQuart: {'en-US': 'Imperial quart', 'pt-BR': 'quarto imperial'},
    imperialGallon: {'en-US': 'Imperial gallon', 'pt-BR': 'galão imperial'},
    cubicInch: {'en-US': 'Cubic inch', 'pt-BR': 'Polegada cúbica'},
    cubicFoot: {'en-US': 'Cubic foot', 'pt-BR': 'Pé cúbico'},
    cubicYard: {'en-US': 'Cubic yard', 'pt-BR': 'Jarda cúbica'},
    cubicMile: {'en-US': 'Cubic mile', 'pt-BR': 'Milha cúbica'},

    // US
    usTeaspoon: {'en-US': 'US teaspoon', 'pt-BR': 'colher de chá americana'},
    usTablespoon: {
      'en-US': 'US tablespoon',
      'pt-BR': 'colher de sopa americana'
    },
    usFluidOunce: {'en-US': 'US fluid ounce', 'pt-BR': 'onça fluida americana'},
    usCustomaryCup: {
      'en-US': 'US customary cup',
      'pt-BR': 'xícara comum americana'
    },
    usLegalCup: {'en-US': 'US legal cup', 'pt-BR': 'xícara legal americana'},
    usLiquidPint: {
      'en-US': 'US liquid pint',
      'pt-BR': 'pinta líquida americana'
    },
    usLiquidQuart: {
      'en-US': 'US liquid quart',
      'pt-BR': 'quarto líquido americano'
    },
    usLiquidGallon: {
      'en-US': 'US liquid gallon',
      'pt-BR': 'galão líquido americano'
    },

    // SI
    cubicNanometerSymbol: {'en-US': 'nm³', 'pt-BR': 'nm³'},
    cubicMicrometerSymbol: {'en-US': 'μm³', 'pt-BR': 'μm³'},
    cubicMillimeterSymbol: {'en-US': 'mm³', 'pt-BR': 'mm³'},
    milliliterSymbol: {'en-US': 'mL', 'pt-BR': 'mL'},
    literSymbol: {'en-US': 'L', 'pt-BR': 'L'},
    cubicMeterSymbol: {'en-US': 'm³', 'pt-BR': 'm³'},
    cubicDecameterSymbol: {'en-US': 'dam³', 'pt-BR': 'dam³'},
    cubicKilometerSymbol: {'en-US': 'km³', 'pt-BR': 'km³'},
    cubicMegameterSymbol: {'en-US': 'Mm³', 'pt-BR': 'Mm³'},
    cubicGigameterSymbol: {'en-US': 'Gm³', 'pt-BR': 'Gm³'},

    // Imperial
    cubicThouSymbol: {'en-US': 'thou³', 'pt-BR': 'thou³'},
    imperialTeaspoonSymbol: {'en-US': 'tsp', 'pt-BR': 'col.chá imp.'},
    imperialTablespoonSymbol: {'en-US': 'Tbsp', 'pt-BR': 'col.sopa imp.'},
    imperialFluidOunceSymbol: {'en-US': 'fl oz', 'pt-BR': 'oz.fl. imp.'},
    imperialCupSymbol: {'en-US': 'c', 'pt-BR': 'xíc. imp.'},
    imperialPintSymbol: {'en-US': 'pt', 'pt-BR': 'pt. imp.'},
    imperialQuartSymbol: {'en-US': 'qt', 'pt-BR': 'qt. imp.'},
    imperialGallonSymbol: {'en-US': 'gal', 'pt-BR': 'gal. imp.'},
    cubicInchSymbol: {'en-US': 'in³', 'pt-BR': 'pol³'},
    cubicFootSymbol: {'en-US': 'ft³', 'pt-BR': 'pé³'},
    cubicYardSymbol: {'en-US': 'yd³', 'pt-BR': 'jd³'},
    cubicMileSymbol: {'en-US': 'mi³', 'pt-BR': 'mi³'},

    // US
    usTeaspoonSymbol: {'en-US': 'tsp', 'pt-BR': 'col.chá EUA'},
    usTablespoonSymbol: {'en-US': 'Tbsp', 'pt-BR': 'col.sopa EUA'},
    usFluidOunceSymbol: {'en-US': 'fl oz', 'pt-BR': 'oz.fl. EUA'},
    usCustomaryCupSymbol: {'en-US': 'c', 'pt-BR': 'xíc. comum EUA'},
    usLegalCupSymbol: {'en-US': 'c', 'pt-BR': 'xíc. legal EUA'},
    usLiquidPintSymbol: {'en-US': 'pt', 'pt-BR': 'pt. líquida EUA'},
    usLiquidQuartSymbol: {'en-US': 'qt', 'pt-BR': 'qt. líquida EUA'},
    usLiquidGallonSymbol: {'en-US': 'gal', 'pt-BR': 'gal. líquida EUA'},

    // Pattern Specifiers (generally not translatable, but for consistency)
    imperialTeaspoonPattern: {'en-US': 'tsp_imp', 'pt-BR': 'tsp_imp'},
    imperialTablespoonPattern: {'en-US': 'Tbsp_imp', 'pt-BR': 'Tbsp_imp'},
    imperialFluidOuncePattern: {'en-US': 'fl_oz_imp', 'pt-BR': 'fl_oz_imp'},
    imperialCupPattern: {'en-US': 'c_imp', 'pt-BR': 'c_imp'},
    imperialPintPattern: {'en-US': 'pt_imp', 'pt-BR': 'pt_imp'},
    imperialGallonPattern: {'en-US': 'gal_imp', 'pt-BR': 'gal_imp'},

    usTeaspoonPattern: {'en-US': 'tsp_us', 'pt-BR': 'tsp_us'},
    usTablespoonPattern: {'en-US': 'Tbsp_us', 'pt-BR': 'Tbsp_us'},
    usCustomaryCupPattern: {
      'en-US': 'c_us_customary',
      'pt-BR': 'c_us_customary'
    },
    usLegalCupPattern: {'en-US': 'c_us_legal', 'pt-BR': 'c_us_legal'},
    usFluidOuncePattern: {'en-US': 'fl_oz_us', 'pt-BR': 'fl_oz_us'},
    usLiquidPintPattern: {'en-US': 'pt_us', 'pt-BR': 'pt_us'},
    usLiquidGallonPattern: {'en-US': 'gal_us', 'pt-BR': 'gal_us'},
  });

  String i18n({
    String? locale,
  }) =>
      localize(this, _t, locale: locale ?? Intl.getCurrentLocale());
  String plural(value) => localizePlural(value, this, _t);
}
