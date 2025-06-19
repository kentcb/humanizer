import 'package:i18n_extension_core/i18n_extension_core.dart';
import 'package:intl/intl.dart';

// Variáveis para os nomes completos das unidades de informação (usados no getName)
final bit = Object();
final crumb = Object();
final nibble = Object();
final kilobit = Object();
final megabit = Object();
final gigabit = Object();
final terabit = Object();
final petabit = Object();
final exabit = Object();
final zettabit = Object();
final yottabit = Object();
final byte = Object();
final kilobyte = Object();
final megabyte = Object();
final gigabyte = Object();
final terabyte = Object();
final petabyte = Object();
final exabyte = Object();
final zettabyte = Object();
final yottabyte = Object();

final kibibit = Object();
final mebibit = Object();
final gibibit = Object();
final tebibit = Object();
final pebibit = Object();
final exbibit = Object();
final zebibit = Object();
final yobibit = Object();
final kibibyte = Object();
final mebibyte = Object();
final gibibyte = Object();
final tebibyte = Object();
final pebibyte = Object();
final exbibyte = Object();
final zebibyte = Object();
final yobibyte = Object();

// Variáveis para os SÍMBOLOS das unidades de informação (usados no getSymbol)
final bitSymbol = Object();
final crumbSymbol = Object();
final nibbleSymbol = Object();
final kilobitSymbol = Object();
final megabitSymbol = Object();
final gigabitSymbol = Object();
final terabitSymbol = Object();
final petabitSymbol = Object();
final exabitSymbol = Object();
final zettabitSymbol = Object();
final yottabitSymbol = Object();
final byteSymbol = Object();
final kilobyteSymbol = Object();
final megabyteSymbol = Object();
final gigabyteSymbol = Object();
final terabyteSymbol = Object();
final petabyteSymbol = Object();
final exabyteSymbol = Object();
final zettabyteSymbol = Object();
final yottabyteSymbol = Object();

final kibibitSymbol = Object();
final mebibitSymbol = Object();
final gibibitSymbol = Object();
final tebibitSymbol = Object();
final pebibitSymbol = Object();
final exbibitSymbol = Object();
final zebibitSymbol = Object();
final yobibitSymbol = Object();
final kibibyteSymbol = Object();
final mebibyteSymbol = Object();
final gibibyteSymbol = Object();
final tebibyteSymbol = Object();
final pebibyteSymbol = Object();
final exbibyteSymbol = Object();
final zebibyteSymbol = Object();
final yobibyteSymbol = Object();

extension InformationUnitI18n on Object {
  static final _t = Translations.byId('en-US', {
    // Nomes completos das unidades (para getName) - SI
    bit: {'en-US': 'bit', 'pt-BR': 'bit'},
    crumb: {
      'en-US': 'crumb',
      'pt-BR': 'crumb'
    }, // Manter como "crumb" se não houver tradução comum
    nibble: {
      'en-US': 'nibble',
      'pt-BR': 'nibble'
    }, // Manter como "nibble" se não houver tradução comum
    kilobit: {'en-US': 'kilobit', 'pt-BR': 'quilobit'},
    megabit: {'en-US': 'megabit', 'pt-BR': 'megabit'},
    gigabit: {'en-US': 'gigabit', 'pt-BR': 'gigabit'},
    terabit: {'en-US': 'terabit', 'pt-BR': 'terabit'},
    petabit: {'en-US': 'petabit', 'pt-BR': 'petabit'},
    exabit: {'en-US': 'exabit', 'pt-BR': 'exabit'},
    zettabit: {'en-US': 'zettabit', 'pt-BR': 'zettabit'},
    yottabit: {'en-US': 'yottabit', 'pt-BR': 'yottabit'},
    byte: {'en-US': 'byte', 'pt-BR': 'byte'},
    kilobyte: {'en-US': 'kilobyte', 'pt-BR': 'quilobyte'},
    megabyte: {'en-US': 'megabyte', 'pt-BR': 'megabyte'},
    gigabyte: {'en-US': 'gigabyte', 'pt-BR': 'gigabyte'},
    terabyte: {'en-US': 'terabyte', 'pt-BR': 'terabyte'},
    petabyte: {'en-US': 'petabyte', 'pt-BR': 'petabyte'},
    exabyte: {'en-US': 'exabyte', 'pt-BR': 'exabyte'},
    zettabyte: {'en-US': 'zettabyte', 'pt-BR': 'zettabyte'},
    yottabyte: {'en-US': 'yottabyte', 'pt-BR': 'yottabyte'},

    // Nomes completos das unidades (para getName) - IEC
    kibibit: {'en-US': 'kibibit', 'pt-BR': 'kibibit'},
    mebibit: {'en-US': 'mebibit', 'pt-BR': 'mebibit'},
    gibibit: {'en-US': 'gibibit', 'pt-BR': 'gibibit'},
    tebibit: {'en-US': 'tebibit', 'pt-BR': 'tebibit'},
    pebibit: {'en-US': 'pebibit', 'pt-BR': 'pebibit'},
    exbibit: {'en-US': 'exbibit', 'pt-BR': 'exbibit'},
    zebibit: {'en-US': 'zebibit', 'pt-BR': 'zebibit'},
    yobibit: {'en-US': 'yobibit', 'pt-BR': 'yobibit'},
    kibibyte: {'en-US': 'kibibyte', 'pt-BR': 'kibibyte'},
    mebibyte: {'en-US': 'mebibyte', 'pt-BR': 'mebibyte'},
    gibibyte: {'en-US': 'gibibyte', 'pt-BR': 'gibibyte'},
    tebibyte: {'en-US': 'tebibyte', 'pt-BR': 'tebibyte'},
    pebibyte: {'en-US': 'pebibyte', 'pt-BR': 'pebibyte'},
    exbibyte: {'en-US': 'exbibyte', 'pt-BR': 'exbibyte'},
    zebibyte: {'en-US': 'zebibyte', 'pt-BR': 'zebibyte'},
    yobibyte: {'en-US': 'yobibyte', 'pt-BR': 'yobibyte'},

    // Símbolos das unidades (para getSymbol) - SI
    bitSymbol: {'en-US': 'b', 'pt-BR': 'b'},
    crumbSymbol: {'en-US': 'crumb', 'pt-BR': 'crumb'}, // Símbolo para 'crumb'
    nibbleSymbol: {
      'en-US': 'nibble',
      'pt-BR': 'nibble'
    }, // Símbolo para 'nibble'
    kilobitSymbol: {'en-US': 'kbit', 'pt-BR': 'kbit'},
    megabitSymbol: {'en-US': 'Mbit', 'pt-BR': 'Mbit'},
    gigabitSymbol: {'en-US': 'Gbit', 'pt-BR': 'Gbit'},
    terabitSymbol: {'en-US': 'Tbit', 'pt-BR': 'Tbit'},
    petabitSymbol: {'en-US': 'Pbit', 'pt-BR': 'Pbit'},
    exabitSymbol: {'en-US': 'Ebit', 'pt-BR': 'Ebit'},
    zettabitSymbol: {'en-US': 'Zbit', 'pt-BR': 'Zbit'},
    yottabitSymbol: {'en-US': 'Ybit', 'pt-BR': 'Ybit'},
    byteSymbol: {'en-US': 'B', 'pt-BR': 'B'},
    kilobyteSymbol: {'en-US': 'KB', 'pt-BR': 'KB'},
    megabyteSymbol: {'en-US': 'MB', 'pt-BR': 'MB'},
    gigabyteSymbol: {'en-US': 'GB', 'pt-BR': 'GB'},
    terabyteSymbol: {'en-US': 'TB', 'pt-BR': 'TB'},
    petabyteSymbol: {'en-US': 'PB', 'pt-BR': 'PB'},
    exabyteSymbol: {'en-US': 'EB', 'pt-BR': 'EB'},
    zettabyteSymbol: {'en-US': 'ZB', 'pt-BR': 'ZB'},
    yottabyteSymbol: {'en-US': 'YB', 'pt-BR': 'YB'},

    // Símbolos das unidades (para getSymbol) - IEC
    kibibitSymbol: {'en-US': 'Kibit', 'pt-BR': 'Kibit'},
    mebibitSymbol: {'en-US': 'Mibit', 'pt-BR': 'Mibit'},
    gibibitSymbol: {'en-US': 'Gibit', 'pt-BR': 'Gibit'},
    tebibitSymbol: {'en-US': 'Tibit', 'pt-BR': 'Tibit'},
    pebibitSymbol: {'en-US': 'Pibit', 'pt-BR': 'Pibit'},
    exbibitSymbol: {'en-US': 'Eibit', 'pt-BR': 'Eibit'},
    zebibitSymbol: {'en-US': 'Zibit', 'pt-BR': 'Zibit'},
    yobibitSymbol: {'en-US': 'Yibit', 'pt-BR': 'Yibit'},
    kibibyteSymbol: {'en-US': 'KiB', 'pt-BR': 'KiB'},
    mebibyteSymbol: {'en-US': 'MiB', 'pt-BR': 'MiB'},
    gibibyteSymbol: {'en-US': 'GiB', 'pt-BR': 'GiB'},
    tebibyteSymbol: {'en-US': 'TiB', 'pt-BR': 'TiB'},
    pebibyteSymbol: {'en-US': 'PiB', 'pt-BR': 'PiB'},
    exbibyteSymbol: {'en-US': 'EiB', 'pt-BR': 'EiB'},
    zebibyteSymbol: {'en-US': 'ZiB', 'pt-BR': 'ZiB'},
    yobibyteSymbol: {'en-US': 'YiB', 'pt-BR': 'YiB'},
  });

  String i18n({
    String? locale,
  }) =>
      localize(this, _t, locale: locale ?? Intl.getCurrentLocale());
  String plural(value) => localizePlural(value, this, _t);
}
