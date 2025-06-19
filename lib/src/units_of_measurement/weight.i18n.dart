import 'package:i18n_extension_core/i18n_extension_core.dart';
import 'package:intl/intl.dart';

final nanogram = Object();
final microgram = Object();
final milligram = Object();
final gram = Object();
final kilogram = Object();
final tonne = Object();
final megatonne = Object();
final gigatonne = Object();

final ounce = Object();
final pound = Object();
final imperialTon = Object();

final usTon = Object();

final nanogramSymbol = Object();
final microgramSymbol = Object();
final milligramSymbol = Object();
final gramSymbol = Object();
final kilogramSymbol = Object();
final tonneSymbol = Object();
final megatonneSymbol = Object();
final gigatonneSymbol = Object();

final ounceSymbol = Object();
final poundSymbol = Object();
final imperialTonSymbol = Object();

final usTonSymbol = Object();

extension WeightUnitI18n on Object {
  static final _t = Translations.byId('en-US', {
    // SI
    nanogram: {'en-US': 'nanogram', 'pt-BR': 'nanograma'},
    microgram: {'en-US': 'microgram', 'pt-BR': 'micrograma'},
    milligram: {'en-US': 'milligram', 'pt-BR': 'miligrama'},
    gram: {'en-US': 'gram', 'pt-BR': 'grama'},
    kilogram: {'en-US': 'kilogram', 'pt-BR': 'quilograma'},
    tonne: {'en-US': 'tonne', 'pt-BR': 'tonelada'},
    megatonne: {'en-US': 'megatonne', 'pt-BR': 'megatonelada'},
    gigatonne: {'en-US': 'gigatonne', 'pt-BR': 'gigatonelada'},

    // Imperial
    ounce: {'en-US': 'ounce', 'pt-BR': 'onça'},
    pound: {'en-US': 'pound', 'pt-BR': 'libra'},
    imperialTon: {'en-US': 'ton', 'pt-BR': 'tonelada imperial'},

    // US
    usTon: {'en-US': 'ton', 'pt-BR': 'tonelada americana'},

    // SI
    nanogramSymbol: {'en-US': 'ng', 'pt-BR': 'ng'},
    microgramSymbol: {'en-US': 'µg', 'pt-BR': 'µg'},
    milligramSymbol: {'en-US': 'mg', 'pt-BR': 'mg'},
    gramSymbol: {'en-US': 'g', 'pt-BR': 'g'},
    kilogramSymbol: {'en-US': 'kg', 'pt-BR': 'kg'},
    tonneSymbol: {'en-US': 't', 'pt-BR': 't'},
    megatonneSymbol: {'en-US': 'Mt', 'pt-BR': 'Mt'},
    gigatonneSymbol: {'en-US': 'Gt', 'pt-BR': 'Gt'},

    // Símbolos das unidades (para getSymbol) - Imperial
    ounceSymbol: {'en-US': 'oz', 'pt-BR': 'oz'},
    poundSymbol: {'en-US': 'lb', 'pt-BR': 'lb'},
    imperialTonSymbol: {'en-US': 'ton', 'pt-BR': 'ton imp.'},

    // Símbolos das unidades (para getSymbol) - US
    usTonSymbol: {'en-US': 'ton', 'pt-BR': 'ton EUA'},
  });

  String i18n({
    String? locale,
  }) =>
      localize(this, _t, locale: locale ?? Intl.getCurrentLocale());
  String plural(value) => localizePlural(value, this, _t);
}
