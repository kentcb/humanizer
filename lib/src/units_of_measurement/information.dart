import 'package:humanizer/humanizer.dart';
import 'package:humanizer/src/units_of_measurement/information_constants.dart';
import 'package:humanizer/src/units_of_measurement/rationals.dart';
import 'package:meta/meta.dart';

/// A unit of measurement representing information size.
class InformationSize extends UnitOfMeasurement<InformationUnit, InformationSize> {
  /// Creates an [InformationSize] given a [unit] and rational [value] for that unit.
  InformationSize.fromUnits(InformationUnit unit, Rational value) : super.fromUnits(unit, value);

  /// Creates an [InformationSize] representing the specified number of [bits].
  factory InformationSize.fromBits(Rational bits) => InformationSize.fromUnits(InformationUnit.bit, bits);

  /// Creates an [InformationSize] representing the specified number of [crumbs].
  factory InformationSize.fromCrumbs(Rational crumbs) => InformationSize.fromUnits(InformationUnit.crumb, crumbs);

  /// Creates an [InformationSize] representing the specified number of [nibbles].
  factory InformationSize.fromNibbles(Rational nibbles) => InformationSize.fromUnits(InformationUnit.nibble, nibbles);

  /// Creates an [InformationSize] representing the specified number of [bytes].
  factory InformationSize.fromBytes(Rational bytes) => InformationSize.fromUnits(InformationUnit.byte, bytes);

  /// Creates an [InformationSize] representing the specified number of [kilobits].
  factory InformationSize.fromKilobits(Rational kilobits) =>
      InformationSize.fromUnits(InformationUnit.kilobit, kilobits);

  /// Creates an [InformationSize] representing the specified number of [kibibits].
  factory InformationSize.fromKibibits(Rational kibibits) =>
      InformationSize.fromUnits(InformationUnit.kibibit, kibibits);

  /// Creates an [InformationSize] representing the specified number of [kilobytes].
  factory InformationSize.fromKilobytes(Rational kilobytes) =>
      InformationSize.fromUnits(InformationUnit.kilobyte, kilobytes);

  /// Creates an [InformationSize] representing the specified number of [kibibytes].
  factory InformationSize.fromKibibytes(Rational kibibytes) =>
      InformationSize.fromUnits(InformationUnit.kibibyte, kibibytes);

  /// Creates an [InformationSize] representing the specified number of [megabits].
  factory InformationSize.fromMegabits(Rational megabits) =>
      InformationSize.fromUnits(InformationUnit.megabit, megabits);

  /// Creates an [InformationSize] representing the specified number of [mebibits].
  factory InformationSize.fromMebibits(Rational mebibits) =>
      InformationSize.fromUnits(InformationUnit.mebibit, mebibits);

  /// Creates an [InformationSize] representing the specified number of [megabytes].
  factory InformationSize.fromMegabytes(Rational megabytes) =>
      InformationSize.fromUnits(InformationUnit.megabyte, megabytes);

  /// Creates an [InformationSize] representing the specified number of [mebibytes].
  factory InformationSize.fromMebibytes(Rational mebibytes) =>
      InformationSize.fromUnits(InformationUnit.mebibyte, mebibytes);

  /// Creates an [InformationSize] representing the specified number of [gigabits].
  factory InformationSize.fromGigabits(Rational gigabits) =>
      InformationSize.fromUnits(InformationUnit.gigabit, gigabits);

  /// Creates an [InformationSize] representing the specified number of [gibibits].
  factory InformationSize.fromGibibits(Rational gibibits) =>
      InformationSize.fromUnits(InformationUnit.gibibit, gibibits);

  /// Creates an [InformationSize] representing the specified number of [gigabytes].
  factory InformationSize.fromGigabytes(Rational gigabytes) =>
      InformationSize.fromUnits(InformationUnit.gigabyte, gigabytes);

  /// Creates an [InformationSize] representing the specified number of [gibibytes].
  factory InformationSize.fromGibibytes(Rational gibibytes) =>
      InformationSize.fromUnits(InformationUnit.gibibyte, gibibytes);

  /// Creates an [InformationSize] representing the specified number of [terabits].
  factory InformationSize.fromTerabits(Rational terabits) =>
      InformationSize.fromUnits(InformationUnit.terabit, terabits);

  /// Creates an [InformationSize] representing the specified number of [tebibits].
  factory InformationSize.fromTebibits(Rational tebibits) =>
      InformationSize.fromUnits(InformationUnit.tebibit, tebibits);

  /// Creates an [InformationSize] representing the specified number of [terabytes].
  factory InformationSize.fromTerabytes(Rational terabytes) =>
      InformationSize.fromUnits(InformationUnit.terabyte, terabytes);

  /// Creates an [InformationSize] representing the specified number of [tebibytes].
  factory InformationSize.fromTebibytes(Rational tebibytes) =>
      InformationSize.fromUnits(InformationUnit.tebibyte, tebibytes);

  /// Creates an [InformationSize] representing the specified number of [petabits].
  factory InformationSize.fromPetabits(Rational petabits) =>
      InformationSize.fromUnits(InformationUnit.petabit, petabits);

  /// Creates an [InformationSize] representing the specified number of [pebibits].
  factory InformationSize.fromPebibits(Rational pebibits) =>
      InformationSize.fromUnits(InformationUnit.pebibit, pebibits);

  /// Creates an [InformationSize] representing the specified number of [petabytes].
  factory InformationSize.fromPetabytes(Rational petabytes) =>
      InformationSize.fromUnits(InformationUnit.petabyte, petabytes);

  /// Creates an [InformationSize] representing the specified number of [pebibytes].
  factory InformationSize.fromPebibytes(Rational pebibytes) =>
      InformationSize.fromUnits(InformationUnit.pebibyte, pebibytes);

  /// Creates an [InformationSize] representing the specified number of [exabits].
  factory InformationSize.fromExabits(Rational exabits) => InformationSize.fromUnits(InformationUnit.exabit, exabits);

  /// Creates an [InformationSize] representing the specified number of [exbibits].
  factory InformationSize.fromExbibits(Rational exbibits) =>
      InformationSize.fromUnits(InformationUnit.exbibit, exbibits);

  /// Creates an [InformationSize] representing the specified number of [exabytes].
  factory InformationSize.fromExabytes(Rational exabytes) =>
      InformationSize.fromUnits(InformationUnit.exabyte, exabytes);

  /// Creates an [InformationSize] representing the specified number of [exbibytes].
  factory InformationSize.fromExbibytes(Rational exbibytes) =>
      InformationSize.fromUnits(InformationUnit.exbibyte, exbibytes);

  /// Creates an [InformationSize] representing the specified number of [zettabits].
  factory InformationSize.fromZettabits(Rational zettabits) =>
      InformationSize.fromUnits(InformationUnit.zettabit, zettabits);

  /// Creates an [InformationSize] representing the specified number of [zebibits].
  factory InformationSize.fromZebibits(Rational zebibits) =>
      InformationSize.fromUnits(InformationUnit.zebibit, zebibits);

  /// Creates an [InformationSize] representing the specified number of [zettabytes].
  factory InformationSize.fromZettabytes(Rational zettabytes) =>
      InformationSize.fromUnits(InformationUnit.zettabyte, zettabytes);

  /// Creates an [InformationSize] representing the specified number of [zebibytes].
  factory InformationSize.fromZebibytes(Rational zebibytes) =>
      InformationSize.fromUnits(InformationUnit.zebibyte, zebibytes);

  /// Creates an [InformationSize] representing the specified number of [yottabits].
  factory InformationSize.fromYottabits(Rational yottabits) =>
      InformationSize.fromUnits(InformationUnit.yottabit, yottabits);

  /// Creates an [InformationSize] representing the specified number of [yobibits].
  factory InformationSize.fromYobibits(Rational yobibits) =>
      InformationSize.fromUnits(InformationUnit.yobibit, yobibits);

  /// Creates an [InformationSize] representing the specified number of [yottabytes].
  factory InformationSize.fromYottabytes(Rational yottabytes) =>
      InformationSize.fromUnits(InformationUnit.yottabyte, yottabytes);

  /// Creates an [InformationSize] representing the specified number of [yobibytes].
  factory InformationSize.fromYobibytes(Rational yobibytes) =>
      InformationSize.fromUnits(InformationUnit.yobibyte, yobibytes);

  /// An [InformationSize] of size zero.
  static final zero = InformationSize.fromBits(Rationals.zero);

  static final _defaultFormat = InformationSizeFormat();

  /// Gets the number of bits in this [InformationSize], including any fractional portion.
  Rational get bits => getUnits(InformationUnit.bit);

  /// Gets the number of crumbs in this [InformationSize], including any fractional portion.
  Rational get crumbs => getUnits(InformationUnit.crumb);

  /// Gets the number of nibbles in this [InformationSize], including any fractional portion.
  Rational get nibbles => getUnits(InformationUnit.nibble);

  /// Gets the number of bytes in this [InformationSize], including any fractional portion.
  Rational get bytes => getUnits(InformationUnit.byte);

  /// Gets the number of kilobits in this [InformationSize], including any fractional portion.
  Rational get kilobits => getUnits(InformationUnit.kilobit);

  /// Gets the number of kibibits in this [InformationSize], including any fractional portion.
  Rational get kibibits => getUnits(InformationUnit.kibibit);

  /// Gets the number of kilobytes in this [InformationSize], including any fractional portion.
  Rational get kilobytes => getUnits(InformationUnit.kilobyte);

  /// Gets the number of kibibytes in this [InformationSize], including any fractional portion.
  Rational get kibibytes => getUnits(InformationUnit.kibibyte);

  /// Gets the number of megabits in this [InformationSize], including any fractional portion.
  Rational get megabits => getUnits(InformationUnit.megabit);

  /// Gets the number of mebibits in this [InformationSize], including any fractional portion.
  Rational get mebibits => getUnits(InformationUnit.mebibit);

  /// Gets the number of megabytes in this [InformationSize], including any fractional portion.
  Rational get megabytes => getUnits(InformationUnit.megabyte);

  /// Gets the number of mebibytes in this [InformationSize], including any fractional portion.
  Rational get mebibytes => getUnits(InformationUnit.mebibyte);

  /// Gets the number of gigabits in this [InformationSize], including any fractional portion.
  Rational get gigabits => getUnits(InformationUnit.gigabit);

  /// Gets the number of gibibits in this [InformationSize], including any fractional portion.
  Rational get gibibits => getUnits(InformationUnit.gibibit);

  /// Gets the number of gigabytes in this [InformationSize], including any fractional portion.
  Rational get gigabytes => getUnits(InformationUnit.gigabyte);

  /// Gets the number of gibibytes in this [InformationSize], including any fractional portion.
  Rational get gibibytes => getUnits(InformationUnit.gibibyte);

  /// Gets the number of terabits in this [InformationSize], including any fractional portion.
  Rational get terabits => getUnits(InformationUnit.terabit);

  /// Gets the number of tebibits in this [InformationSize], including any fractional portion.
  Rational get tebibits => getUnits(InformationUnit.tebibit);

  /// Gets the number of terabytes in this [InformationSize], including any fractional portion.
  Rational get terabytes => getUnits(InformationUnit.terabyte);

  /// Gets the number of tebibytes in this [InformationSize], including any fractional portion.
  Rational get tebibytes => getUnits(InformationUnit.tebibyte);

  /// Gets the number of petabits in this [InformationSize], including any fractional portion.
  Rational get petabits => getUnits(InformationUnit.petabit);

  /// Gets the number of pebibits in this [InformationSize], including any fractional portion.
  Rational get pebibits => getUnits(InformationUnit.pebibit);

  /// Gets the number of petabytes in this [InformationSize], including any fractional portion.
  Rational get petabytes => getUnits(InformationUnit.petabyte);

  /// Gets the number of pebibytes in this [InformationSize], including any fractional portion.
  Rational get pebibytes => getUnits(InformationUnit.pebibyte);

  /// Gets the number of exabits in this [InformationSize], including any fractional portion.
  Rational get exabits => getUnits(InformationUnit.exabit);

  /// Gets the number of exbibits in this [InformationSize], including any fractional portion.
  Rational get exbibits => getUnits(InformationUnit.exbibit);

  /// Gets the number of exabytes in this [InformationSize], including any fractional portion.
  Rational get exabytes => getUnits(InformationUnit.exabyte);

  /// Gets the number of exbibytes in this [InformationSize], including any fractional portion.
  Rational get exbibytes => getUnits(InformationUnit.exbibyte);

  /// Gets the number of zettabits in this [InformationSize], including any fractional portion.
  Rational get zettabits => getUnits(InformationUnit.zettabit);

  /// Gets the number of zebibits in this [InformationSize], including any fractional portion.
  Rational get zebibits => getUnits(InformationUnit.zebibit);

  /// Gets the number of zettabytes in this [InformationSize], including any fractional portion.
  Rational get zettabytes => getUnits(InformationUnit.zettabyte);

  /// Gets the number of zebibytes in this [InformationSize], including any fractional portion.
  Rational get zebibytes => getUnits(InformationUnit.zebibyte);

  /// Gets the number of yottabits in this [InformationSize], including any fractional portion.
  Rational get yottabits => getUnits(InformationUnit.yottabit);

  /// Gets the number of yobibits in this [InformationSize], including any fractional portion.
  Rational get yobibits => getUnits(InformationUnit.yobibit);

  /// Gets the number of yottabytes in this [InformationSize], including any fractional portion.
  Rational get yottabytes => getUnits(InformationUnit.yottabyte);

  /// Gets the number of yobibytes in this [InformationSize], including any fractional portion.
  Rational get yobibytes => getUnits(InformationUnit.yobibyte);

  /// Creates an [InformationRate] with the specified [period] from this value.
  InformationRate per(Duration period) => InformationRate._(
        value: this,
        period: period,
      );

  @override
  Rational getUnits(InformationUnit unit) => baseValue / unit._byteCount;

  @override
  String toString() => _defaultFormat.format(this);

  @override
  @protected
  InformationSize createValue(Rational baseValue) => InformationSize.fromBytes(baseValue);

  @override
  @protected
  Rational getBaseValue(InformationUnit unit, Rational value) => value * unit._byteCount;
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
    // SI.
    InformationUnit.bit,
    InformationUnit.crumb,
    InformationUnit.nibble,
    InformationUnit.kilobit,
    InformationUnit.megabit,
    InformationUnit.gigabit,
    InformationUnit.terabit,
    InformationUnit.petabit,
    InformationUnit.exabit,
    InformationUnit.zettabit,
    InformationUnit.yottabit,
    InformationUnit.byte,
    InformationUnit.kilobyte,
    InformationUnit.megabyte,
    InformationUnit.gigabyte,
    InformationUnit.terabyte,
    InformationUnit.petabyte,
    InformationUnit.exabyte,
    InformationUnit.zettabyte,
    InformationUnit.yottabyte,

    // IEC.
    InformationUnit.kibibit,
    InformationUnit.mebibit,
    InformationUnit.gibibit,
    InformationUnit.tebibit,
    InformationUnit.pebibit,
    InformationUnit.exbibit,
    InformationUnit.zebibit,
    InformationUnit.yobibit,
    InformationUnit.kibibyte,
    InformationUnit.mebibyte,
    InformationUnit.gibibyte,
    InformationUnit.tebibyte,
    InformationUnit.pebibyte,
    InformationUnit.exbibyte,
    InformationUnit.zebibyte,
    InformationUnit.yobibyte,
  };

  /// Contains International Engineering Consortium (IEC) [InformationUnit]s of byte granularity.
  static const iecBytes = <InformationUnit>{
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

  /// Contains International Engineering Consortium (IEC) [InformationUnit]s of bit granularity.
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
  Rational get _byteCount {
    switch (this) {
      // SI.
      case InformationUnit.bit:
        return bytesInBit;
      case InformationUnit.crumb:
        return bytesInCrumb;
      case InformationUnit.nibble:
        return bytesInNibble;
      case InformationUnit.kilobit:
        return bytesInKilobit;
      case InformationUnit.megabit:
        return bytesInMegabit;
      case InformationUnit.gigabit:
        return bytesInGigabit;
      case InformationUnit.terabit:
        return bytesInTerabit;
      case InformationUnit.petabit:
        return bytesInPetabit;
      case InformationUnit.exabit:
        return bytesInExabit;
      case InformationUnit.zettabit:
        return bytesInZettabit;
      case InformationUnit.yottabit:
        return bytesInYottabit;
      case InformationUnit.byte:
        return bytesInByte;
      case InformationUnit.kilobyte:
        return bytesInKilobyte;
      case InformationUnit.megabyte:
        return bytesInMegabyte;
      case InformationUnit.gigabyte:
        return bytesInGigabyte;
      case InformationUnit.terabyte:
        return bytesInTerabyte;
      case InformationUnit.petabyte:
        return bytesInPetabyte;
      case InformationUnit.exabyte:
        return bytesInExabyte;
      case InformationUnit.zettabyte:
        return bytesInZettabyte;
      case InformationUnit.yottabyte:
        return bytesInYottabyte;

      // IEC.
      case InformationUnit.kibibit:
        return bytesInKibibit;
      case InformationUnit.mebibit:
        return bytesInMebibit;
      case InformationUnit.gibibit:
        return bytesInGibibit;
      case InformationUnit.tebibit:
        return bytesInTebibit;
      case InformationUnit.pebibit:
        return bytesInPebibit;
      case InformationUnit.exbibit:
        return bytesInExbibit;
      case InformationUnit.zebibit:
        return bytesInZebibit;
      case InformationUnit.yobibit:
        return bytesInYobibit;
      case InformationUnit.kibibyte:
        return bytesInKibibyte;
      case InformationUnit.mebibyte:
        return bytesInMebibyte;
      case InformationUnit.gibibyte:
        return bytesInGibibyte;
      case InformationUnit.tebibyte:
        return bytesInTebibyte;
      case InformationUnit.pebibyte:
        return bytesInPebibyte;
      case InformationUnit.exbibyte:
        return bytesInExbibyte;
      case InformationUnit.zebibyte:
        return bytesInZebibyte;
      case InformationUnit.yobibyte:
        return bytesInYobibyte;
    }
  }

  /// Gets a localized name for this unit.
  String getName({
    required String locale,
  }) {
    switch (this) {
      // SI.
      case InformationUnit.bit:
        return 'bit';
      case InformationUnit.crumb:
        return 'crumb';
      case InformationUnit.nibble:
        return 'nibble';
      case InformationUnit.kilobit:
        return 'kilobit';
      case InformationUnit.megabit:
        return 'megabit';
      case InformationUnit.gigabit:
        return 'gigabit';
      case InformationUnit.terabit:
        return 'terabit';
      case InformationUnit.petabit:
        return 'petabit';
      case InformationUnit.exabit:
        return 'exabit';
      case InformationUnit.zettabit:
        return 'zettabit';
      case InformationUnit.yottabit:
        return 'yottabit';
      case InformationUnit.byte:
        return 'byte';
      case InformationUnit.kilobyte:
        return 'kilobyte';
      case InformationUnit.megabyte:
        return 'megabyte';
      case InformationUnit.gigabyte:
        return 'gigabyte';
      case InformationUnit.terabyte:
        return 'terabyte';
      case InformationUnit.petabyte:
        return 'petabyte';
      case InformationUnit.exabyte:
        return 'exabyte';
      case InformationUnit.zettabyte:
        return 'zettabyte';
      case InformationUnit.yottabyte:
        return 'yottabyte';

      // IEC.
      case InformationUnit.kibibit:
        return 'kibibit';
      case InformationUnit.mebibit:
        return 'mebibit';
      case InformationUnit.gibibit:
        return 'gibibit';
      case InformationUnit.tebibit:
        return 'tebibit';
      case InformationUnit.pebibit:
        return 'pebibit';
      case InformationUnit.exbibit:
        return 'exbibit';
      case InformationUnit.zebibit:
        return 'zebibit';
      case InformationUnit.yobibit:
        return 'yobibit';
      case InformationUnit.kibibyte:
        return 'kibibyte';
      case InformationUnit.mebibyte:
        return 'mebibyte';
      case InformationUnit.gibibyte:
        return 'gibibyte';
      case InformationUnit.tebibyte:
        return 'tebibyte';
      case InformationUnit.pebibyte:
        return 'pebibyte';
      case InformationUnit.exbibyte:
        return 'exbibyte';
      case InformationUnit.zebibyte:
        return 'zebibyte';
      case InformationUnit.yobibyte:
        return 'yobibyte';
    }
  }

  /// Gets a localized symbol for this unit.
  String getSymbol({
    required String locale,
  }) {
    switch (this) {
      // SI.
      case InformationUnit.bit:
        return 'b';
      case InformationUnit.crumb:
        return 'crumb';
      case InformationUnit.nibble:
        return 'nibble';
      case InformationUnit.kilobit:
        return 'kbit';
      case InformationUnit.megabit:
        return 'Mbit';
      case InformationUnit.gigabit:
        return 'Gbit';
      case InformationUnit.terabit:
        return 'Tbit';
      case InformationUnit.petabit:
        return 'Pbit';
      case InformationUnit.exabit:
        return 'Ebit';
      case InformationUnit.zettabit:
        return 'Zbit';
      case InformationUnit.yottabit:
        return 'Ybit';
      case InformationUnit.byte:
        return 'B';
      case InformationUnit.kilobyte:
        return 'KB';
      case InformationUnit.megabyte:
        return 'MB';
      case InformationUnit.gigabyte:
        return 'GB';
      case InformationUnit.terabyte:
        return 'TB';
      case InformationUnit.petabyte:
        return 'PB';
      case InformationUnit.exabyte:
        return 'EB';
      case InformationUnit.zettabyte:
        return 'ZB';
      case InformationUnit.yottabyte:
        return 'YB';

      // IEC.
      case InformationUnit.kibibit:
        return 'Kibit';
      case InformationUnit.mebibit:
        return 'Mibit';
      case InformationUnit.gibibit:
        return 'Gibit';
      case InformationUnit.tebibit:
        return 'Tibit';
      case InformationUnit.pebibit:
        return 'Pibit';
      case InformationUnit.exbibit:
        return 'Eibit';
      case InformationUnit.zebibit:
        return 'Zibit';
      case InformationUnit.yobibit:
        return 'Yibit';
      case InformationUnit.kibibyte:
        return 'KiB';
      case InformationUnit.mebibyte:
        return 'MiB';
      case InformationUnit.gibibyte:
        return 'GiB';
      case InformationUnit.tebibyte:
        return 'TiB';
      case InformationUnit.pebibyte:
        return 'PiB';
      case InformationUnit.exbibyte:
        return 'EiB';
      case InformationUnit.zebibyte:
        return 'ZiB';
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

  static final _defaultFormat = InformationRateFormat();

  @override
  String toString() => _defaultFormat.format(this);
}

/// Allows an [InformationSize] to be formatted.
///
/// See [UnitOfMeasurementFormat] for general notes on the pattern syntax, which you can combine with the
/// [InformationUnit] pattern specifiers as required:
///
/// | | Unit | Specifier |
/// |:-|:-|:-|
/// | **S.I.** | bit | `b` |
/// | | crumb | `crumb` |
/// | | nibble | `nibble` |
/// | | kilobit | `kbit` |
/// | | megabit | `Mbit` |
/// | | gigabit | `Gbit` |
/// | | terabit | `Tbit` |
/// | | petabit | `Pbit` |
/// | | exabit | `Ebit` |
/// | | zettabit | `Zbit` |
/// | | yottabit | `Ybit` |
/// | | byte | `B` |
/// | | kilobyte | `KB` |
/// | | megabyte | `MB` |
/// | | gigabyte | `GB` |
/// | | terabyte | `TB` |
/// | | petabyte | `PB` |
/// | | exabyte | `EB` |
/// | | zettabyte | `ZB` |
/// | | yottabyte | `YB` |
/// | **I.E.C.** | kibibit | `Kibit` |
/// | | mebibit | `Mibit` |
/// | | gibibit | `Gibit` |
/// | | tebibit | `Tibit` |
/// | | pebibit | `Pibit` |
/// | | exbibit | `Eibit` |
/// | | zebibit | `Zibit` |
/// | | yobibit | `Yibit` |
/// | | kibibyte | `KiB` |
/// | | mebibyte | `MiB` |
/// | | gibibyte | `GiB` |
/// | | tebibyte | `TiB` |
/// | | pebibyte | `PiB` |
/// | | exbibyte | `EiB` |
/// | | zebibyte | `ZiB` |
/// | | yobibyte | `YiB` |
///
/// ```
/// final informationSize = 42000.bytes();
///
/// // '41.02KiB'
/// final result1 = InformationSizeFormat().format(informationSize);
///
/// // '42KB'
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
    String pattern = '0.##${UnitOfMeasurementFormat.valueUnitSymbolFormatSpecifier}',
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
  Rational getUnitQuantity(InformationSize input, InformationUnit unit) => input.getUnits(unit);

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
/// // '41.02KiB/s'
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
        "0.##${UnitOfMeasurementFormat.valueUnitSymbolFormatSpecifier}'/'${UnitOfMeasurementFormat.rateUnitSymbolFormatSpecifier}",
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
  Rational getUnitQuantity(InformationRate input, InformationUnit unit) => input.value.getUnits(unit);

  @override
  InformationRate scaleToRateUnit(InformationRate input, RateUnit rateUnit) {
    final scaledPeriod = rateUnit.duration;
    final scale = Rational.fromInt(scaledPeriod.inMicroseconds) / Rational.fromInt(input.period.inMicroseconds);
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
