import 'package:humanizer/src/units_of_measurement/rationals.dart';

// SI.
final bytesInBit = Rationals.eighth;
final bytesInCrumb = Rationals.quarter;
final bytesInNibble = Rationals.half;
final bytesInKilobit = Rational.fromInt(125);
final bytesInMegabit = Rational.fromInt(125000);
final bytesInGigabit = Rational.fromInt(125000000);
final bytesInTerabit = Rational.fromInt(125000000000);
final bytesInPetabit = Rational.fromInt(125000000000000);
final bytesInExabit = Rational.fromInt(125000000000000000);
final bytesInZettabit = bytesInExabit * Rationals.thousand;
final bytesInYottabit = bytesInZettabit * Rationals.thousand;
final bytesInByte = Rationals.one;
final bytesInKilobyte = Rational.fromInt(1000);
final bytesInMegabyte = Rational.fromInt(1000000);
final bytesInGigabyte = Rational.fromInt(1000000000);
final bytesInTerabyte = Rational.fromInt(1000000000000);
final bytesInPetabyte = Rational.fromInt(1000000000000000);
final bytesInExabyte = Rational.fromInt(1000000000000000000);
final bytesInZettabyte = bytesInExabyte * Rationals.thousand;
final bytesInYottabyte = bytesInZettabyte * Rationals.thousand;

// IEC.
final bytesInKibibit = Rational.fromInt(128);
final bytesInMebibit = Rational.fromInt(128000);
final bytesInGibibit = Rational.fromInt(128000000);
final bytesInTebibit = Rational.fromInt(128000000000);
final bytesInPebibit = Rational.fromInt(128000000000000);
final bytesInExbibit = Rational.fromInt(128000000000000000);
final bytesInZebibit = bytesInExbibit * Rationals.thousand;
final bytesInYobibit = bytesInZebibit * Rationals.thousand;
final bytesInKibibyte = Rational.fromInt(1024);
final bytesInMebibyte = Rational.fromInt(1048576);
final bytesInGibibyte = Rational.fromInt(1073741824);
final bytesInTebibyte = Rational.fromInt(1099511627776);
final bytesInPebibyte = Rational.fromInt(1125899906842624);
final bytesInExbibyte = Rational.fromInt(1152921504606846976);
final bytesInZebibyte = bytesInExbibyte * bytesInKibibyte;
final bytesInYobibyte = bytesInZebibyte * bytesInKibibyte;
