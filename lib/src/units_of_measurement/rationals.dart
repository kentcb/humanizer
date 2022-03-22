import 'package:rational/rational.dart';

class Rationals {
  static final trillionth = rs('0.000000000001');
  static final billionth = rs('0.000000001');
  static final millionth = rs('0.000001');
  static final thousandth = rs('0.001');
  static final hundredth = rs('0.01');
  static final tenth = rs('0.1');
  static final quarter = rs('0.25');
  static final half = rs('0.5');
  static final threeQuarters = rs('0.75');
  static final zero = Rational.zero;
  static final one = Rational.one;
  static final two = ri(2);
  static final ten = ri(10);
}

Rational ri(int value) => Rational.fromInt(value);
Rational rbi(BigInt value) => Rational(value);
Rational rs(String value) => Rational.parse(value);
