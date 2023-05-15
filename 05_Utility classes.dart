import 'dart:core';

class Line implements Comparable<Line> {
  final int length;
  const Line(this.length);

  @override
  // https://api.dart.dev/stable/2.19.6/dart-core/Comparable-class.html
  int compareTo(Line other) => length - other.length;
}

class Person {
  //Dart中的每个对象都会自动提供一个整数的哈希代码，因此可以作为地图中的一个键。
  //然而，你可以覆盖hashCode获取器来生成一个自定义的哈希代码。
  //如果你这样做，你可能还想覆盖==运算符。相等的对象（通过==）必须有相同的哈希代码。
  //哈希代码不一定是唯一的，但它应该是分布良好的。
  final String firstName, lastName;
  Person(this.firstName, this.lastName);

  @override
  int get hashCode => Object.hash(firstName, lastName);

  @override
  bool operator ==(Object other) {
    return other is Person &&
        other.firstName == firstName &&
        other.lastName == lastName;
  }
}

class Process{

}

// class ProcessIterator implements Iterator<Process>{
// Iterable和Iterator类支持对一个数值集合的顺序访问。要练习使用这些集合，请跟随Iterable集合的代码实验。
// 如果你创建了一个可以提供迭代器用于for-in循环的类，请扩展（如果可能）或实现Iterable。实现Iterator来定义实际的迭代能力。
//   @override
//   Process get current =>...

//   @override
//   bool moveNext()=>
// }

void main() {
  //https://dart.dev/guides/libraries/library-tour#utility-classes
  
  // Line
  var short = const Line(1);
  var long = const Line(100);
  assert(short.compareTo(long) < 0);

  // Person
  var p1 = Person('Bob', 'Smith');
  var p2 = Person('Bob', 'Smith');
  var p3 = 'not a person';
  assert(p1.hashCode == p2.hashCode);
  assert(p1 == p2);
  assert(p1 != p3);
}
