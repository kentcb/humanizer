import 'package:humanizer/src/units_of_measurement/rationals.dart';

// SI.
final gramsInNanogram = Rationals.billionth;
final gramsInMicrogram = Rationals.millionth;
final gramsInMilligram = Rationals.thousandth;
final gramsInGram = Rationals.one;
final gramsInKilogram = Rationals.thousand;
final gramsInTonne = Rationals.million;
final gramsInMegatonne = Rationals.trillion;
final gramsInGigatonne = Rationals.quadrillion;

// Imperial.
final gramsInOunce = gramsInPound / Rational.fromInt(16);
final gramsInPound = gramsInImperialTon / Rational.fromInt(2240);
final gramsInImperialTon = Rational.fromInt(101604691, 100);

// US.
final gramsInUsTon = Rational.fromInt(90718474, 100);
