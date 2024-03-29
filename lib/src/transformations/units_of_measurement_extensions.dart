// ignore_for_file: use_to_and_as_if_applicable

import 'package:humanizer/humanizer.dart';
import 'package:rational/rational.dart';

/// Provides extensions on [int] related to units of measurement.
extension UnitsOfMeasurementIntExtensions on int {
  /// Gets an [Area] representing this number of square nanometers.
  Area squareNanometers() => Rational.fromInt(this).squareNanometers();

  /// Gets an [Area] representing this number of square micrometers.
  Area squareMicrometers() => Rational.fromInt(this).squareMicrometers();

  /// Gets an [Area] representing this number of square thous.
  Area squareThous() => Rational.fromInt(this).squareThous();

  /// Gets an [Area] representing this number of square millimeters.
  Area squareMillimeters() => Rational.fromInt(this).squareMillimeters();

  /// Gets an [Area] representing this number of square centimeters.
  Area squareCentimeters() => Rational.fromInt(this).squareCentimeters();

  /// Gets an [Area] representing this number of square inches.
  Area squareInches() => Rational.fromInt(this).squareInches();

  /// Gets an [Area] representing this number of square decimeters.
  Area squareDecimeters() => Rational.fromInt(this).squareDecimeters();

  /// Gets an [Area] representing this number of square feet.
  Area squareFeet() => Rational.fromInt(this).squareFeet();

  /// Gets an [Area] representing this number of square yards.
  Area squareYards() => Rational.fromInt(this).squareYards();

  /// Gets an [Area] representing this number of square meters.
  Area squareMeters() => Rational.fromInt(this).squareMeters();

  /// Gets an [Area] representing this number of square decameters.
  Area squareDecameters() => Rational.fromInt(this).squareDecameters();

  /// Gets an [Area] representing this number of acres.
  Area acres() => Rational.fromInt(this).acres();

  /// Gets an [Area] representing this number of hectares.
  Area hectares() => Rational.fromInt(this).hectares();

  /// Gets an [Area] representing this number of square kilometers.
  Area squareKilometers() => Rational.fromInt(this).squareKilometers();

  /// Gets an [Area] representing this number of square miles.
  Area squareMiles() => Rational.fromInt(this).squareMiles();

  /// Gets an [Area] representing this number of square megameters.
  Area squareMegameters() => Rational.fromInt(this).squareMegameters();

  /// Gets an [Area] representing this number of square gigameters.
  Area squareGigameters() => Rational.fromInt(this).squareGigameters();

  /// Gets an [InformationSize] representing this number of bits.
  InformationSize bits() => Rational.fromInt(this).bits();

  /// Gets an [InformationSize] representing this number of crumbs.
  InformationSize crumbs() => Rational.fromInt(this).crumbs();

  /// Gets an [InformationSize] representing this number of nibbles.
  InformationSize nibbles() => Rational.fromInt(this).nibbles();

  /// Gets an [InformationSize] representing this number of bytes.
  InformationSize bytes() => Rational.fromInt(this).bytes();

  /// Gets an [InformationSize] representing this number of kilobits.
  InformationSize kilobits() => Rational.fromInt(this).kilobits();

  /// Gets an [InformationSize] representing this number of kibibits.
  InformationSize kibibits() => Rational.fromInt(this).kibibits();

  /// Gets an [InformationSize] representing this number of kilobytes.
  InformationSize kilobytes() => Rational.fromInt(this).kilobytes();

  /// Gets an [InformationSize] representing this number of kibibytes.
  InformationSize kibibytes() => Rational.fromInt(this).kibibytes();

  /// Gets an [InformationSize] representing this number of megabits.
  InformationSize megabits() => Rational.fromInt(this).megabits();

  /// Gets an [InformationSize] representing this number of mebibits.
  InformationSize mebibits() => Rational.fromInt(this).mebibits();

  /// Gets an [InformationSize] representing this number of megabytes.
  InformationSize megabytes() => Rational.fromInt(this).megabytes();

  /// Gets an [InformationSize] representing this number of mebibytes.
  InformationSize mebibytes() => Rational.fromInt(this).mebibytes();

  /// Gets an [InformationSize] representing this number of gigabits.
  InformationSize gigabits() => Rational.fromInt(this).gigabits();

  /// Gets an [InformationSize] representing this number of gibibits.
  InformationSize gibibits() => Rational.fromInt(this).gibibits();

  /// Gets an [InformationSize] representing this number of gigabytes.
  InformationSize gigabytes() => Rational.fromInt(this).gigabytes();

  /// Gets an [InformationSize] representing this number of gibibytes.
  InformationSize gibibytes() => Rational.fromInt(this).gibibytes();

  /// Gets an [InformationSize] representing this number of terabits.
  InformationSize terabits() => Rational.fromInt(this).terabits();

  /// Gets an [InformationSize] representing this number of tebibits.
  InformationSize tebibits() => Rational.fromInt(this).tebibits();

  /// Gets an [InformationSize] representing this number of terabytes.
  InformationSize terabytes() => Rational.fromInt(this).terabytes();

  /// Gets an [InformationSize] representing this number of tebibytes.
  InformationSize tebibytes() => Rational.fromInt(this).tebibytes();

  /// Gets an [InformationSize] representing this number of petabits.
  InformationSize petabits() => Rational.fromInt(this).petabits();

  /// Gets an [InformationSize] representing this number of pebibits.
  InformationSize pebibits() => Rational.fromInt(this).pebibits();

  /// Gets an [InformationSize] representing this number of petabytes.
  InformationSize petabytes() => Rational.fromInt(this).petabytes();

  /// Gets an [InformationSize] representing this number of pebibytes.
  InformationSize pebibytes() => Rational.fromInt(this).pebibytes();

  /// Gets an [InformationSize] representing this number of exabits.
  InformationSize exabits() => Rational.fromInt(this).exabits();

  /// Gets an [InformationSize] representing this number of exbibits.
  InformationSize exbibits() => Rational.fromInt(this).exbibits();

  /// Gets an [InformationSize] representing this number of exabytes.
  InformationSize exabytes() => Rational.fromInt(this).exabytes();

  /// Gets an [InformationSize] representing this number of exbibytes.
  InformationSize exbibytes() => Rational.fromInt(this).exbibytes();

  /// Gets an [InformationSize] representing this number of zettabits.
  InformationSize zettabits() => Rational.fromInt(this).zettabits();

  /// Gets an [InformationSize] representing this number of zebibits.
  InformationSize zebibits() => Rational.fromInt(this).zebibits();

  /// Gets an [InformationSize] representing this number of zettabytes.
  InformationSize zettabytes() => Rational.fromInt(this).zettabytes();

  /// Gets an [InformationSize] representing this number of zebibytes.
  InformationSize zebibytes() => Rational.fromInt(this).zebibytes();

  /// Gets an [InformationSize] representing this number of yottabits.
  InformationSize yottabits() => Rational.fromInt(this).yottabits();

  /// Gets an [InformationSize] representing this number of yobibits.
  InformationSize yobibits() => Rational.fromInt(this).yobibits();

  /// Gets an [InformationSize] representing this number of yottabytes.
  InformationSize yottabytes() => Rational.fromInt(this).yottabytes();

  /// Gets an [InformationSize] representing this number of yobibytes.
  InformationSize yobibytes() => Rational.fromInt(this).yobibytes();

  /// Gets a [Length] representing this number of nanometers.
  Length nanometers() => Rational.fromInt(this).nanometers();

  /// Gets a [Length] representing this number of micrometers.
  Length micrometers() => Rational.fromInt(this).micrometers();

  /// Gets a [Length] representing this number of thous.
  Length thous() => Rational.fromInt(this).thous();

  /// Gets a [Length] representing this number of millimeters.
  Length millimeters() => Rational.fromInt(this).millimeters();

  /// Gets a [Length] representing this number of centimeters.
  Length centimeters() => Rational.fromInt(this).centimeters();

  /// Gets a [Length] representing this number of inches.
  Length inches() => Rational.fromInt(this).inches();

  /// Gets a [Length] representing this number of decimeters.
  Length decimeters() => Rational.fromInt(this).decimeters();

  /// Gets a [Length] representing this number of feet.
  Length feet() => Rational.fromInt(this).feet();

  /// Gets a [Length] representing this number of yards.
  Length yards() => Rational.fromInt(this).yards();

  /// Gets a [Length] representing this number of meters.
  Length meters() => Rational.fromInt(this).meters();

  /// Gets a [Length] representing this number of decameters.
  Length decameters() => Rational.fromInt(this).decameters();

  /// Gets a [Length] representing this number of hectometers.
  Length hectometers() => Rational.fromInt(this).hectometers();

  /// Gets a [Length] representing this number of kilometers.
  Length kilometers() => Rational.fromInt(this).kilometers();

  /// Gets a [Length] representing this number of miles.
  Length miles() => Rational.fromInt(this).miles();

  /// Gets a [Length] representing this number of megameters.
  Length megameters() => Rational.fromInt(this).megameters();

  /// Gets a [Length] representing this number of gigameters.
  Length gigameters() => Rational.fromInt(this).gigameters();

  /// Gets a [Quantity] representing this number of ones.
  Quantity ones() => Rational.fromInt(this).ones();

  /// Gets a [Quantity] representing this number of thousands.
  Quantity thousand() => Rational.fromInt(this).thousand();

  /// Gets a [Quantity] representing this number of millions.
  Quantity million() => Rational.fromInt(this).million();

  /// Gets a [Quantity] representing this number of billions.
  Quantity billion() => Rational.fromInt(this).billion();

  /// Gets a [Quantity] representing this number of trillions.
  Quantity trillion() => Rational.fromInt(this).trillion();

  /// Gets a [Temperature] representing this number of nanokelvins.
  Temperature nanokelvins() => Rational.fromInt(this).nanokelvins();

  /// Gets a [Temperature] representing this number of microkelvins.
  Temperature microkelvins() => Rational.fromInt(this).microkelvins();

  /// Gets a [Temperature] representing this number of millikelvins.
  Temperature millikelvins() => Rational.fromInt(this).millikelvins();

  /// Gets a [Temperature] representing this number of centikelvins.
  Temperature centikelvins() => Rational.fromInt(this).centikelvins();

  /// Gets a [Temperature] representing this number of decikelvins.
  Temperature decikelvins() => Rational.fromInt(this).decikelvins();

  /// Gets a [Temperature] representing this number of kelvins.
  Temperature kelvins() => Rational.fromInt(this).kelvins();

  /// Gets a [Temperature] representing this number of celsius.
  Temperature celsius() => Rational.fromInt(this).celsius();

  /// Gets a [Temperature] representing this number of fahrenheit.
  Temperature fahrenheit() => Rational.fromInt(this).fahrenheit();

  /// Gets a [Time] representing this number of nanoseconds.
  Time nanoseconds() => Rational.fromInt(this).nanoseconds();

  /// Gets a [Time] representing this number of microseconds.
  Time microseconds() => Rational.fromInt(this).microseconds();

  /// Gets a [Time] representing this number of milliseconds.
  Time milliseconds() => Rational.fromInt(this).milliseconds();

  /// Gets a [Time] representing this number of centiseconds.
  Time centiseconds() => Rational.fromInt(this).centiseconds();

  /// Gets a [Time] representing this number of deciseconds.
  Time deciseconds() => Rational.fromInt(this).deciseconds();

  /// Gets a [Time] representing this number of seconds.
  Time seconds() => Rational.fromInt(this).seconds();

  /// Gets a [Time] representing this number of decaseconds.
  Time decaseconds() => Rational.fromInt(this).decaseconds();

  /// Gets a [Time] representing this number of minutes.
  Time minutes() => Rational.fromInt(this).minutes();

  /// Gets a [Time] representing this number of hours.
  Time hours() => Rational.fromInt(this).hours();

  /// Gets a [Time] representing this number of days.
  Time days() => Rational.fromInt(this).days();

  /// Gets a [Time] representing this number of weeks.
  Time weeks() => Rational.fromInt(this).weeks();

  /// Gets a [Time] representing this number of fortnights.
  Time fortnights() => Rational.fromInt(this).fortnights();

  /// Gets a [Time] representing this number of months.
  Time months() => Rational.fromInt(this).months();

  /// Gets a [Time] representing this number of quarters.
  Time quarters() => Rational.fromInt(this).quarters();

  /// Gets a [Time] representing this number of years.
  Time years() => Rational.fromInt(this).years();

  /// Gets a [Time] representing this number of decades.
  Time decades() => Rational.fromInt(this).decades();

  /// Gets a [Time] representing this number of centuries.
  Time centuries() => Rational.fromInt(this).centuries();

  /// Gets a [Volume] representing this number of cubic nanometers.
  Volume cubicNanometers() => Rational.fromInt(this).cubicNanometers();

  /// Gets a [Volume] representing this number of cubic thous.
  Volume cubicThous() => Rational.fromInt(this).cubicThous();

  /// Gets a [Volume] representing this number of cubic micrometers.
  Volume cubicMicrometers() => Rational.fromInt(this).cubicMicrometers();

  /// Gets a [Volume] representing this number of cubic millimeters.
  Volume cubicMillimeters() => Rational.fromInt(this).cubicMillimeters();

  /// Gets a [Volume] representing this number of milliliters.
  Volume milliliters() => Rational.fromInt(this).milliliters();

  /// Gets a [Volume] representing this number of imperial teaspoons.
  Volume imperialTeaspoons() => Rational.fromInt(this).imperialTeaspoons();

  /// Gets a [Volume] representing this number of US teaspoons.
  Volume usTeaspoons() => Rational.fromInt(this).usTeaspoons();

  /// Gets a [Volume] representing this number of US legal cups.
  Volume usLegalCups() => Rational.fromInt(this).usLegalCups();

  /// Gets a [Volume] representing this number of US fluid ounces.
  Volume usFluidOunces() => Rational.fromInt(this).usFluidOunces();

  /// Gets a [Volume] representing this number of imperial fluid ounces.
  Volume imperialFluidOunces() => Rational.fromInt(this).imperialFluidOunces();

  /// Gets a [Volume] representing this number of imperial tablespoons.
  Volume imperialTablespoons() => Rational.fromInt(this).imperialTablespoons();

  /// Gets a [Volume] representing this number of cubic inches.
  Volume cubicInches() => Rational.fromInt(this).cubicInches();

  /// Gets a [Volume] representing this number of US tablespoons.
  Volume usTablespoons() => Rational.fromInt(this).usTablespoons();

  /// Gets a [Volume] representing this number of liters.
  Volume liters() => Rational.fromInt(this).liters();

  /// Gets a [Volume] representing this number of US liquid quarts.
  Volume usLiquidQuarts() => Rational.fromInt(this).usLiquidQuarts();

  /// Gets a [Volume] representing this number of US customary cups.
  Volume usCustomaryCups() => Rational.fromInt(this).usCustomaryCups();

  /// Gets a [Volume] representing this number of imperial pints.
  Volume imperialPints() => Rational.fromInt(this).imperialPints();

  /// Gets a [Volume] representing this number of US liquid pints.
  Volume usLiquidPints() => Rational.fromInt(this).usLiquidPints();

  /// Gets a [Volume] representing this number of imperial cups.
  Volume imperialCups() => Rational.fromInt(this).imperialCups();

  /// Gets a [Volume] representing this number of imperial gallons.
  Volume imperialGallons() => Rational.fromInt(this).imperialGallons();

  /// Gets a [Volume] representing this number of US liquid gallons.
  Volume usLiquidGallons() => Rational.fromInt(this).usLiquidGallons();

  /// Gets a [Volume] representing this number of imperial quarts.
  Volume imperialQuarts() => Rational.fromInt(this).imperialQuarts();

  /// Gets a [Volume] representing this number of cubic feet.
  Volume cubicFeet() => Rational.fromInt(this).cubicFeet();

  /// Gets a [Volume] representing this number of cubic meters.
  Volume cubicMeters() => Rational.fromInt(this).cubicMeters();

  /// Gets a [Volume] representing this number of cubic yards.
  Volume cubicYards() => Rational.fromInt(this).cubicYards();

  /// Gets a [Volume] representing this number of cubic decameters.
  Volume cubicDecameters() => Rational.fromInt(this).cubicDecameters();

  /// Gets a [Volume] representing this number of cubic kilometers.
  Volume cubicKilometers() => Rational.fromInt(this).cubicKilometers();

  /// Gets a [Volume] representing this number of cubic miles.
  Volume cubicMiles() => Rational.fromInt(this).cubicMiles();

  /// Gets a [Volume] representing this number of cubic megameters.
  Volume cubicMegameters() => Rational.fromInt(this).cubicMegameters();

  /// Gets a [Volume] representing this number of cubic gigameters.
  Volume cubicGigameters() => Rational.fromInt(this).cubicGigameters();

  /// Gets a [Weight] representing this number of nanograms.
  Weight nanograms() => Rational.fromInt(this).nanograms();

  /// Gets a [Weight] representing this number of micrograms.
  Weight micrograms() => Rational.fromInt(this).micrograms();

  /// Gets a [Weight] representing this number of milligrams.
  Weight milligrams() => Rational.fromInt(this).milligrams();

  /// Gets a [Weight] representing this number of grams.
  Weight grams() => Rational.fromInt(this).grams();

  /// Gets a [Weight] representing this number of ounces.
  Weight ounces() => Rational.fromInt(this).ounces();

  /// Gets a [Weight] representing this number of pounds.
  Weight pounds() => Rational.fromInt(this).pounds();

  /// Gets a [Weight] representing this number of kilograms.
  Weight kilograms() => Rational.fromInt(this).kilograms();

  /// Gets a [Weight] representing this number of US tons.
  Weight usTons() => Rational.fromInt(this).usTons();

  /// Gets a [Weight] representing this number of (metric) tonnes.
  Weight tonnes() => Rational.fromInt(this).tonnes();

  /// Gets a [Weight] representing this number of imperial tons.
  Weight imperialTons() => Rational.fromInt(this).imperialTons();

  /// Gets a [Weight] representing this number of megatonnes.
  Weight megatonnes() => Rational.fromInt(this).megatonnes();

  /// Gets a [Weight] representing this number of gigatonnes.
  Weight gigatonnes() => Rational.fromInt(this).gigatonnes();
}

/// Provides extensions on [Quantity] related to units of measurement.
extension UnitsOfMeasurementQuantityExtensions on Quantity {
  /// Gets an [Area] representing this number of square nanometers.
  Area squareNanometers() => ones.squareNanometers();

  /// Gets an [Area] representing this number of square micrometers.
  Area squareMicrometers() => ones.squareMicrometers();

  /// Gets an [Area] representing this number of square thous.
  Area squareThous() => ones.squareThous();

  /// Gets an [Area] representing this number of square millimeters.
  Area squareMillimeters() => ones.squareMillimeters();

  /// Gets an [Area] representing this number of square centimeters.
  Area squareCentimeters() => ones.squareCentimeters();

  /// Gets an [Area] representing this number of square inches.
  Area squareInches() => ones.squareInches();

  /// Gets an [Area] representing this number of square decimeters.
  Area squareDecimeters() => ones.squareDecimeters();

  /// Gets an [Area] representing this number of square feet.
  Area squareFeet() => ones.squareFeet();

  /// Gets an [Area] representing this number of square yards.
  Area squareYards() => ones.squareYards();

  /// Gets an [Area] representing this number of square meters.
  Area squareMeters() => ones.squareMeters();

  /// Gets an [Area] representing this number of square decameters.
  Area squareDecameters() => ones.squareDecameters();

  /// Gets an [Area] representing this number of acres.
  Area acres() => ones.acres();

  /// Gets an [Area] representing this number of hectares.
  Area hectares() => ones.hectares();

  /// Gets an [Area] representing this number of square kilometers.
  Area squareKilometers() => ones.squareKilometers();

  /// Gets an [Area] representing this number of square miles.
  Area squareMiles() => ones.squareMiles();

  /// Gets an [Area] representing this number of square megameters.
  Area squareMegameters() => ones.squareMegameters();

  /// Gets an [Area] representing this number of square gigameters.
  Area squareGigameters() => ones.squareGigameters();

  /// Gets an [InformationSize] representing this number of bits.
  InformationSize bits() => ones.bits();

  /// Gets an [InformationSize] representing this number of crumbs.
  InformationSize crumbs() => ones.crumbs();

  /// Gets an [InformationSize] representing this number of nibbles.
  InformationSize nibbles() => ones.nibbles();

  /// Gets an [InformationSize] representing this number of bytes.
  InformationSize bytes() => ones.bytes();

  /// Gets an [InformationSize] representing this number of kilobits.
  InformationSize kilobits() => ones.kilobits();

  /// Gets an [InformationSize] representing this number of kibibits.
  InformationSize kibibits() => ones.kibibits();

  /// Gets an [InformationSize] representing this number of kilobytes.
  InformationSize kilobytes() => ones.kilobytes();

  /// Gets an [InformationSize] representing this number of kibibytes.
  InformationSize kibibytes() => ones.kibibytes();

  /// Gets an [InformationSize] representing this number of megabits.
  InformationSize megabits() => ones.megabits();

  /// Gets an [InformationSize] representing this number of mebibits.
  InformationSize mebibits() => ones.mebibits();

  /// Gets an [InformationSize] representing this number of megabytes.
  InformationSize megabytes() => ones.megabytes();

  /// Gets an [InformationSize] representing this number of mebibytes.
  InformationSize mebibytes() => ones.mebibytes();

  /// Gets an [InformationSize] representing this number of gigabits.
  InformationSize gigabits() => ones.gigabits();

  /// Gets an [InformationSize] representing this number of gibibits.
  InformationSize gibibits() => ones.gibibits();

  /// Gets an [InformationSize] representing this number of gigabytes.
  InformationSize gigabytes() => ones.gigabytes();

  /// Gets an [InformationSize] representing this number of gibibytes.
  InformationSize gibibytes() => ones.gibibytes();

  /// Gets an [InformationSize] representing this number of terabits.
  InformationSize terabits() => ones.terabits();

  /// Gets an [InformationSize] representing this number of tebibits.
  InformationSize tebibits() => ones.tebibits();

  /// Gets an [InformationSize] representing this number of terabytes.
  InformationSize terabytes() => ones.terabytes();

  /// Gets an [InformationSize] representing this number of tebibytes.
  InformationSize tebibytes() => ones.tebibytes();

  /// Gets an [InformationSize] representing this number of petabits.
  InformationSize petabits() => ones.petabits();

  /// Gets an [InformationSize] representing this number of pebibits.
  InformationSize pebibits() => ones.pebibits();

  /// Gets an [InformationSize] representing this number of petabytes.
  InformationSize petabytes() => ones.petabytes();

  /// Gets an [InformationSize] representing this number of pebibytes.
  InformationSize pebibytes() => ones.pebibytes();

  /// Gets an [InformationSize] representing this number of exabits.
  InformationSize exabits() => ones.exabits();

  /// Gets an [InformationSize] representing this number of exbibits.
  InformationSize exbibits() => ones.exbibits();

  /// Gets an [InformationSize] representing this number of exabytes.
  InformationSize exabytes() => ones.exabytes();

  /// Gets an [InformationSize] representing this number of exbibytes.
  InformationSize exbibytes() => ones.exbibytes();

  /// Gets an [InformationSize] representing this number of zettabits.
  InformationSize zettabits() => ones.zettabits();

  /// Gets an [InformationSize] representing this number of zebibits.
  InformationSize zebibits() => ones.zebibits();

  /// Gets an [InformationSize] representing this number of zettabytes.
  InformationSize zettabytes() => ones.zettabytes();

  /// Gets an [InformationSize] representing this number of zebibytes.
  InformationSize zebibytes() => ones.zebibytes();

  /// Gets an [InformationSize] representing this number of yottabits.
  InformationSize yottabits() => ones.yottabits();

  /// Gets an [InformationSize] representing this number of yobibits.
  InformationSize yobibits() => ones.yobibits();

  /// Gets an [InformationSize] representing this number of yottabytes.
  InformationSize yottabytes() => ones.yottabytes();

  /// Gets an [InformationSize] representing this number of yobibytes.
  InformationSize yobibytes() => ones.yobibytes();

  /// Gets a [Length] representing this number of nanometers.
  Length nanometers() => ones.nanometers();

  /// Gets a [Length] representing this number of micrometers.
  Length micrometers() => ones.micrometers();

  /// Gets a [Length] representing this number of thous.
  Length thous() => ones.thous();

  /// Gets a [Length] representing this number of millimeters.
  Length millimeters() => ones.millimeters();

  /// Gets a [Length] representing this number of centimeters.
  Length centimeters() => ones.centimeters();

  /// Gets a [Length] representing this number of inches.
  Length inches() => ones.inches();

  /// Gets a [Length] representing this number of decimeters.
  Length decimeters() => ones.decimeters();

  /// Gets a [Length] representing this number of feet.
  Length feet() => ones.feet();

  /// Gets a [Length] representing this number of yards.
  Length yards() => ones.yards();

  /// Gets a [Length] representing this number of meters.
  Length meters() => ones.meters();

  /// Gets a [Length] representing this number of decameters.
  Length decameters() => ones.decameters();

  /// Gets a [Length] representing this number of hectometers.
  Length hectometers() => ones.hectometers();

  /// Gets a [Length] representing this number of kilometers.
  Length kilometers() => ones.kilometers();

  /// Gets a [Length] representing this number of miles.
  Length miles() => ones.miles();

  /// Gets a [Length] representing this number of megameters.
  Length megameters() => ones.megameters();

  /// Gets a [Length] representing this number of gigameters.
  Length gigameters() => ones.gigameters();

  /// Gets a [Temperature] representing this number of nanokelvins.
  Temperature nanokelvins() => ones.nanokelvins();

  /// Gets a [Temperature] representing this number of microkelvins.
  Temperature microkelvins() => ones.microkelvins();

  /// Gets a [Temperature] representing this number of millikelvins.
  Temperature millikelvins() => ones.millikelvins();

  /// Gets a [Temperature] representing this number of centikelvins.
  Temperature centikelvins() => ones.centikelvins();

  /// Gets a [Temperature] representing this number of decikelvins.
  Temperature decikelvins() => ones.decikelvins();

  /// Gets a [Temperature] representing this number of kelvins.
  Temperature kelvins() => ones.kelvins();

  /// Gets a [Temperature] representing this number of celsius.
  Temperature celsius() => ones.celsius();

  /// Gets a [Temperature] representing this number of fahrenheit.
  Temperature fahrenheit() => ones.fahrenheit();

  /// Gets a [Time] representing this number of nanoseconds.
  Time nanoseconds() => ones.nanoseconds();

  /// Gets a [Time] representing this number of microseconds.
  Time microseconds() => ones.microseconds();

  /// Gets a [Time] representing this number of milliseconds.
  Time milliseconds() => ones.milliseconds();

  /// Gets a [Time] representing this number of centiseconds.
  Time centiseconds() => ones.centiseconds();

  /// Gets a [Time] representing this number of deciseconds.
  Time deciseconds() => ones.deciseconds();

  /// Gets a [Time] representing this number of seconds.
  Time seconds() => ones.seconds();

  /// Gets a [Time] representing this number of decaseconds.
  Time decaseconds() => ones.decaseconds();

  /// Gets a [Time] representing this number of minutes.
  Time minutes() => ones.minutes();

  /// Gets a [Time] representing this number of hours.
  Time hours() => ones.hours();

  /// Gets a [Time] representing this number of days.
  Time days() => ones.days();

  /// Gets a [Time] representing this number of weeks.
  Time weeks() => ones.weeks();

  /// Gets a [Time] representing this number of fortnights.
  Time fortnights() => ones.fortnights();

  /// Gets a [Time] representing this number of months.
  Time months() => ones.months();

  /// Gets a [Time] representing this number of quarters.
  Time quarters() => ones.quarters();

  /// Gets a [Time] representing this number of years.
  Time years() => ones.years();

  /// Gets a [Time] representing this number of decades.
  Time decades() => ones.decades();

  /// Gets a [Time] representing this number of centuries.
  Time centuries() => ones.centuries();

  /// Gets a [Volume] representing this number of cubic nanometers.
  Volume cubicNanometers() => ones.cubicNanometers();

  /// Gets a [Volume] representing this number of cubic thous.
  Volume cubicThous() => ones.cubicThous();

  /// Gets a [Volume] representing this number of cubic micrometers.
  Volume cubicMicrometers() => ones.cubicMicrometers();

  /// Gets a [Volume] representing this number of cubic millimeters.
  Volume cubicMillimeters() => ones.cubicMillimeters();

  /// Gets a [Volume] representing this number of milliliters.
  Volume milliliters() => ones.milliliters();

  /// Gets a [Volume] representing this number of imperial teaspoons.
  Volume imperialTeaspoons() => ones.imperialTeaspoons();

  /// Gets a [Volume] representing this number of US teaspoons.
  Volume usTeaspoons() => ones.usTeaspoons();

  /// Gets a [Volume] representing this number of US legal cups.
  Volume usLegalCups() => ones.usLegalCups();

  /// Gets a [Volume] representing this number of US fluid ounces.
  Volume usFluidOunces() => ones.usFluidOunces();

  /// Gets a [Volume] representing this number of imperial fluid ounces.
  Volume imperialFluidOunces() => ones.imperialFluidOunces();

  /// Gets a [Volume] representing this number of imperial tablespoons.
  Volume imperialTablespoons() => ones.imperialTablespoons();

  /// Gets a [Volume] representing this number of cubic inches.
  Volume cubicInches() => ones.cubicInches();

  /// Gets a [Volume] representing this number of US tablespoons.
  Volume usTablespoons() => ones.usTablespoons();

  /// Gets a [Volume] representing this number of liters.
  Volume liters() => ones.liters();

  /// Gets a [Volume] representing this number of US liquid quarts.
  Volume usLiquidQuarts() => ones.usLiquidQuarts();

  /// Gets a [Volume] representing this number of US customary cups.
  Volume usCustomaryCups() => ones.usCustomaryCups();

  /// Gets a [Volume] representing this number of imperial pints.
  Volume imperialPints() => ones.imperialPints();

  /// Gets a [Volume] representing this number of US liquid pints.
  Volume usLiquidPints() => ones.usLiquidPints();

  /// Gets a [Volume] representing this number of imperial cups.
  Volume imperialCups() => ones.imperialCups();

  /// Gets a [Volume] representing this number of imperial gallons.
  Volume imperialGallons() => ones.imperialGallons();

  /// Gets a [Volume] representing this number of US liquid gallons.
  Volume usLiquidGallons() => ones.usLiquidGallons();

  /// Gets a [Volume] representing this number of imperial quarts.
  Volume imperialQuarts() => ones.imperialQuarts();

  /// Gets a [Volume] representing this number of cubic feet.
  Volume cubicFeet() => ones.cubicFeet();

  /// Gets a [Volume] representing this number of cubic meters.
  Volume cubicMeters() => ones.cubicMeters();

  /// Gets a [Volume] representing this number of cubic yards.
  Volume cubicYards() => ones.cubicYards();

  /// Gets a [Volume] representing this number of cubic decameters.
  Volume cubicDecameters() => ones.cubicDecameters();

  /// Gets a [Volume] representing this number of cubic kilometers.
  Volume cubicKilometers() => ones.cubicKilometers();

  /// Gets a [Volume] representing this number of cubic miles.
  Volume cubicMiles() => ones.cubicMiles();

  /// Gets a [Volume] representing this number of cubic megameters.
  Volume cubicMegameters() => ones.cubicMegameters();

  /// Gets a [Volume] representing this number of cubic gigameters.
  Volume cubicGigameters() => ones.cubicGigameters();

  /// Gets a [Weight] representing this number of nanograms.
  Weight nanograms() => ones.nanograms();

  /// Gets a [Weight] representing this number of micrograms.
  Weight micrograms() => ones.micrograms();

  /// Gets a [Weight] representing this number of milligrams.
  Weight milligrams() => ones.milligrams();

  /// Gets a [Weight] representing this number of grams.
  Weight grams() => ones.grams();

  /// Gets a [Weight] representing this number of ounces.
  Weight ounces() => ones.ounces();

  /// Gets a [Weight] representing this number of pounds.
  Weight pounds() => ones.pounds();

  /// Gets a [Weight] representing this number of kilograms.
  Weight kilograms() => ones.kilograms();

  /// Gets a [Weight] representing this number of US tons.
  Weight usTons() => ones.usTons();

  /// Gets a [Weight] representing this number of (metric) tonnes.
  Weight tonnes() => ones.tonnes();

  /// Gets a [Weight] representing this number of imperial tons.
  Weight imperialTons() => ones.imperialTons();

  /// Gets a [Weight] representing this number of megatonnes.
  Weight megatonnes() => ones.megatonnes();

  /// Gets a [Weight] representing this number of gigatonnes.
  Weight gigatonnes() => ones.gigatonnes();
}

/// Provides extensions on [Rational] related to units of measurement.
extension UnitsOfMeasurementRationalExtensions on Rational {
  /// Gets an [Area] representing this number of square nanometers.
  Area squareNanometers() => Area.fromSquareNanometers(this);

  /// Gets an [Area] representing this number of square micrometers.
  Area squareMicrometers() => Area.fromSquareMicrometers(this);

  /// Gets an [Area] representing this number of square thous.
  Area squareThous() => Area.fromSquareThous(this);

  /// Gets an [Area] representing this number of square millimeters.
  Area squareMillimeters() => Area.fromSquareMillimeters(this);

  /// Gets an [Area] representing this number of square centimeters.
  Area squareCentimeters() => Area.fromSquareCentimeters(this);

  /// Gets an [Area] representing this number of square inches.
  Area squareInches() => Area.fromSquareInches(this);

  /// Gets an [Area] representing this number of square decimeters.
  Area squareDecimeters() => Area.fromSquareDecimeters(this);

  /// Gets an [Area] representing this number of square feet.
  Area squareFeet() => Area.fromSquareFeet(this);

  /// Gets an [Area] representing this number of square yards.
  Area squareYards() => Area.fromSquareYards(this);

  /// Gets an [Area] representing this number of square meters.
  Area squareMeters() => Area.fromSquareMeters(this);

  /// Gets an [Area] representing this number of square decameters.
  Area squareDecameters() => Area.fromSquareDecameters(this);

  /// Gets an [Area] representing this number of acres.
  Area acres() => Area.fromAcres(this);

  /// Gets an [Area] representing this number of hectares.
  Area hectares() => Area.fromHectares(this);

  /// Gets an [Area] representing this number of square kilometers.
  Area squareKilometers() => Area.fromSquareKilometers(this);

  /// Gets an [Area] representing this number of square miles.
  Area squareMiles() => Area.fromSquareMiles(this);

  /// Gets an [Area] representing this number of square megameters.
  Area squareMegameters() => Area.fromSquareMegameters(this);

  /// Gets an [Area] representing this number of square gigameters.
  Area squareGigameters() => Area.fromSquareGigameters(this);

  /// Gets an [InformationSize] representing this number of bits.
  InformationSize bits() => InformationSize.fromBits(this);

  /// Gets an [InformationSize] representing this number of crumbs.
  InformationSize crumbs() => InformationSize.fromCrumbs(this);

  /// Gets an [InformationSize] representing this number of nibbles.
  InformationSize nibbles() => InformationSize.fromNibbles(this);

  /// Gets an [InformationSize] representing this number of bytes.
  InformationSize bytes() => InformationSize.fromBytes(this);

  /// Gets an [InformationSize] representing this number of kilobits.
  InformationSize kilobits() => InformationSize.fromKilobits(this);

  /// Gets an [InformationSize] representing this number of kibibits.
  InformationSize kibibits() => InformationSize.fromKibibits(this);

  /// Gets an [InformationSize] representing this number of kilobytes.
  InformationSize kilobytes() => InformationSize.fromKilobytes(this);

  /// Gets an [InformationSize] representing this number of kibibytes.
  InformationSize kibibytes() => InformationSize.fromKibibytes(this);

  /// Gets an [InformationSize] representing this number of megabits.
  InformationSize megabits() => InformationSize.fromMegabits(this);

  /// Gets an [InformationSize] representing this number of mebibits.
  InformationSize mebibits() => InformationSize.fromMebibits(this);

  /// Gets an [InformationSize] representing this number of megabytes.
  InformationSize megabytes() => InformationSize.fromMegabytes(this);

  /// Gets an [InformationSize] representing this number of mebibytes.
  InformationSize mebibytes() => InformationSize.fromMebibytes(this);

  /// Gets an [InformationSize] representing this number of gigabits.
  InformationSize gigabits() => InformationSize.fromGigabits(this);

  /// Gets an [InformationSize] representing this number of gibibits.
  InformationSize gibibits() => InformationSize.fromGibibits(this);

  /// Gets an [InformationSize] representing this number of gigabytes.
  InformationSize gigabytes() => InformationSize.fromGigabytes(this);

  /// Gets an [InformationSize] representing this number of gibibytes.
  InformationSize gibibytes() => InformationSize.fromGibibytes(this);

  /// Gets an [InformationSize] representing this number of terabits.
  InformationSize terabits() => InformationSize.fromTerabits(this);

  /// Gets an [InformationSize] representing this number of tebibits.
  InformationSize tebibits() => InformationSize.fromTebibits(this);

  /// Gets an [InformationSize] representing this number of terabytes.
  InformationSize terabytes() => InformationSize.fromTerabytes(this);

  /// Gets an [InformationSize] representing this number of tebibytes.
  InformationSize tebibytes() => InformationSize.fromTebibytes(this);

  /// Gets an [InformationSize] representing this number of petabits.
  InformationSize petabits() => InformationSize.fromPetabits(this);

  /// Gets an [InformationSize] representing this number of pebibits.
  InformationSize pebibits() => InformationSize.fromPebibits(this);

  /// Gets an [InformationSize] representing this number of petabytes.
  InformationSize petabytes() => InformationSize.fromPetabytes(this);

  /// Gets an [InformationSize] representing this number of pebibytes.
  InformationSize pebibytes() => InformationSize.fromPebibytes(this);

  /// Gets an [InformationSize] representing this number of exabits.
  InformationSize exabits() => InformationSize.fromExabits(this);

  /// Gets an [InformationSize] representing this number of exbibits.
  InformationSize exbibits() => InformationSize.fromExbibits(this);

  /// Gets an [InformationSize] representing this number of exabytes.
  InformationSize exabytes() => InformationSize.fromExabytes(this);

  /// Gets an [InformationSize] representing this number of exbibytes.
  InformationSize exbibytes() => InformationSize.fromExbibytes(this);

  /// Gets an [InformationSize] representing this number of zettabits.
  InformationSize zettabits() => InformationSize.fromZettabits(this);

  /// Gets an [InformationSize] representing this number of zebibits.
  InformationSize zebibits() => InformationSize.fromZebibits(this);

  /// Gets an [InformationSize] representing this number of zettabytes.
  InformationSize zettabytes() => InformationSize.fromZettabytes(this);

  /// Gets an [InformationSize] representing this number of zebibytes.
  InformationSize zebibytes() => InformationSize.fromZebibytes(this);

  /// Gets an [InformationSize] representing this number of yottabits.
  InformationSize yottabits() => InformationSize.fromYottabits(this);

  /// Gets an [InformationSize] representing this number of yobibits.
  InformationSize yobibits() => InformationSize.fromYobibits(this);

  /// Gets an [InformationSize] representing this number of yottabytes.
  InformationSize yottabytes() => InformationSize.fromYottabytes(this);

  /// Gets an [InformationSize] representing this number of yobibytes.
  InformationSize yobibytes() => InformationSize.fromYobibytes(this);

  /// Gets a [Length] representing this number of nanometers.
  Length nanometers() => Length.fromNanometers(this);

  /// Gets a [Length] representing this number of micrometers.
  Length micrometers() => Length.fromMicrometers(this);

  /// Gets a [Length] representing this number of thous.
  Length thous() => Length.fromThous(this);

  /// Gets a [Length] representing this number of millimeters.
  Length millimeters() => Length.fromMillimeters(this);

  /// Gets a [Length] representing this number of centimeters.
  Length centimeters() => Length.fromCentimeters(this);

  /// Gets a [Length] representing this number of inches.
  Length inches() => Length.fromInches(this);

  /// Gets a [Length] representing this number of decimeters.
  Length decimeters() => Length.fromDecimeters(this);

  /// Gets a [Length] representing this number of feet.
  Length feet() => Length.fromFeet(this);

  /// Gets a [Length] representing this number of yards.
  Length yards() => Length.fromYards(this);

  /// Gets a [Length] representing this number of meters.
  Length meters() => Length.fromMeters(this);

  /// Gets a [Length] representing this number of decameters.
  Length decameters() => Length.fromDecameters(this);

  /// Gets a [Length] representing this number of hectometers.
  Length hectometers() => Length.fromHectometers(this);

  /// Gets a [Length] representing this number of kilometers.
  Length kilometers() => Length.fromKilometers(this);

  /// Gets a [Length] representing this number of miles.
  Length miles() => Length.fromMiles(this);

  /// Gets a [Length] representing this number of megameters.
  Length megameters() => Length.fromMegameters(this);

  /// Gets a [Length] representing this number of gigameters.
  Length gigameters() => Length.fromGigameters(this);

  /// Gets a [Quantity] representing this number of ones.
  Quantity ones() => Quantity.fromOnes(this);

  /// Gets a [Quantity] representing this number of thousands.
  Quantity thousand() => Quantity.fromThousands(this);

  /// Gets a [Quantity] representing this number of millions.
  Quantity million() => Quantity.fromMillions(this);

  /// Gets a [Quantity] representing this number of billions.
  Quantity billion() => Quantity.fromBillions(this);

  /// Gets a [Quantity] representing this number of trillions.
  Quantity trillion() => Quantity.fromTrillions(this);

  /// Gets a [Temperature] representing this number of nanokelvins.
  Temperature nanokelvins() => Temperature.fromNanokelvins(this);

  /// Gets a [Temperature] representing this number of microkelvins.
  Temperature microkelvins() => Temperature.fromMicrokelvins(this);

  /// Gets a [Temperature] representing this number of millikelvins.
  Temperature millikelvins() => Temperature.fromMillikelvins(this);

  /// Gets a [Temperature] representing this number of centikelvins.
  Temperature centikelvins() => Temperature.fromCentikelvins(this);

  /// Gets a [Temperature] representing this number of decikelvins.
  Temperature decikelvins() => Temperature.fromDecikelvins(this);

  /// Gets a [Temperature] representing this number of kelvins.
  Temperature kelvins() => Temperature.fromKelvins(this);

  /// Gets a [Temperature] representing this number of celsius.
  Temperature celsius() => Temperature.fromCelsius(this);

  /// Gets a [Temperature] representing this number of fahrenheit.
  Temperature fahrenheit() => Temperature.fromFahrenheit(this);

  /// Gets a [Time] representing this number of nanoseconds.
  Time nanoseconds() => Time.fromNanoseconds(this);

  /// Gets a [Time] representing this number of microseconds.
  Time microseconds() => Time.fromMicroseconds(this);

  /// Gets a [Time] representing this number of milliseconds.
  Time milliseconds() => Time.fromMilliseconds(this);

  /// Gets a [Time] representing this number of centiseconds.
  Time centiseconds() => Time.fromCentiseconds(this);

  /// Gets a [Time] representing this number of deciseconds.
  Time deciseconds() => Time.fromDeciseconds(this);

  /// Gets a [Time] representing this number of seconds.
  Time seconds() => Time.fromSeconds(this);

  /// Gets a [Time] representing this number of decaseconds.
  Time decaseconds() => Time.fromDecaseconds(this);

  /// Gets a [Time] representing this number of minutes.
  Time minutes() => Time.fromMinutes(this);

  /// Gets a [Time] representing this number of hours.
  Time hours() => Time.fromHours(this);

  /// Gets a [Time] representing this number of days.
  Time days() => Time.fromDays(this);

  /// Gets a [Time] representing this number of weeks.
  Time weeks() => Time.fromWeeks(this);

  /// Gets a [Time] representing this number of fortnights.
  Time fortnights() => Time.fromFortnights(this);

  /// Gets a [Time] representing this number of months.
  Time months() => Time.fromMonths(this);

  /// Gets a [Time] representing this number of quarters.
  Time quarters() => Time.fromQuarters(this);

  /// Gets a [Time] representing this number of years.
  Time years() => Time.fromYears(this);

  /// Gets a [Time] representing this number of decades.
  Time decades() => Time.fromDecades(this);

  /// Gets a [Time] representing this number of centuries.
  Time centuries() => Time.fromCenturies(this);

  /// Gets a [Volume] representing this number of cubic nanometers.
  Volume cubicNanometers() => Volume.fromCubicNanometers(this);

  /// Gets a [Volume] representing this number of cubic thous.
  Volume cubicThous() => Volume.fromCubicThous(this);

  /// Gets a [Volume] representing this number of cubic micrometers.
  Volume cubicMicrometers() => Volume.fromCubicMicrometers(this);

  /// Gets a [Volume] representing this number of cubic millimeters.
  Volume cubicMillimeters() => Volume.fromCubicMillimeters(this);

  /// Gets a [Volume] representing this number of milliliters.
  Volume milliliters() => Volume.fromMilliliters(this);

  /// Gets a [Volume] representing this number of imperial teaspoons.
  Volume imperialTeaspoons() => Volume.fromImperialTeaspoons(this);

  /// Gets a [Volume] representing this number of US teaspoons.
  Volume usTeaspoons() => Volume.fromUsTeaspoons(this);

  /// Gets a [Volume] representing this number of US legal cups.
  Volume usLegalCups() => Volume.fromUsLegalCups(this);

  /// Gets a [Volume] representing this number of US fluid ounces.
  Volume usFluidOunces() => Volume.fromUsFluidOunces(this);

  /// Gets a [Volume] representing this number of imperial fluid ounces.
  Volume imperialFluidOunces() => Volume.fromImperialFluidOunces(this);

  /// Gets a [Volume] representing this number of imperial tablespoons.
  Volume imperialTablespoons() => Volume.fromImperialTablespoons(this);

  /// Gets a [Volume] representing this number of cubic inches.
  Volume cubicInches() => Volume.fromCubicInches(this);

  /// Gets a [Volume] representing this number of US tablespoons.
  Volume usTablespoons() => Volume.fromUsTablespoons(this);

  /// Gets a [Volume] representing this number of liters.
  Volume liters() => Volume.fromLiters(this);

  /// Gets a [Volume] representing this number of US liquid quarts.
  Volume usLiquidQuarts() => Volume.fromUsLiquidQuarts(this);

  /// Gets a [Volume] representing this number of US customary cups.
  Volume usCustomaryCups() => Volume.fromUsCustomaryCups(this);

  /// Gets a [Volume] representing this number of imperial pints.
  Volume imperialPints() => Volume.fromImperialPints(this);

  /// Gets a [Volume] representing this number of US liquid pints.
  Volume usLiquidPints() => Volume.fromUsLiquidPints(this);

  /// Gets a [Volume] representing this number of imperial cups.
  Volume imperialCups() => Volume.fromImperialCups(this);

  /// Gets a [Volume] representing this number of imperial gallons.
  Volume imperialGallons() => Volume.fromImperialGallons(this);

  /// Gets a [Volume] representing this number of US liquid gallons.
  Volume usLiquidGallons() => Volume.fromUsLiquidGallons(this);

  /// Gets a [Volume] representing this number of imperial quarts.
  Volume imperialQuarts() => Volume.fromImperialQuarts(this);

  /// Gets a [Volume] representing this number of cubic feet.
  Volume cubicFeet() => Volume.fromCubicFeet(this);

  /// Gets a [Volume] representing this number of cubic meters.
  Volume cubicMeters() => Volume.fromCubicMeters(this);

  /// Gets a [Volume] representing this number of cubic yards.
  Volume cubicYards() => Volume.fromCubicYards(this);

  /// Gets a [Volume] representing this number of cubic decameters.
  Volume cubicDecameters() => Volume.fromCubicDecameters(this);

  /// Gets a [Volume] representing this number of cubic kilometers.
  Volume cubicKilometers() => Volume.fromCubicKilometers(this);

  /// Gets a [Volume] representing this number of cubic miles.
  Volume cubicMiles() => Volume.fromCubicMiles(this);

  /// Gets a [Volume] representing this number of cubic megameters.
  Volume cubicMegameters() => Volume.fromCubicMegameters(this);

  /// Gets a [Volume] representing this number of cubic gigameters.
  Volume cubicGigameters() => Volume.fromCubicGigameters(this);

  /// Gets a [Weight] representing this number of nanograms.
  Weight nanograms() => Weight.fromNanograms(this);

  /// Gets a [Weight] representing this number of micrograms.
  Weight micrograms() => Weight.fromMicrograms(this);

  /// Gets a [Weight] representing this number of milligrams.
  Weight milligrams() => Weight.fromMilligrams(this);

  /// Gets a [Weight] representing this number of grams.
  Weight grams() => Weight.fromGrams(this);

  /// Gets a [Weight] representing this number of ounces.
  Weight ounces() => Weight.fromOunces(this);

  /// Gets a [Weight] representing this number of pounds.
  Weight pounds() => Weight.fromPounds(this);

  /// Gets a [Weight] representing this number of kilograms.
  Weight kilograms() => Weight.fromKilograms(this);

  /// Gets a [Weight] representing this number of usTons.
  Weight usTons() => Weight.fromUsTons(this);

  /// Gets a [Weight] representing this number of tonnes.
  Weight tonnes() => Weight.fromTonnes(this);

  /// Gets a [Weight] representing this number of imperialTons.
  Weight imperialTons() => Weight.fromImperialTons(this);

  /// Gets a [Weight] representing this number of megatonnes.
  Weight megatonnes() => Weight.fromMegatonnes(this);

  /// Gets a [Weight] representing this number of gigatonnes.
  Weight gigatonnes() => Weight.fromGigatonnes(this);
}
