import 'package:humanizer/src/units_of_measurement/length_constants.dart';
import 'package:humanizer/src/units_of_measurement/rationals.dart';

// SI.
final squareMetersInSquareNanometer = Rationals.quintillionth;
final squareMetersInSquareMicrometer = Rationals.trillionth;
final squareMetersInSquareMillimeter = Rationals.millionth;
final squareMetersInSquareCentimeter = Rationals.tenThousandth;
final squareMetersInSquareDecimeter = Rationals.hundredth;
final squareMetersInSquareMeter = Rationals.one;
final squareMetersInSquareDecameter = Rationals.hundred;
final squareMetersInHectare = Rationals.tenThousand;
final squareMetersInSquareKilometer = Rationals.million;
final squareMetersInSquareMegameter = Rationals.trillion;
final squareMetersInSquareGigameter = Rationals.quintillion;

// Imperial
final squareMetersInSquareThou = metersInThou * metersInThou;
final squareMetersInSquareInch = metersInInch * metersInInch;
final squareMetersInSquareFoot = metersInFoot * metersInFoot;
final squareMetersInSquareYard = metersInYard * metersInYard;
final squareMetersInAcre = squareMetersInSquareMile / Rational.fromInt(640);
final squareMetersInSquareMile = metersInMile * metersInMile;
