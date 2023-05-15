import 'dart:math';

void Trigonometry() {
  // 数学库提供了基本的三角函数：
  assert(cos(pi) == -1);
  var degrees = 30;
  var radians = degrees * (pi / 180);
  var sinOf30degrees = sin(radians);
  // sin 30° = 0.5
  assert((sinOf30degrees - 0.5).abs() < 0.01);
}

void Maximum_and_minimum() {
  assert(max(1, 1000) == 1000);
  assert(min(1, -1000) == -1000);
}

void Math_constants() {
// See the Math library for additional constants.
  print(e); // 2.718281828459045
  print(pi); // 3.141592653589793
  print(sqrt2); // 1.4142135623730951
}

void Random_numbers() {
  var random = Random();
  random.nextDouble(); // Between 0.0 and 1.0: [0, 1)
  random.nextInt(10); // Between 0 and 9

  random.nextBool();// true or false
}

void main() {
  Trigonometry();
  Maximum_and_minimum();
  Math_constants();
  Random_numbers();
}
