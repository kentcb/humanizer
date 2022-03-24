import 'package:humanizer/src/units_of_measurement/rationals.dart';

// SI.
final metersInNanometer = Rationals.billionth;
final metersInMicrometer = Rationals.millionth;
final metersInMillimeter = Rationals.thousandth;
final metersInCentimeter = Rationals.hundredth;
final metersInDecimeter = Rationals.tenth;
final metersInMeter = Rationals.one;
final metersInDecameter = Rationals.ten;
final metersInHectometer = Rationals.hundred;
final metersInKilometer = Rationals.thousand;
final metersInMegameter = Rationals.million;
final metersInGigameter = Rationals.billion;

// Imperial.
final metersInThou = metersInInch * Rationals.thousandth;
final metersInInch = metersInFoot / Rational.fromInt(12);
final metersInFoot = metersInYard * Rationals.third;
final metersInYard = metersInMile / Rational.fromInt(1760);
final metersInMile = Rational.fromInt(1609344, 1000);
