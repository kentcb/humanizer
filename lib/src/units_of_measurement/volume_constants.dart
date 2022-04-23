import 'package:humanizer/src/units_of_measurement/length_constants.dart';
import 'package:humanizer/src/units_of_measurement/rationals.dart';

// SI.
final cubicMetersInCubicNanometer = Rationals.octillionth;
final cubicMetersInCubicMicrometer = Rationals.quintillionth;
final cubicMetersInCubicMillimeter = Rationals.billionth;
final cubicMetersInMilliliter = Rationals.millionth;
final cubicMetersInLiter = Rationals.thousandth;
final cubicMetersInCubicMeter = Rationals.one;
final cubicMetersInCubicDecameter = Rationals.thousand;
final cubicMetersInCubicKilometer = Rationals.billion;
final cubicMetersInCubicMegameter = Rationals.quintillion;
final cubicMetersInCubicGigameter = Rationals.octillion;

// Imperial.
final cubicMetersInCubicThou = metersInThou * metersInThou * metersInThou;
final cubicMetersInImperialTeaspoon =
    cubicMetersInImperialTablespoon * Rationals.third;
final cubicMetersInImperialTablespoon =
    cubicMetersInImperialCup * Rational.fromInt(1, 16);
final cubicMetersInImperialFluidOunce =
    cubicMetersInImperialCup * Rationals.tenth;
final cubicMetersInImperialCup = cubicMetersInImperialPint * Rationals.half;
final cubicMetersInImperialPint = cubicMetersInImperialQuart * Rationals.half;
final cubicMetersInImperialQuart =
    cubicMetersInImperialGallon * Rationals.quarter;
final cubicMetersInImperialGallon = Rational.fromInt(454609, 100000000);
final cubicMetersInCubicInch = metersInInch * metersInInch * metersInInch;
final cubicMetersInCubicFoot = metersInFoot * metersInFoot * metersInFoot;
final cubicMetersInCubicYard = metersInYard * metersInYard * metersInYard;
final cubicMetersInCubicMile = metersInMile * metersInMile * metersInMile;

// US.
final cubicMetersInUsTeaspoon = cubicMetersInUsTablespoon * Rationals.third;
final cubicMetersInUsTablespoon = cubicMetersInUsFluidOunce * Rationals.half;
final cubicMetersInUsFluidOunce =
    cubicMetersInUsCustomaryCup * Rationals.eighth;
final cubicMetersInUsCustomaryCup = cubicMetersInUsLiquidPint * Rationals.half;
final cubicMetersInUsLegalCup = cubicMetersInMilliliter * Rational.fromInt(240);
final cubicMetersInUsLiquidPint = cubicMetersInUsLiquidQuart * Rationals.half;
final cubicMetersInUsLiquidQuart =
    cubicMetersInUsLiquidGallon * Rationals.quarter;
final cubicMetersInUsLiquidGallon =
    metersInInch * metersInInch * metersInInch * Rational.fromInt(231);
