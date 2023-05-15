// import 'dart:core';

// void main(List<String> arguments) {
//   // ...
//   FileSystemEntity.isDirectory(searchPath).then((isDir) {
//     if (isDir) {
//       final startingDir = Directory(searchPath);
//       startingDir.list().listen((entity) {
//         if (entity is File) {
//           searchFile(entity, searchTerms);
//         }
//       });
//     } else {
//       searchFile(File(searchPath), searchTerms);
//     }
//   });
// }