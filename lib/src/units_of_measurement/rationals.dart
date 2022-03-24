import 'package:rational/rational.dart';

export 'package:rational/rational.dart';

class Rationals {
  static final zero = Rational.zero;

  static final one = Rational.one;
  static final two = Rational.fromInt(2);
  static final three = Rational.fromInt(3);
  static final four = Rational.fromInt(4);
  static final eight = Rational.fromInt(8);
  static final ten = Rational.fromInt(10);
  static final hundred = Rational.fromInt(100);
  static final thousand = Rational.fromInt(1000);
  static final tenThousand = Rational.fromInt(10000);
  static final million = Rational.fromInt(1000000);
  static final billion = Rational.fromInt(1000000000);
  static final trillion = Rational.fromInt(1000000000000);
  static final quadrillion = Rational.fromInt(1000000000000000);
  static final quintillion = Rational.fromInt(1000000000000000000);
  static final octillion = Rational.one.pow(27);

  static final threeQuarters = three / four;
  static final third = one / three;
  static final half = one / two;
  static final quarter = one / four;
  static final eighth = one / eight;
  static final tenth = one / ten;
  static final hundredth = one / hundred;
  static final thousandth = one / thousand;
  static final tenThousandth = one / tenThousand;
  static final millionth = one / million;
  static final billionth = one / billion;
  static final trillionth = one / trillion;
  static final quadrillionth = one / quadrillion;
  static final quintillionth = one / quintillion;
  static final octillionth = one / octillion;
}
