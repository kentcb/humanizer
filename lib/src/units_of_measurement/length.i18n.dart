import 'package:i18n_extension_core/i18n_extension_core.dart';
import 'package:intl/intl.dart';

final nanometer = Object();
final micrometer = Object();
final millimeter = Object();
final centimeter = Object();
final decimeter = Object();
final meter = Object();
final decameter = Object();
final hectometer = Object();
final kilometer = Object();
final megameter = Object();
final gigameter = Object();
final thou = Object();
final inch = Object();
final foot = Object();
final yard = Object();
final mile = Object();

final nanometerSymbol = Object();
final micrometerSymbol = Object();
final millimeterSymbol = Object();
final centimeterSymbol = Object();
final decimeterSymbol = Object();
final meterSymbol = Object();
final decameterSymbol = Object();
final hectometerSymbol = Object();
final kilometerSymbol = Object();
final megameterSymbol = Object();
final gigameterSymbol = Object();

final thouUnitSymbol = Object();
final inchSymbol = Object();
final footSymbol = Object();
final yardSymbol = Object();
final mileSymbol = Object();

extension LengthUnitI18n on Object {
  static final _t = Translations.byId('en-US', {
    // SI
    nanometer: {'en-US': 'nanometer', 'pt-BR': 'nanômetro'},
    micrometer: {'en-US': 'micrometer', 'pt-BR': 'micrômetro'},
    millimeter: {'en-US': 'millimeter', 'pt-BR': 'milímetro'},
    centimeter: {'en-US': 'centimeter', 'pt-BR': 'centímetro'},
    decimeter: {'en-US': 'decimeter', 'pt-BR': 'decímetro'},
    meter: {'en-US': 'meter', 'pt-BR': 'metro'},
    decameter: {'en-US': 'decameter', 'pt-BR': 'decâmetro'},
    hectometer: {'en-US': 'hectometer', 'pt-BR': 'hectômetro'},
    kilometer: {'en-US': 'kilometer', 'pt-BR': 'quilômetro'},
    megameter: {'en-US': 'megameter', 'pt-BR': 'megâmetro'},
    gigameter: {'en-US': 'gigameter', 'pt-BR': 'gigâmetro'},

    // Imperial
    thou: {'en-US': 'thou', 'pt-BR': 'milésimo de polegada'},
    inch: {'en-US': 'inch', 'pt-BR': 'polegada'},
    foot: {'en-US': 'foot', 'pt-BR': 'pé'},
    yard: {'en-US': 'yard', 'pt-BR': 'jarda'},
    mile: {'en-US': 'mile', 'pt-BR': 'milha'},

    //SI
    nanometerSymbol: {'en-US': 'nm', 'pt-BR': 'nm'},
    micrometerSymbol: {'en-US': 'μm', 'pt-BR': 'μm'},
    millimeterSymbol: {'en-US': 'mm', 'pt-BR': 'mm'},
    centimeterSymbol: {'en-US': 'cm', 'pt-BR': 'cm'},
    decimeterSymbol: {'en-US': 'dm', 'pt-BR': 'dm'},
    meterSymbol: {'en-US': 'm', 'pt-BR': 'm'},
    decameterSymbol: {'en-US': 'dam', 'pt-BR': 'dam'},
    hectometerSymbol: {'en-US': 'hm', 'pt-BR': 'hm'},
    kilometerSymbol: {'en-US': 'km', 'pt-BR': 'km'},
    megameterSymbol: {'en-US': 'Mm', 'pt-BR': 'Mm'},
    gigameterSymbol: {'en-US': 'Gm', 'pt-BR': 'Gm'},

    // Imperial
    thouUnitSymbol: {'en-US': 'thou', 'pt-BR': 'thou'},
    inchSymbol: {'en-US': 'in', 'pt-BR': 'pol'},
    footSymbol: {'en-US': 'ft', 'pt-BR': 'pé'},
    yardSymbol: {'en-US': 'yd', 'pt-BR': 'jd'},
    mileSymbol: {'en-US': 'mi', 'pt-BR': 'mi'},
  });

  String i18n({
    String? locale,
  }) =>
      localize(this, _t, locale: locale ?? Intl.getCurrentLocale());
  String plural(value) => localizePlural(value, this, _t);
}
