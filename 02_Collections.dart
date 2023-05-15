import 'dart:core';

void main() {
  // https://dart.dev/guides/libraries/library-tour#collections
  list();
  set();
  map();
  Common_collection_methods();
}

void list() {
  // Create an empty list of strings.
  var grain = <String>[];
  assert(grain.isEmpty);

  // Create a list using a list literal.
  var fruits = ['apples', 'oranges'];

  // Add to a list.
  fruits.add('kiwis');

  // Add multiple items to a list.
  fruits.addAll(['grapes', 'bananas']);

  // Get the list length.
  assert(fruits.length == 5);

  // Remove a single item.
  var appleIndex = fruits.indexOf('apples');
  fruits.removeAt(appleIndex);
  assert(fruits.length == 4);

  //Sort a list using the sort() method.
  // You can provide a sorting function that compares two objects.
  //This sorting function must return < 0 for smaller, 0 for the same, and > 0 for bigger.
  //The following example uses compareTo(), which is defined by Comparable and implemented by String.

  // var fruits=['bananas', 'apples', 'oranges'];
  fruits.add('apples');
  fruits.sort((a, b) => a.compareTo(b));
  assert(fruits[0] == 'apples');

  // This list should contain only strings.
  var frus = <String>[];
  frus.add('apples');
  var fru = frus[0];
  assert(fru is String);
}

void set() {
  // an unordered collection of unique items.
  // Create an empty set of strings.
  var ingredients = <String>{};

  // Add new items to it.
  ingredients.addAll(['gold', 'titanium', 'xenon']);
  assert(ingredients.length == 3);

  // Adding a duplicate item has no effect.
  ingredients.add('gold');
  assert(ingredients.length == 3);

  // Remove an item from a set.
  ingredients.remove('gold');
  assert(ingredients.length == 2);
  ingredients.add('gold');

  // You can also create sets using
  // one of the constructors
  var atomicNumbers = Set.from([79, 22, 54]);

  // Check whether an item is in the set.
  assert(ingredients.contains('gold'));

  // Check whether all the items are in the set.
  assert(ingredients.containsAll(['gold', 'xenon']));

  // 创建两个集合的交集 intersection 交叉点
  var nobelGases = Set.from(['xenon', 'argon']);
  var intersection = ingredients.intersection(nobelGases);
  assert(intersection.length == 1);
  assert(intersection.contains('xenon'));
}

void map() {
  // Maps built
  var hawaiianBeaches = {
    'Oahu': ['Waikiki', 'Kailua', 'Waimanalo'],
    'Big Island': ['Wailea Bay', 'Pololu Beach'],
    'Kauai': ['Hanalei', 'Poipu']
  };

  var searchTerms = Map();

  var nobleGases = Map<int, String>();

  // You add, get, and set map items using the bracket syntax. Use remove() to remove a key and its value from a map.
  nobleGases[54] = 'xenon';
  assert(nobleGases[54] == 'xenon');

  // Check whether a map contains a key.
  assert(nobleGases.containsKey(54));

  // Remove a key and its value.
  nobleGases.remove(54);
  assert(!nobleGases.containsKey(54));

  //retrieve 检索
  // Get all the keys as an unordered collection
  var keys = hawaiianBeaches.keys;
  assert(keys.length == 3);
  assert(Set.from(keys).contains('Oahu'));

  // Get all the values as an unordered collection
  var values = hawaiianBeaches.values;
  assert(values.length == 3);
  assert(values.any((v) => v.contains('Waikiki')));

  //To check whether a map contains a key, use containsKey()
  assert(hawaiianBeaches.containsKey('Oahu'));
  assert(!hawaiianBeaches.containsKey('Florida'));

  // * 当你想给一个键赋值时，请使用putIfAbsent()方法，前提是该键不存在于一个地图中。你必须提供一个函数来返回该值。
  var teamAssignments = <String, String>{};
  //teamAssignments.putIfAbsent('Catcher',() => pickToughestKid());
  //assert(teamAssignments['Catcher']!=null);
}

void Common_collection_methods() {
  var coffees = <String>[];
  var teas = ['green', 'black', 'chamomile', 'earl grey'];
  assert(coffees.isEmpty);
  assert(teas.isNotEmpty);

  // To apply a function to each item in a list, set, or map, you can use forEach():
  teas.forEach((tea) => print('I drink $tea'));

  var hawaiianBeaches = {
    'Oahu': ['Waikiki', 'Kailua', 'Waimanalo'],
    'Big Island': ['Wailea Bay', 'Pololu Beach'],
    'Kauai': ['Hanalei', 'Poipu']
  };
  hawaiianBeaches.forEach((k, v) => print('I want to visit $k and swim at $v'));
  // I want to visit Oahu and swim at [Waikiki, Kailua, Waimanalo], etc.

  // *Iterables provide the map() method, which gives you all the results in a single object:
  // map()返回的对象是一个被懒惰地评估的Iterable：在你从返回的对象中要求一个项目之前，你的函数不会被调用。
  var loudTeas = teas.map((tea) => tea.toUpperCase());
  loudTeas.forEach(print);

  // 使用Iterable的where()方法来获取所有符合条件的项目。使用Iterable的any()和every()方法来检查部分或全部项目是否符合条件。
  // Chamomile is not caffeinated.
  bool isDecaffeinated(String teaName) => teaName == 'chamomile';

  // 使用where()只找到从提供的函数中返回真值的项目.
  var decaffeinatedTeas = teas.where((tea) => isDecaffeinated(tea));
  // or teas.where(isDecaffeinated)

  // Use any() to check whether at least one item in the collection satisfies a condition.
  assert(teas.any(isDecaffeinated));

  // Use every() to check whether all the items in a collection satisfy a condition.
  assert(!teas.every(isDecaffeinated));
}
