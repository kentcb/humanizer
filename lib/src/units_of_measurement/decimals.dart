import 'package:decimal/decimal.dart';

class Decimals {
  static final trillionth = ds('0.000000000001');
  static final billionth = ds('0.000000001');
  static final millionth = ds('0.000001');
  static final thousandth = ds('0.001');
  static final hundredth = ds('0.01');
  static final tenth = ds('0.1');
  static final quarter = ds('0.25');
  static final half = ds('0.5');
  static final threeQuarters = ds('0.75');
  static final two = di(2);
  static final ten = di(10);
}

Decimal di(int value) => Decimal.fromInt(value);
Decimal ds(String value) => Decimal.parse(value);
