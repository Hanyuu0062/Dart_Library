import 'dart:core';

void numbers() {
  // https://dart.dev/guides/libraries/library-tour#numbers
  /*
  * The dart:core library defines the num, int, and double classes, which have some basic utilities for working with numbers.
  * You can convert a string into an integer or double with the parse() methods of int and double, respectively:
  */
  assert(int.parse('42') == 42);
  assert(int.parse('0x42') == 66);
  assert(double.parse('0.50') == 0.5);

  // Or use the parse() method of num, which creates an integer if possible and otherwise a double:
  assert(num.parse('42') is int);
  assert(num.parse('0x42') is int);
  assert(num.parse('0.50') is double);

  // radix 表示进制
  assert(int.parse('42', radix: 16) == 66);

  /*
  * Use the toString() method to convert an int or double to a string. 
  * To specify the number of digits to the right of the decimal, use toStringAsFixed(). 
  * To specify the number of significant digits in the string, use toStringAsPrecision(): 
  */

  // Convert an int to a string.
  assert(42.toString() == '42');

  // Convert a double to a string.
  assert(123.456.toString() == '123.456');

  // 指定小数点后的位数为2位
  assert(123.456.toStringAsFixed(2) == '123.46');

  /* 
  Specify the number of significant figures.
  指定有效数位
  */
  assert(123.456.toStringAsPrecision(2) == '1.2e+2');
  assert(double.parse('1.2e+2') == 120.0);
}

void main() {
  numbers();
}
