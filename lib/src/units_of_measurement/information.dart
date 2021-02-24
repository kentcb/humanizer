import 'package:decimal/decimal.dart';
import 'package:humanizer/humanizer.dart';
import 'package:humanizer/src/units_of_measurement/decimals.dart';
import 'package:meta/meta.dart';

/// A unit of measurement representing information size.
class InformationSize extends UnitOfMeasurement<InformationUnit, InformationSize> {
  /// Creates an [InformationSize] given a [unit] and decimal [value] for that unit.
  InformationSize.fromUnits(InformationUnit unit, Decimal value) : super.fromUnits(unit, value);

  /// Creates an [InformationSize] representing the specified number of [bits].
  factory InformationSize.fromBits(Decimal bits) => InformationSize.fromUnits(InformationUnit.bit, bits);

  /// Creates an [InformationSize] representing the specified number of [crumbs].
  factory InformationSize.fromCrumbs(Decimal crumbs) => InformationSize.fromUnits(InformationUnit.crumb, crumbs);

  /// Creates an [InformationSize] representing the specified number of [nibbles].
  factory InformationSize.fromNibbles(Decimal nibbles) => InformationSize.fromUnits(InformationUnit.nibble, nibbles);

  /// Creates an [InformationSize] representing the specified number of [bytes].
  factory InformationSize.fromBytes(Decimal bytes) => InformationSize.fromUnits(InformationUnit.byte, bytes);

  /// Creates an [InformationSize] representing the specified number of [kilobits].
  factory InformationSize.fromKilobits(Decimal kilobits) =>
      InformationSize.fromUnits(InformationUnit.kilobit, kilobits);

  /// Creates an [InformationSize] representing the specified number of [kibibits].
  factory InformationSize.fromKibibits(Decimal kibibits) =>
      InformationSize.fromUnits(InformationUnit.kibibit, kibibits);

  /// Creates an [InformationSize] representing the specified number of [kilobytes].
  factory InformationSize.fromKilobytes(Decimal kilobytes) =>
      InformationSize.fromUnits(InformationUnit.kilobyte, kilobytes);

  /// Creates an [InformationSize] representing the specified number of [kibibytes].
  factory InformationSize.fromKibibytes(Decimal kibibytes) =>
      InformationSize.fromUnits(InformationUnit.kibibyte, kibibytes);

  /// Creates an [InformationSize] representing the specified number of [megabits].
  factory InformationSize.fromMegabits(Decimal megabits) =>
      InformationSize.fromUnits(InformationUnit.megabit, megabits);

  /// Creates an [InformationSize] representing the specified number of [mebibits].
  factory InformationSize.fromMebibits(Decimal mebibits) =>
      InformationSize.fromUnits(InformationUnit.mebibit, mebibits);

  /// Creates an [InformationSize] representing the specified number of [megabytes].
  factory InformationSize.fromMegabytes(Decimal megabytes) =>
      InformationSize.fromUnits(InformationUnit.megabyte, megabytes);

  /// Creates an [InformationSize] representing the specified number of [mebibytes].
  factory InformationSize.fromMebibytes(Decimal mebibytes) =>
      InformationSize.fromUnits(InformationUnit.mebibyte, mebibytes);

  /// Creates an [InformationSize] representing the specified number of [gigabits].
  factory InformationSize.fromGigabits(Decimal gigabits) =>
      InformationSize.fromUnits(InformationUnit.gigabit, gigabits);

  /// Creates an [InformationSize] representing the specified number of [gibibits].
  factory InformationSize.fromGibibits(Decimal gibibits) =>
      InformationSize.fromUnits(InformationUnit.gibibit, gibibits);

  /// Creates an [InformationSize] representing the specified number of [gigabytes].
  factory InformationSize.fromGigabytes(Decimal gigabytes) =>
      InformationSize.fromUnits(InformationUnit.gigabyte, gigabytes);

  /// Creates an [InformationSize] representing the specified number of [gibibytes].
  factory InformationSize.fromGibibytes(Decimal gibibytes) =>
      InformationSize.fromUnits(InformationUnit.gibibyte, gibibytes);

  /// Creates an [InformationSize] representing the specified number of [terabits].
  factory InformationSize.fromTerabits(Decimal terabits) =>
      InformationSize.fromUnits(InformationUnit.terabit, terabits);

  /// Creates an [InformationSize] representing the specified number of [tebibits].
  factory InformationSize.fromTebibits(Decimal tebibits) =>
      InformationSize.fromUnits(InformationUnit.tebibit, tebibits);

  /// Creates an [InformationSize] representing the specified number of [terabytes].
  factory InformationSize.fromTerabytes(Decimal terabytes) =>
      InformationSize.fromUnits(InformationUnit.terabyte, terabytes);

  /// Creates an [InformationSize] representing the specified number of [tebibytes].
  factory InformationSize.fromTebibytes(Decimal tebibytes) =>
      InformationSize.fromUnits(InformationUnit.tebibyte, tebibytes);

  /// Creates an [InformationSize] representing the specified number of [petabits].
  factory InformationSize.fromPetabits(Decimal petabits) =>
      InformationSize.fromUnits(InformationUnit.petabit, petabits);

  /// Creates an [InformationSize] representing the specified number of [pebibits].
  factory InformationSize.fromPebibits(Decimal pebibits) =>
      InformationSize.fromUnits(InformationUnit.pebibit, pebibits);

  /// Creates an [InformationSize] representing the specified number of [petabytes].
  factory InformationSize.fromPetabytes(Decimal petabytes) =>
      InformationSize.fromUnits(InformationUnit.petabyte, petabytes);

  /// Creates an [InformationSize] representing the specified number of [pebibytes].
  factory InformationSize.fromPebibytes(Decimal pebibytes) =>
      InformationSize.fromUnits(InformationUnit.pebibyte, pebibytes);

  /// Creates an [InformationSize] representing the specified number of [exabits].
  factory InformationSize.fromExabits(Decimal exabits) => InformationSize.fromUnits(InformationUnit.exabit, exabits);

  /// Creates an [InformationSize] representing the specified number of [exbibits].
  factory InformationSize.fromExbibits(Decimal exbibits) =>
      InformationSize.fromUnits(InformationUnit.exbibit, exbibits);

  /// Creates an [InformationSize] representing the specified number of [exabytes].
  factory InformationSize.fromExabytes(Decimal exabytes) =>
      InformationSize.fromUnits(InformationUnit.exabyte, exabytes);

  /// Creates an [InformationSize] representing the specified number of [exbibytes].
  factory InformationSize.fromExbibytes(Decimal exbibytes) =>
      InformationSize.fromUnits(InformationUnit.exbibyte, exbibytes);

  /// Creates an [InformationSize] representing the specified number of [zettabits].
  factory InformationSize.fromZettabits(Decimal zettabits) =>
      InformationSize.fromUnits(InformationUnit.zettabit, zettabits);

  /// Creates an [InformationSize] representing the specified number of [zebibits].
  factory InformationSize.fromZebibits(Decimal zebibits) =>
      InformationSize.fromUnits(InformationUnit.zebibit, zebibits);

  /// Creates an [InformationSize] representing the specified number of [zettabytes].
  factory InformationSize.fromZettabytes(Decimal zettabytes) =>
      InformationSize.fromUnits(InformationUnit.zettabyte, zettabytes);

  /// Creates an [InformationSize] representing the specified number of [zebibytes].
  factory InformationSize.fromZebibytes(Decimal zebibytes) =>
      InformationSize.fromUnits(InformationUnit.zebibyte, zebibytes);

  /// Creates an [InformationSize] representing the specified number of [yottabits].
  factory InformationSize.fromYottabits(Decimal yottabits) =>
      InformationSize.fromUnits(InformationUnit.yottabit, yottabits);

  /// Creates an [InformationSize] representing the specified number of [yobibits].
  factory InformationSize.fromYobibits(Decimal yobibits) =>
      InformationSize.fromUnits(InformationUnit.yobibit, yobibits);

  /// Creates an [InformationSize] representing the specified number of [yottabytes].
  factory InformationSize.fromYottabytes(Decimal yottabytes) =>
      InformationSize.fromUnits(InformationUnit.yottabyte, yottabytes);

  /// Creates an [InformationSize] representing the specified number of [yobibytes].
  factory InformationSize.fromYobibytes(Decimal yobibytes) =>
      InformationSize.fromUnits(InformationUnit.yobibyte, yobibytes);

  /// An [InformationSize] of size zero.
  static final zero = InformationSize.fromBits(Decimal.zero);

  /// Gets the number of bits in this [InformationSize], including any fractional portion.
  Decimal get bits => getUnits(InformationUnit.bit);

  /// Gets the number of crumbs in this [InformationSize], including any fractional portion.
  Decimal get crumbs => getUnits(InformationUnit.crumb);

  /// Gets the number of nibbles in this [InformationSize], including any fractional portion.
  Decimal get nibbles => getUnits(InformationUnit.nibble);

  /// Gets the number of bytes in this [InformationSize], including any fractional portion.
  Decimal get bytes => getUnits(InformationUnit.byte);

  /// Gets the number of kilobits in this [InformationSize], including any fractional portion.
  Decimal get kilobits => getUnits(InformationUnit.kilobit);

  /// Gets the number of kibibits in this [InformationSize], including any fractional portion.
  Decimal get kibibits => getUnits(InformationUnit.kibibit);

  /// Gets the number of kilobytes in this [InformationSize], including any fractional portion.
  Decimal get kilobytes => getUnits(InformationUnit.kilobyte);

  /// Gets the number of kibibytes in this [InformationSize], including any fractional portion.
  Decimal get kibibytes => getUnits(InformationUnit.kibibyte);

  /// Gets the number of megabits in this [InformationSize], including any fractional portion.
  Decimal get megabits => getUnits(InformationUnit.megabit);

  /// Gets the number of mebibits in this [InformationSize], including any fractional portion.
  Decimal get mebibits => getUnits(InformationUnit.mebibit);

  /// Gets the number of megabytes in this [InformationSize], including any fractional portion.
  Decimal get megabytes => getUnits(InformationUnit.megabyte);

  /// Gets the number of mebibytes in this [InformationSize], including any fractional portion.
  Decimal get mebibytes => getUnits(InformationUnit.mebibyte);

  /// Gets the number of gigabits in this [InformationSize], including any fractional portion.
  Decimal get gigabits => getUnits(InformationUnit.gigabit);

  /// Gets the number of gibibits in this [InformationSize], including any fractional portion.
  Decimal get gibibits => getUnits(InformationUnit.gibibit);

  /// Gets the number of gigabytes in this [InformationSize], including any fractional portion.
  Decimal get gigabytes => getUnits(InformationUnit.gigabyte);

  /// Gets the number of gibibytes in this [InformationSize], including any fractional portion.
  Decimal get gibibytes => getUnits(InformationUnit.gibibyte);

  /// Gets the number of terabits in this [InformationSize], including any fractional portion.
  Decimal get terabits => getUnits(InformationUnit.terabit);

  /// Gets the number of tebibits in this [InformationSize], including any fractional portion.
  Decimal get tebibits => getUnits(InformationUnit.tebibit);

  /// Gets the number of terabytes in this [InformationSize], including any fractional portion.
  Decimal get terabytes => getUnits(InformationUnit.terabyte);

  /// Gets the number of tebibytes in this [InformationSize], including any fractional portion.
  Decimal get tebibytes => getUnits(InformationUnit.tebibyte);

  /// Gets the number of petabits in this [InformationSize], including any fractional portion.
  Decimal get petabits => getUnits(InformationUnit.petabit);

  /// Gets the number of pebibits in this [InformationSize], including any fractional portion.
  Decimal get pebibits => getUnits(InformationUnit.pebibit);

  /// Gets the number of petabytes in this [InformationSize], including any fractional portion.
  Decimal get petabytes => getUnits(InformationUnit.petabyte);

  /// Gets the number of pebibytes in this [InformationSize], including any fractional portion.
  Decimal get pebibytes => getUnits(InformationUnit.pebibyte);

  /// Gets the number of exabits in this [InformationSize], including any fractional portion.
  Decimal get exabits => getUnits(InformationUnit.exabit);

  /// Gets the number of exbibits in this [InformationSize], including any fractional portion.
  Decimal get exbibits => getUnits(InformationUnit.exbibit);

  /// Gets the number of exabytes in this [InformationSize], including any fractional portion.
  Decimal get exabytes => getUnits(InformationUnit.exabyte);

  /// Gets the number of exbibytes in this [InformationSize], including any fractional portion.
  Decimal get exbibytes => getUnits(InformationUnit.exbibyte);

  /// Gets the number of zettabits in this [InformationSize], including any fractional portion.
  Decimal get zettabits => getUnits(InformationUnit.zettabit);

  /// Gets the number of zebibits in this [InformationSize], including any fractional portion.
  Decimal get zebibits => getUnits(InformationUnit.zebibit);

  /// Gets the number of zettabytes in this [InformationSize], including any fractional portion.
  Decimal get zettabytes => getUnits(InformationUnit.zettabyte);

  /// Gets the number of zebibytes in this [InformationSize], including any fractional portion.
  Decimal get zebibytes => getUnits(InformationUnit.zebibyte);

  /// Gets the number of yottabits in this [InformationSize], including any fractional portion.
  Decimal get yottabits => getUnits(InformationUnit.yottabit);

  /// Gets the number of yobibits in this [InformationSize], including any fractional portion.
  Decimal get yobibits => getUnits(InformationUnit.yobibit);

  /// Gets the number of yottabytes in this [InformationSize], including any fractional portion.
  Decimal get yottabytes => getUnits(InformationUnit.yottabyte);

  /// Gets the number of yobibytes in this [InformationSize], including any fractional portion.
  Decimal get yobibytes => getUnits(InformationUnit.yobibyte);

  /// Creates an [InformationRate] with the specified [period] from this value.
  InformationRate per(Duration period) => InformationRate._(
        value: this,
        period: period,
      );

  @override
  Decimal getUnits(InformationUnit unit) => baseValue / unit._byteCount;

  @override
  String toString() => humanize();

  @override
  @protected
  InformationSize createValue(Decimal baseValue) => InformationSize.fromBytes(baseValue);

  @override
  @protected
  Decimal getBaseValue(InformationUnit unit, Decimal value) => value * unit._byteCount;
}

/// Defines supported units of information.
enum InformationUnit {
  /// A unit representing bits.
  bit,

  /// A unit representing crumbs.
  crumb,

  /// A unit representing nibbles.
  nibble,

  /// A unit representing bytes.
  byte,

  /// A unit representing kilobits.
  kilobit,

  /// A unit representing kibibits.
  kibibit,

  /// A unit representing kilobytes.
  kilobyte,

  /// A unit representing kibibytes.
  kibibyte,

  /// A unit representing megabits.
  megabit,

  /// A unit representing mebibits.
  mebibit,

  /// A unit representing megabytes.
  megabyte,

  /// A unit representing mebibytes.
  mebibyte,

  /// A unit representing gigabits.
  gigabit,

  /// A unit representing gibibits.
  gibibit,

  /// A unit representing gigabytes.
  gigabyte,

  /// A unit representing gibibytes.
  gibibyte,

  /// A unit representing terabits.
  terabit,

  /// A unit representing tebibits.
  tebibit,

  /// A unit representing terabytes.
  terabyte,

  /// A unit representing tebibytes.
  tebibyte,

  /// A unit representing petabits.
  petabit,

  /// A unit representing pebibits.
  pebibit,

  /// A unit representing petabytes.
  petabyte,

  /// A unit representing pebibytes.
  pebibyte,

  /// A unit representing exabits.
  exabit,

  /// A unit representing exbibits.
  exbibit,

  /// A unit representing exabytes.
  exabyte,

  /// A unit representing exbibytes.
  exbibyte,

  /// A unit representing zettabits.
  zettabit,

  /// A unit representing zebibits.
  zebibit,

  /// A unit representing zettabytes.
  zettabyte,

  /// A unit representing zebibytes.
  zebibyte,

  /// A unit representing yottabits.
  yottabit,

  /// A unit representing yobibits.
  yobibit,

  /// A unit representing yottabytes.
  yottabyte,

  /// A unit representing yobibytes.
  yobibyte,
}

/// Provides convenience sets of commonly used [InformationUnit]s.
class InformationUnits {
  /// Contains all defined [InformationUnit]s.
  static const all = <InformationUnit>{
    InformationUnit.bit,
    InformationUnit.crumb,
    InformationUnit.nibble,
    InformationUnit.byte,
    InformationUnit.kilobit,
    InformationUnit.kibibit,
    InformationUnit.kilobyte,
    InformationUnit.kibibyte,
    InformationUnit.megabit,
    InformationUnit.mebibit,
    InformationUnit.megabyte,
    InformationUnit.mebibyte,
    InformationUnit.gigabit,
    InformationUnit.gibibit,
    InformationUnit.gigabyte,
    InformationUnit.gibibyte,
    InformationUnit.terabit,
    InformationUnit.tebibit,
    InformationUnit.terabyte,
    InformationUnit.tebibyte,
    InformationUnit.petabit,
    InformationUnit.pebibit,
    InformationUnit.petabyte,
    InformationUnit.pebibyte,
    InformationUnit.exabit,
    InformationUnit.exbibit,
    InformationUnit.exabyte,
    InformationUnit.exbibyte,
    InformationUnit.zettabit,
    InformationUnit.zebibit,
    InformationUnit.zettabyte,
    InformationUnit.zebibyte,
    InformationUnit.yottabit,
    InformationUnit.yobibit,
    InformationUnit.yottabyte,
    InformationUnit.yobibyte,
  };

  static const iecBytes = <InformationUnit>{
    InformationUnit.bit,
    InformationUnit.byte,
    InformationUnit.kibibyte,
    InformationUnit.mebibyte,
    InformationUnit.gibibyte,
    InformationUnit.tebibyte,
    InformationUnit.pebibyte,
    InformationUnit.exbibyte,
    InformationUnit.zebibyte,
    InformationUnit.yobibyte,
  };

  static const iecBits = <InformationUnit>{
    InformationUnit.bit,
    InformationUnit.kibibit,
    InformationUnit.mebibit,
    InformationUnit.gibibit,
    InformationUnit.tebibit,
    InformationUnit.pebibit,
    InformationUnit.exbibit,
    InformationUnit.zebibit,
    InformationUnit.yobibit,
  };

  /// Contains International System of Units (SI) [InformationUnit]s of byte granularity.
  static const siBytes = <InformationUnit>{
    InformationUnit.byte,
    InformationUnit.kilobyte,
    InformationUnit.megabyte,
    InformationUnit.gigabyte,
    InformationUnit.terabyte,
    InformationUnit.petabyte,
    InformationUnit.exabyte,
    InformationUnit.zettabyte,
    InformationUnit.yottabyte,
  };

  /// Contains International System of Units (SI) [InformationUnit]s of bit granularity.
  static const siBits = <InformationUnit>{
    InformationUnit.bit,
    InformationUnit.kilobit,
    InformationUnit.megabit,
    InformationUnit.gigabit,
    InformationUnit.terabit,
    InformationUnit.petabit,
    InformationUnit.exabit,
    InformationUnit.zettabit,
    InformationUnit.yottabit,
  };
}

/// Contains extensions for [InformationUnit].
extension InformationUnitExtensions on InformationUnit {
  static final _bytesInBit = ds('0.125');
  static final _bytesInCrumb = ds('0.25');
  static final _bytesInNibble = ds('0.5');
  static final _bytesInByte = di(1);
  static final _bytesInKilobit = di(125);
  static final _bytesInKibibit = di(128);
  static final _bytesInKilobyte = di(1000);
  static final _bytesInKibibyte = di(1024);
  static final _bytesInMegabit = di(125000);
  static final _bytesInMebibit = di(128000);
  static final _bytesInMegabyte = di(1000000);
  static final _bytesInMebibyte = di(1048576);
  static final _bytesInGigabit = di(125000000);
  static final _bytesInGibibit = di(128000000);
  static final _bytesInGigabyte = di(1000000000);
  static final _bytesInGibibyte = di(1073741824);
  static final _bytesInTerabit = di(125000000000);
  static final _bytesInTebibit = di(128000000000);
  static final _bytesInTerabyte = di(1000000000000);
  static final _bytesInTebibyte = di(1099511627776);
  static final _bytesInPetabit = di(125000000000000);
  static final _bytesInPebibit = di(128000000000000);
  static final _bytesInPetabyte = di(1000000000000000);
  static final _bytesInPebibyte = di(1125899906842624);
  static final _bytesInExabit = di(125000000000000000);
  static final _bytesInExbibit = di(128000000000000000);
  static final _bytesInExabyte = di(1000000000000000000);
  static final _bytesInExbibyte = di(1152921504606846976);
  static final _bytesInZettabit = ds('125000000000000000000');
  static final _bytesInZebibit = ds('128000000000000000000');
  static final _bytesInZettabyte = ds('1000000000000000000000');
  static final _bytesInZebibyte = ds('1180591620717411303424');
  static final _bytesInYottabit = ds('125000000000000000000000');
  static final _bytesInYobibit = ds('128000000000000000000000');
  static final _bytesInYottabyte = ds('1000000000000000000000000');
  static final _bytesInYobibyte = ds('1208925819614629174706176');

  Decimal get _byteCount {
    switch (this) {
      case InformationUnit.bit:
        return _bytesInBit;
      case InformationUnit.crumb:
        return _bytesInCrumb;
      case InformationUnit.nibble:
        return _bytesInNibble;
      case InformationUnit.byte:
        return _bytesInByte;
      case InformationUnit.kilobit:
        return _bytesInKilobit;
      case InformationUnit.kibibit:
        return _bytesInKibibit;
      case InformationUnit.kilobyte:
        return _bytesInKilobyte;
      case InformationUnit.kibibyte:
        return _bytesInKibibyte;
      case InformationUnit.megabit:
        return _bytesInMegabit;
      case InformationUnit.mebibit:
        return _bytesInMebibit;
      case InformationUnit.megabyte:
        return _bytesInMegabyte;
      case InformationUnit.mebibyte:
        return _bytesInMebibyte;
      case InformationUnit.gigabit:
        return _bytesInGigabit;
      case InformationUnit.gibibit:
        return _bytesInGibibit;
      case InformationUnit.gigabyte:
        return _bytesInGigabyte;
      case InformationUnit.gibibyte:
        return _bytesInGibibyte;
      case InformationUnit.terabit:
        return _bytesInTerabit;
      case InformationUnit.tebibit:
        return _bytesInTebibit;
      case InformationUnit.terabyte:
        return _bytesInTerabyte;
      case InformationUnit.tebibyte:
        return _bytesInTebibyte;
      case InformationUnit.petabit:
        return _bytesInPetabit;
      case InformationUnit.pebibit:
        return _bytesInPebibit;
      case InformationUnit.petabyte:
        return _bytesInPetabyte;
      case InformationUnit.pebibyte:
        return _bytesInPebibyte;
      case InformationUnit.exabit:
        return _bytesInExabit;
      case InformationUnit.exbibit:
        return _bytesInExbibit;
      case InformationUnit.exabyte:
        return _bytesInExabyte;
      case InformationUnit.exbibyte:
        return _bytesInExbibyte;
      case InformationUnit.zettabit:
        return _bytesInZettabit;
      case InformationUnit.zebibit:
        return _bytesInZebibit;
      case InformationUnit.zettabyte:
        return _bytesInZettabyte;
      case InformationUnit.zebibyte:
        return _bytesInZebibyte;
      case InformationUnit.yottabit:
        return _bytesInYottabit;
      case InformationUnit.yobibit:
        return _bytesInYobibit;
      case InformationUnit.yottabyte:
        return _bytesInYottabyte;
      case InformationUnit.yobibyte:
        return _bytesInYobibyte;
    }
  }

  /// Gets a localized name for this unit.
  String getName({
    required String locale,
  }) {
    switch (this) {
      case InformationUnit.bit:
        return 'bit';
      case InformationUnit.crumb:
        return 'crumb';
      case InformationUnit.nibble:
        return 'nibble';
      case InformationUnit.byte:
        return 'byte';
      case InformationUnit.kilobit:
        return 'kilobit';
      case InformationUnit.kibibit:
        return 'kibibit';
      case InformationUnit.kilobyte:
        return 'kilobyte';
      case InformationUnit.kibibyte:
        return 'kibibyte';
      case InformationUnit.megabit:
        return 'megabit';
      case InformationUnit.mebibit:
        return 'mebibit';
      case InformationUnit.megabyte:
        return 'megabyte';
      case InformationUnit.mebibyte:
        return 'mebibyte';
      case InformationUnit.gigabit:
        return 'gigabit';
      case InformationUnit.gibibit:
        return 'gibibit';
      case InformationUnit.gigabyte:
        return 'gigabyte';
      case InformationUnit.gibibyte:
        return 'gibibyte';
      case InformationUnit.terabit:
        return 'terabit';
      case InformationUnit.tebibit:
        return 'tebibit';
      case InformationUnit.terabyte:
        return 'terabyte';
      case InformationUnit.tebibyte:
        return 'tebibyte';
      case InformationUnit.petabit:
        return 'petabit';
      case InformationUnit.pebibit:
        return 'pebibit';
      case InformationUnit.petabyte:
        return 'petabyte';
      case InformationUnit.pebibyte:
        return 'pebibyte';
      case InformationUnit.exabit:
        return 'exabit';
      case InformationUnit.exbibit:
        return 'exbibit';
      case InformationUnit.exabyte:
        return 'exabyte';
      case InformationUnit.exbibyte:
        return 'exbibyte';
      case InformationUnit.zettabit:
        return 'zettabit';
      case InformationUnit.zebibit:
        return 'zebibit';
      case InformationUnit.zettabyte:
        return 'zettabyte';
      case InformationUnit.zebibyte:
        return 'zebibyte';
      case InformationUnit.yottabit:
        return 'yottabit';
      case InformationUnit.yobibit:
        return 'yobibit';
      case InformationUnit.yottabyte:
        return 'yottabyte';
      case InformationUnit.yobibyte:
        return 'yobibyte';
    }
  }

  /// Gets a localized symbol for this unit.
  String getSymbol({
    required String locale,
  }) {
    switch (this) {
      case InformationUnit.bit:
        return 'b';
      case InformationUnit.crumb:
        return 'crumb';
      case InformationUnit.nibble:
        return 'nibble';
      case InformationUnit.byte:
        return 'B';
      case InformationUnit.kilobit:
        return 'kbit';
      case InformationUnit.kibibit:
        return 'Kibit';
      case InformationUnit.kilobyte:
        return 'KB';
      case InformationUnit.kibibyte:
        return 'KiB';
      case InformationUnit.megabit:
        return 'Mbit';
      case InformationUnit.mebibit:
        return 'Mibit';
      case InformationUnit.megabyte:
        return 'MB';
      case InformationUnit.mebibyte:
        return 'MiB';
      case InformationUnit.gigabit:
        return 'Gbit';
      case InformationUnit.gibibit:
        return 'Gibit';
      case InformationUnit.gigabyte:
        return 'GB';
      case InformationUnit.gibibyte:
        return 'GiB';
      case InformationUnit.terabit:
        return 'Tbit';
      case InformationUnit.tebibit:
        return 'Tibit';
      case InformationUnit.terabyte:
        return 'TB';
      case InformationUnit.tebibyte:
        return 'TiB';
      case InformationUnit.petabit:
        return 'Pbit';
      case InformationUnit.pebibit:
        return 'Pibit';
      case InformationUnit.petabyte:
        return 'PB';
      case InformationUnit.pebibyte:
        return 'PiB';
      case InformationUnit.exabit:
        return 'Ebit';
      case InformationUnit.exbibit:
        return 'Eibit';
      case InformationUnit.exabyte:
        return 'EB';
      case InformationUnit.exbibyte:
        return 'EiB';
      case InformationUnit.zettabit:
        return 'Zbit';
      case InformationUnit.zebibit:
        return 'Zibit';
      case InformationUnit.zettabyte:
        return 'ZB';
      case InformationUnit.zebibyte:
        return 'ZiB';
      case InformationUnit.yottabit:
        return 'Ybit';
      case InformationUnit.yobibit:
        return 'Yibit';
      case InformationUnit.yottabyte:
        return 'YB';
      case InformationUnit.yobibyte:
        return 'YiB';
    }
  }

  /// Gets the pattern specifier for this unit.
  String get patternSpecifier => getSymbol(
        locale: 'en',
      );
}

/// Represents a rate of transfer of [InformationSize].
class InformationRate extends UnitOfMeasurementRate<InformationSize> {
  const InformationRate._({
    required InformationSize value,
    required Duration period,
  }) : super(
          value: value,
          period: period,
        );

  @override
  String toString() => humanize();
}

/// Allows an [InformationSize] to be formatted.
///
/// See [UnitOfMeasurementFormat] for general notes on the pattern syntax, which you can combine with the
/// [InformationUnit] pattern specifiers as required:
///
/// | Specifier | Description |
/// |-|-|
/// | `b` | bit |
/// | `crumb` | crumb |
/// | `nibble` | nibble |
/// | `B` | byte |
/// | `kbit` | kilobit |
/// | `Kibit` | kibibit |
/// | `KB` | kilobyte |
/// | `KiB` | kibibyte |
/// | `Mbit` | megabit |
/// | `Mibit` | mebibit |
/// | `MB` | megabyte |
/// | `MiB` | mebibyte |
/// | `Gbit` | gigabit |
/// | `Gibit` | gibibit |
/// | `GB` | gigabyte |
/// | `GiB` | gibibyte |
/// | `Tbit` | terabit |
/// | `Tibit` | tebibit |
/// | `TB` | terabyte |
/// | `TiB` | tebibyte |
/// | `Pbit` | petabit |
/// | `Pibit` | pebibit |
/// | `PB` | petabyte |
/// | `PiB` | pebibyte |
/// | `Ebit` | exabit |
/// | `Eibit` | exbibit |
/// | `EB` | exabyte |
/// | `EiB` | exbibyte |
/// | `Zbit` | zettabit |
/// | `Zibit` | zebibit |
/// | `ZB` | zettabyte |
/// | `ZiB` | zebibyte |
/// | `Ybit` | yottabit |
/// | `Yibit` | yobibit |
/// | `YB` | yottabyte |
/// | `YiB` | yobibyte |
///
/// ```
/// final informationSize = 42000.bytes();
///
/// // '41.02 KiB'
/// final result1 = InformationSizeFormat().format(informationSize);
///
/// // '42 KB'
/// final result2 = InformationSizeFormat(
/// permissibleValueUnits: InformationUnits.siBytes,
/// ).format(informationSize);
///
/// // '41.02 kibibytes'
/// final result3 = InformationSizeFormat(pattern: '0.## U').format(informationSize);
///
/// // '0.04 MiB'
/// final result4 = InformationSizeFormat(pattern: '0.## u:MiB').format(informationSize);
/// ```
///
/// See also:
/// * [UnitOfMeasurementFormat]
class InformationSizeFormat extends _BaseInformationFormat<InformationSize> {
  InformationSizeFormat({
    String pattern = '0.## ${UnitOfMeasurementFormat.valueUnitSymbolFormatSpecifier}',
    Set<InformationUnit> permissibleValueUnits = InformationUnits.iecBytes,
    String? locale,
  }) : super._(
          pattern: pattern,
          permissibleValueUnits: permissibleValueUnits,
          permissibleRateUnits: const <RateUnit>{},
          locale: locale,
        );

  @override
  InformationUnit getLargestUnit(InformationSize input) =>
      input.getLargestUnit(permissibleUnits: permissibleValueUnits);

  @override
  Decimal getUnitQuantity(InformationSize input, InformationUnit unit) => input.getUnits(unit);

  @override
  InformationSize scaleToRateUnit(InformationSize input, RateUnit rateUnit) =>
      throw UnsupportedError('Cannot scale InformationSize to a RateUnit');
}

/// Allows an [InformationRate] to be formatted.
///
/// See [UnitOfMeasurementFormat] for general notes on the pattern syntax and [InformationSizeFormat] for
/// information-specific notes.
///
/// ```
/// final informationRate = 42.kilobytes().per(const Duration(seconds: 1));
///
/// // '41.02 KiB/s'
/// final result1 = InformationRateFormat().format(informationRate);
///
/// // '41.02 kibibytes per second'
/// final result2 = InformationRateFormat(pattern: "0.## U 'per' R").format(informationRate);
///
/// // '151,200 KB/hr'
/// final result3 = InformationRateFormat(
///   pattern: "###,##0.## u:KB'/'r:hr",
///   permissibleValueUnits: InformationUnits.siBytes,
/// ).format(informationRate);
/// ```
///
/// See also:
/// * [UnitOfMeasurementFormat]
/// * [InformationSizeFormat]
class InformationRateFormat extends _BaseInformationFormat<InformationRate> {
  InformationRateFormat({
    String pattern =
        "0.## ${UnitOfMeasurementFormat.valueUnitSymbolFormatSpecifier}'/'${UnitOfMeasurementFormat.rateUnitSymbolFormatSpecifier}",
    Set<InformationUnit> permissibleValueUnits = InformationUnits.iecBytes,
    Set<RateUnit> permissibleRateUnits = RateUnits.hourOrLess,
    String? locale,
  }) : super._(
          pattern: pattern,
          permissibleValueUnits: permissibleValueUnits,
          permissibleRateUnits: permissibleRateUnits,
          locale: locale,
        );

  @override
  InformationUnit getLargestUnit(InformationRate input) =>
      input.value.getLargestUnit(permissibleUnits: permissibleValueUnits);

  @override
  Decimal getUnitQuantity(InformationRate input, InformationUnit unit) => input.value.getUnits(unit);

  @override
  InformationRate scaleToRateUnit(InformationRate input, RateUnit rateUnit) {
    final scaledPeriod = rateUnit.duration;
    final scale = di(scaledPeriod.inMicroseconds) / di(input.period.inMicroseconds);
    final result = InformationSize.fromBytes(input.value.bytes * scale).per(scaledPeriod);
    return result;
  }
}

abstract class _BaseInformationFormat<TInput> extends UnitOfMeasurementFormat<TInput, InformationUnit> {
  _BaseInformationFormat._({
    required String pattern,
    required this.permissibleValueUnits,
    required this.permissibleRateUnits,
    required String? locale,
  }) : super(
          pattern: pattern,
          locale: locale,
        );

  final Set<InformationUnit> permissibleValueUnits;
  final Set<RateUnit> permissibleRateUnits;

  @override
  String getPatternSpecifierFor(InformationUnit valueUnit) => valueUnit.patternSpecifier;

  @override
  Set<RateUnit> getPermissibleRateUnits() => permissibleRateUnits;

  @override
  Set<InformationUnit> getPermissibleValueUnits() => permissibleValueUnits;

  @override
  String getUnitName(InformationUnit unit, String locale) => unit.getName(locale: locale);

  @override
  String getUnitSymbol(InformationUnit unit, String locale) => unit.getSymbol(locale: locale);
}
