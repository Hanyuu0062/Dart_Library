import 'dart:core';

void built() {
  // You can create DateTime objects using several constructors and methods:
  var now = DateTime.now();

  // Create a new DateTime with the local time zone.
  var y2k = DateTime(2000); // January 1, 2000

  // Specify the month and day.
  y2k = DateTime(2000, 1, 2); // January 2, 2000

  // Specify the date as a UTC time.
  y2k = DateTime.utc(2000); // 1/1/2000, UTC

  // Specify a date and time in ms since the Unix epoch.
  y2k = DateTime.fromMillisecondsSinceEpoch(946684800000, isUtc: true);

  // 在UTC时区解析一个ISO 8601日期。
  y2k = DateTime.parse('2000-01-01T00:00:00Z');

  // Create a new DateTime from an existing one, adjusting just some properties:
  // property属性
  var sameTimeLastYear = now.copyWith(year: now.year - 1);
}

void main() {
  //https://dart.dev/guides/libraries/library-tour#dates-and-times
  built();
}
