import 'dart:core';

void main() {
  // https://dart.dev/guides/libraries/library-tour#strings-and-regular-expressions
  Searching_inside_a_string();
  Extracting_data_from_a_string();
  Converting_to_uppercase_or_lowercase();
  Trimming_and_empty_strings();
  Replacing_part_of_a_string();
  Building_a_string();
  Regular_expressions();
}

void Searching_inside_a_string() {
  /*
  A string in Dart is an immutable sequence of UTF-16 code units. The language tour has more information about strings.
  You can use regular expressions (RegExp objects) to search within strings and to replace parts of strings.
  The String class defines such methods as split(), contains(), startsWith(), endsWith(), and more.
  */
  // Check whether a string contains another string.
  assert('Never odd or even'.contains('odd'));

  // Does a string start with another string?
  assert('Never odd or even'.startsWith('Never'));

  // Does a string end with another string?
  assert('Never odd or even'.endsWith('even'));

  // Find the location of a string inside a string.字符串的开头位置
  assert('Never odd or even'.indexOf('odd') == 6);
}

void Extracting_data_from_a_string() {
  /*
  You can get the individual characters from a string as Strings or ints, respectively. 
  To be precise, you actually get individual UTF-16 code units; high-numbered characters such as the treble clef symbol (‘\u{1D11E}’) are two code units apiece.
  You can also extract a substring or split a string into a list of substrings:
  */

  // Grab a substring.
  assert('Never odd or even'.substring(6, 9) == 'odd');

  // Split a string using a string pattern.
  var parts = 'progressive web apps'.split(' ');
  assert(parts.length == 3);
  assert(parts[0] == 'progressive');

  // Get a UTF-16 code unit (as a string) by index.
  assert('Never odd or even'[0] == 'N');

  // Use split() with an empty string parameter to get a list of all characters (as Strings); good for iterating.
  // 使用带有空字符串参数的split()，可以得到一个所有字符的列表（作为字符串）；有利于迭代。
  for (final char in 'hello'.split('')) {
    print(char);
  }

  // Get all the UTF-16 code units in the string.
  var codeUnitList = 'Never odd or even'.codeUnits.toList();
  assert(codeUnitList[0] == 78);
  assert(codeUnitList.length == 17);
}

void Converting_to_uppercase_or_lowercase() {
  // Convert to uppercase.
  assert('web apps'.toUpperCase() == 'WEB APPS');

  // Convert to uppercase.
  assert('WEB APPS'.toLowerCase() == 'web apps');
}

void Trimming_and_empty_strings() {
  //Remove all leading and trailing white space with trim().
  //To check whether a string is empty (length is zero), use isEmpty.

  // Trim a string.
  assert('   hello '.trim() == 'hello');

  // Check whether a string is empty.
  assert(''.isEmpty);

  // Strings with only white space are not empty.
  assert('   '.isNotEmpty);
}

void Replacing_part_of_a_string() {
  var greetingTemplate = 'Hello, NAME!';
  var greeting = greetingTemplate.replaceAll(RegExp('NAME'), 'kisara');

  // greetingTemplate didn't change.
  assert(greeting != greetingTemplate);
}

void Building_a_string() {
  /*
  To programmatically generate a string, you can use StringBuffer. 
  A StringBuffer doesn’t generate a new String object until toString() is called. 
  The writeAll() method has an optional second parameter that lets you specify a separator—in this case, a space.
  */
  var sb = StringBuffer();
  sb
    ..write('Use a StringBuffer for ')
    ..writeAll(['efficient', 'string', 'creation'], ' ') //第二个参数表示单词之间的分割符
    ..write('.');

  var fullSrting = sb.toString();
  print(fullSrting);
  assert(fullSrting == 'Use a StringBuffer for efficient string creation.');
}

void Regular_expressions() {
  /* 正则
  The RegExp class provides the same capabilities as JavaScript regular expressions.
   Use regular expressions for efficient searching and pattern matching of strings.
  */

  // Here's a regular expression for one or more digits.
  var nums = RegExp(r'\d+');
  var allCharacters = 'llamas live fifteen to twenty years';
  var someDigits = 'llamas live 15 to 20 years';

  // contains() can use a regular expression.
  assert(!allCharacters.contains(nums));
  assert(someDigits.contains(nums));

  // Replace every match with another string.
  var exedOut = someDigits.replaceAll(nums, 'XX');
  assert(exedOut == 'llamas live XX to XX years');
}
