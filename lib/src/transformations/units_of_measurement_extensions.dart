// ignore_for_file: use_to_and_as_if_applicable

import 'package:decimal/decimal.dart';
import 'package:humanizer/humanizer.dart';
import 'package:intl/intl.dart';

/// Provides extensions on [int] related to units of measurement.
extension UnitsOfMeasurementIntExtensions on int {
  /// Gets an [Area] representing this number of square nanometers.
  Area squareNanometers() => Decimal.fromInt(this).squareNanometers();

  /// Gets an [Area] representing this number of square micrometers.
  Area squareMicrometers() => Decimal.fromInt(this).squareMicrometers();

  /// Gets an [Area] representing this number of square thous.
  Area squareThous() => Decimal.fromInt(this).squareThous();

  /// Gets an [Area] representing this number of square millimeters.
  Area squareMillimeters() => Decimal.fromInt(this).squareMillimeters();

  /// Gets an [Area] representing this number of square centimeters.
  Area squareCentimeters() => Decimal.fromInt(this).squareCentimeters();

  /// Gets an [Area] representing this number of square inches.
  Area squareInches() => Decimal.fromInt(this).squareInches();

  /// Gets an [Area] representing this number of square decimeters.
  Area squareDecimeters() => Decimal.fromInt(this).squareDecimeters();

  /// Gets an [Area] representing this number of square feet.
  Area squareFeet() => Decimal.fromInt(this).squareFeet();

  /// Gets an [Area] representing this number of square yards.
  Area squareYards() => Decimal.fromInt(this).squareYards();

  /// Gets an [Area] representing this number of square meters.
  Area squareMeters() => Decimal.fromInt(this).squareMeters();

  /// Gets an [Area] representing this number of square decameters.
  Area squareDecameters() => Decimal.fromInt(this).squareDecameters();

  /// Gets an [Area] representing this number of acres.
  Area acres() => Decimal.fromInt(this).acres();

  /// Gets an [Area] representing this number of hectares.
  Area hectares() => Decimal.fromInt(this).hectares();

  /// Gets an [Area] representing this number of square kilometers.
  Area squareKilometers() => Decimal.fromInt(this).squareKilometers();

  /// Gets an [Area] representing this number of square miles.
  Area squareMiles() => Decimal.fromInt(this).squareMiles();

  /// Gets an [Area] representing this number of square megameters.
  Area squareMegameters() => Decimal.fromInt(this).squareMegameters();

  /// Gets an [Area] representing this number of square gigameters.
  Area squareGigameters() => Decimal.fromInt(this).squareGigameters();

  /// Gets an [InformationSize] representing this number of bits.
  InformationSize bits() => Decimal.fromInt(this).bits();

  /// Gets an [InformationSize] representing this number of crumbs.
  InformationSize crumbs() => Decimal.fromInt(this).crumbs();

  /// Gets an [InformationSize] representing this number of nibbles.
  InformationSize nibbles() => Decimal.fromInt(this).nibbles();

  /// Gets an [InformationSize] representing this number of bytes.
  InformationSize bytes() => Decimal.fromInt(this).bytes();

  /// Gets an [InformationSize] representing this number of kilobits.
  InformationSize kilobits() => Decimal.fromInt(this).kilobits();

  /// Gets an [InformationSize] representing this number of kibibits.
  InformationSize kibibits() => Decimal.fromInt(this).kibibits();

  /// Gets an [InformationSize] representing this number of kilobytes.
  InformationSize kilobytes() => Decimal.fromInt(this).kilobytes();

  /// Gets an [InformationSize] representing this number of kibibytes.
  InformationSize kibibytes() => Decimal.fromInt(this).kibibytes();

  /// Gets an [InformationSize] representing this number of megabits.
  InformationSize megabits() => Decimal.fromInt(this).megabits();

  /// Gets an [InformationSize] representing this number of mebibits.
  InformationSize mebibits() => Decimal.fromInt(this).mebibits();

  /// Gets an [InformationSize] representing this number of megabytes.
  InformationSize megabytes() => Decimal.fromInt(this).megabytes();

  /// Gets an [InformationSize] representing this number of mebibytes.
  InformationSize mebibytes() => Decimal.fromInt(this).mebibytes();

  /// Gets an [InformationSize] representing this number of gigabits.
  InformationSize gigabits() => Decimal.fromInt(this).gigabits();

  /// Gets an [InformationSize] representing this number of gibibits.
  InformationSize gibibits() => Decimal.fromInt(this).gibibits();

  /// Gets an [InformationSize] representing this number of gigabytes.
  InformationSize gigabytes() => Decimal.fromInt(this).gigabytes();

  /// Gets an [InformationSize] representing this number of gibibytes.
  InformationSize gibibytes() => Decimal.fromInt(this).gibibytes();

  /// Gets an [InformationSize] representing this number of terabits.
  InformationSize terabits() => Decimal.fromInt(this).terabits();

  /// Gets an [InformationSize] representing this number of tebibits.
  InformationSize tebibits() => Decimal.fromInt(this).tebibits();

  /// Gets an [InformationSize] representing this number of terabytes.
  InformationSize terabytes() => Decimal.fromInt(this).terabytes();

  /// Gets an [InformationSize] representing this number of tebibytes.
  InformationSize tebibytes() => Decimal.fromInt(this).tebibytes();

  /// Gets an [InformationSize] representing this number of petabits.
  InformationSize petabits() => Decimal.fromInt(this).petabits();

  /// Gets an [InformationSize] representing this number of pebibits.
  InformationSize pebibits() => Decimal.fromInt(this).pebibits();

  /// Gets an [InformationSize] representing this number of petabytes.
  InformationSize petabytes() => Decimal.fromInt(this).petabytes();

  /// Gets an [InformationSize] representing this number of pebibytes.
  InformationSize pebibytes() => Decimal.fromInt(this).pebibytes();

  /// Gets an [InformationSize] representing this number of exabits.
  InformationSize exabits() => Decimal.fromInt(this).exabits();

  /// Gets an [InformationSize] representing this number of exbibits.
  InformationSize exbibits() => Decimal.fromInt(this).exbibits();

  /// Gets an [InformationSize] representing this number of exabytes.
  InformationSize exabytes() => Decimal.fromInt(this).exabytes();

  /// Gets an [InformationSize] representing this number of exbibytes.
  InformationSize exbibytes() => Decimal.fromInt(this).exbibytes();

  /// Gets an [InformationSize] representing this number of zettabits.
  InformationSize zettabits() => Decimal.fromInt(this).zettabits();

  /// Gets an [InformationSize] representing this number of zebibits.
  InformationSize zebibits() => Decimal.fromInt(this).zebibits();

  /// Gets an [InformationSize] representing this number of zettabytes.
  InformationSize zettabytes() => Decimal.fromInt(this).zettabytes();

  /// Gets an [InformationSize] representing this number of zebibytes.
  InformationSize zebibytes() => Decimal.fromInt(this).zebibytes();

  /// Gets an [InformationSize] representing this number of yottabits.
  InformationSize yottabits() => Decimal.fromInt(this).yottabits();

  /// Gets an [InformationSize] representing this number of yobibits.
  InformationSize yobibits() => Decimal.fromInt(this).yobibits();

  /// Gets an [InformationSize] representing this number of yottabytes.
  InformationSize yottabytes() => Decimal.fromInt(this).yottabytes();

  /// Gets an [InformationSize] representing this number of yobibytes.
  InformationSize yobibytes() => Decimal.fromInt(this).yobibytes();

  /// Gets a [Length] representing this number of nanometers.
  Length nanometers() => Decimal.fromInt(this).nanometers();

  /// Gets a [Length] representing this number of micrometers.
  Length micrometers() => Decimal.fromInt(this).micrometers();

  /// Gets a [Length] representing this number of thous.
  Length thous() => Decimal.fromInt(this).thous();

  /// Gets a [Length] representing this number of millimeters.
  Length millimeters() => Decimal.fromInt(this).millimeters();

  /// Gets a [Length] representing this number of lines.
  Length lines() => Decimal.fromInt(this).lines();

  /// Gets a [Length] representing this number of centimeters.
  Length centimeters() => Decimal.fromInt(this).centimeters();

  /// Gets a [Length] representing this number of inches.
  Length inches() => Decimal.fromInt(this).inches();

  /// Gets a [Length] representing this number of decimeters.
  Length decimeters() => Decimal.fromInt(this).decimeters();

  /// Gets a [Length] representing this number of feet.
  Length feet() => Decimal.fromInt(this).feet();

  /// Gets a [Length] representing this number of yards.
  Length yards() => Decimal.fromInt(this).yards();

  /// Gets a [Length] representing this number of meters.
  Length meters() => Decimal.fromInt(this).meters();

  /// Gets a [Length] representing this number of decameters.
  Length decameters() => Decimal.fromInt(this).decameters();

  /// Gets a [Length] representing this number of hectometers.
  Length hectometers() => Decimal.fromInt(this).hectometers();

  /// Gets a [Length] representing this number of kilometers.
  Length kilometers() => Decimal.fromInt(this).kilometers();

  /// Gets a [Length] representing this number of miles.
  Length miles() => Decimal.fromInt(this).miles();

  /// Gets a [Length] representing this number of megameters.
  Length megameters() => Decimal.fromInt(this).megameters();

  /// Gets a [Length] representing this number of gigameters.
  Length gigameters() => Decimal.fromInt(this).gigameters();

  /// Gets a [Temperature] representing this number of nanokelvins.
  Temperature nanokelvins() => Decimal.fromInt(this).nanokelvins();

  /// Gets a [Temperature] representing this number of microkelvins.
  Temperature microkelvins() => Decimal.fromInt(this).microkelvins();

  /// Gets a [Temperature] representing this number of millikelvins.
  Temperature millikelvins() => Decimal.fromInt(this).millikelvins();

  /// Gets a [Temperature] representing this number of centikelvins.
  Temperature centikelvins() => Decimal.fromInt(this).centikelvins();

  /// Gets a [Temperature] representing this number of decikelvins.
  Temperature decikelvins() => Decimal.fromInt(this).decikelvins();

  /// Gets a [Temperature] representing this number of kelvins.
  Temperature kelvins() => Decimal.fromInt(this).kelvins();

  /// Gets a [Temperature] representing this number of celsius.
  Temperature celsius() => Decimal.fromInt(this).celsius();

  /// Gets a [Temperature] representing this number of fahrenheit.
  Temperature fahrenheit() => Decimal.fromInt(this).fahrenheit();

  /// Gets a [Time] representing this number of nanoseconds.
  Time nanoseconds() => Decimal.fromInt(this).nanoseconds();

  /// Gets a [Time] representing this number of microseconds.
  Time microseconds() => Decimal.fromInt(this).microseconds();

  /// Gets a [Time] representing this number of milliseconds.
  Time milliseconds() => Decimal.fromInt(this).milliseconds();

  /// Gets a [Time] representing this number of centiseconds.
  Time centiseconds() => Decimal.fromInt(this).centiseconds();

  /// Gets a [Time] representing this number of deciseconds.
  Time deciseconds() => Decimal.fromInt(this).deciseconds();

  /// Gets a [Time] representing this number of seconds.
  Time seconds() => Decimal.fromInt(this).seconds();

  /// Gets a [Time] representing this number of decaseconds.
  Time decaseconds() => Decimal.fromInt(this).decaseconds();

  /// Gets a [Time] representing this number of minutes.
  Time minutes() => Decimal.fromInt(this).minutes();

  /// Gets a [Time] representing this number of hours.
  Time hours() => Decimal.fromInt(this).hours();

  /// Gets a [Time] representing this number of days.
  Time days() => Decimal.fromInt(this).days();

  /// Gets a [Time] representing this number of weeks.
  Time weeks() => Decimal.fromInt(this).weeks();

  /// Gets a [Time] representing this number of fortnights.
  Time fortnights() => Decimal.fromInt(this).fortnights();

  /// Gets a [Time] representing this number of months.
  Time months() => Decimal.fromInt(this).months();

  /// Gets a [Time] representing this number of quarters.
  Time quarters() => Decimal.fromInt(this).quarters();

  /// Gets a [Time] representing this number of years.
  Time years() => Decimal.fromInt(this).years();

  /// Gets a [Time] representing this number of decades.
  Time decades() => Decimal.fromInt(this).decades();

  /// Gets a [Time] representing this number of centuries.
  Time centuries() => Decimal.fromInt(this).centuries();

  /// Gets a [Volume] representing this number of cubic nanometers.
  Volume cubicNanometers() => Decimal.fromInt(this).cubicNanometers();

  /// Gets a [Volume] representing this number of cubic thous.
  Volume cubicThous() => Decimal.fromInt(this).cubicThous();

  /// Gets a [Volume] representing this number of cubic micrometers.
  Volume cubicMicrometers() => Decimal.fromInt(this).cubicMicrometers();

  /// Gets a [Volume] representing this number of cubic millimeters.
  Volume cubicMillimeters() => Decimal.fromInt(this).cubicMillimeters();

  /// Gets a [Volume] representing this number of milliliters.
  Volume milliliters() => Decimal.fromInt(this).milliliters();

  /// Gets a [Volume] representing this number of imperial teaspoons.
  Volume imperialTeaspoons() => Decimal.fromInt(this).imperialTeaspoons();

  /// Gets a [Volume] representing this number of US teaspoons.
  Volume usTeaspoons() => Decimal.fromInt(this).usTeaspoons();

  /// Gets a [Volume] representing this number of US legal cups.
  Volume usLegalCups() => Decimal.fromInt(this).usLegalCups();

  /// Gets a [Volume] representing this number of US fluid ounces.
  Volume usFluidOunces() => Decimal.fromInt(this).usFluidOunces();

  /// Gets a [Volume] representing this number of imperial fluid ounces.
  Volume imperialFluidOunces() => Decimal.fromInt(this).imperialFluidOunces();

  /// Gets a [Volume] representing this number of imperial tablespoons.
  Volume imperialTablespoons() => Decimal.fromInt(this).imperialTablespoons();

  /// Gets a [Volume] representing this number of cubic inches.
  Volume cubicInches() => Decimal.fromInt(this).cubicInches();

  /// Gets a [Volume] representing this number of US tablespoons.
  Volume usTablespoons() => Decimal.fromInt(this).usTablespoons();

  /// Gets a [Volume] representing this number of liters.
  Volume liters() => Decimal.fromInt(this).liters();

  /// Gets a [Volume] representing this number of US liquid quarts.
  Volume usLiquidQuarts() => Decimal.fromInt(this).usLiquidQuarts();

  /// Gets a [Volume] representing this number of US customary cups.
  Volume usCustomaryCups() => Decimal.fromInt(this).usCustomaryCups();

  /// Gets a [Volume] representing this number of imperial pints.
  Volume imperialPints() => Decimal.fromInt(this).imperialPints();

  /// Gets a [Volume] representing this number of US liquid pints.
  Volume usLiquidPints() => Decimal.fromInt(this).usLiquidPints();

  /// Gets a [Volume] representing this number of imperial cups.
  Volume imperialCups() => Decimal.fromInt(this).imperialCups();

  /// Gets a [Volume] representing this number of imperial gallons.
  Volume imperialGallons() => Decimal.fromInt(this).imperialGallons();

  /// Gets a [Volume] representing this number of US liquid gallons.
  Volume usLiquidGallons() => Decimal.fromInt(this).usLiquidGallons();

  /// Gets a [Volume] representing this number of imperial quarts.
  Volume imperialQuarts() => Decimal.fromInt(this).imperialQuarts();

  /// Gets a [Volume] representing this number of cubic feet.
  Volume cubicFeet() => Decimal.fromInt(this).cubicFeet();

  /// Gets a [Volume] representing this number of cubic meters.
  Volume cubicMeters() => Decimal.fromInt(this).cubicMeters();

  /// Gets a [Volume] representing this number of cubic yards.
  Volume cubicYards() => Decimal.fromInt(this).cubicYards();

  /// Gets a [Volume] representing this number of cubic decameters.
  Volume cubicDecameters() => Decimal.fromInt(this).cubicDecameters();

  /// Gets a [Volume] representing this number of cubic kilometers.
  Volume cubicKilometers() => Decimal.fromInt(this).cubicKilometers();

  /// Gets a [Volume] representing this number of cubic miles.
  Volume cubicMiles() => Decimal.fromInt(this).cubicMiles();

  /// Gets a [Volume] representing this number of cubic megameters.
  Volume cubicMegameters() => Decimal.fromInt(this).cubicMegameters();

  /// Gets a [Volume] representing this number of cubic gigameters.
  Volume cubicGigameters() => Decimal.fromInt(this).cubicGigameters();

  /// Gets a [Weight] representing this number of nanograms.
  Weight nanograms() => Decimal.fromInt(this).nanograms();

  /// Gets a [Weight] representing this number of micrograms.
  Weight micrograms() => Decimal.fromInt(this).micrograms();

  /// Gets a [Weight] representing this number of milligrams.
  Weight milligrams() => Decimal.fromInt(this).milligrams();

  /// Gets a [Weight] representing this number of grams.
  Weight grams() => Decimal.fromInt(this).grams();

  /// Gets a [Weight] representing this number of ounces.
  Weight ounces() => Decimal.fromInt(this).ounces();

  /// Gets a [Weight] representing this number of pounds.
  Weight pounds() => Decimal.fromInt(this).pounds();

  /// Gets a [Weight] representing this number of kilograms.
  Weight kilograms() => Decimal.fromInt(this).kilograms();

  /// Gets a [Weight] representing this number of US tons.
  Weight usTons() => Decimal.fromInt(this).usTons();

  /// Gets a [Weight] representing this number of (metric) tonnes.
  Weight tonnes() => Decimal.fromInt(this).tonnes();

  /// Gets a [Weight] representing this number of imperial tons.
  Weight imperialTons() => Decimal.fromInt(this).imperialTons();

  /// Gets a [Weight] representing this number of megatonnes.
  Weight megatonnes() => Decimal.fromInt(this).megatonnes();

  /// Gets a [Weight] representing this number of gigatonnes.
  Weight gigatonnes() => Decimal.fromInt(this).gigatonnes();
}

/// Provides extensions on [int] related to units of measurement.
extension UnitsOfMeasurementDecimalExtensions on Decimal {
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

  /// Gets a [Length] representing this number of lines.
  Length lines() => Length.fromLines(this);

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
