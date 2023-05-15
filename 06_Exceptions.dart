import 'dart:core';

class FooException implements Exception {
  //可以由一个遇到意外参数的方法抛出。
  //抛出一个特定于应用程序的异常是表明发生错误的一种常见方式。你可以通过实现Exception接口来定义一个自定义的异常：
  final String? msg;
  const FooException([this.msg]);

  @override
  String toString() => msg ?? 'FooException';
}

void main() {
  //https://dart.dev/guides/libraries/library-tour#exceptions
}
