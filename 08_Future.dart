// import 'dart:async';
// //

// //Using await
// //在你直接使用Future API之前，考虑使用await来代替。使用await表达式的代码可能比使用Future API的代码更容易理解。
// //考虑一下下面这个函数。它使用Future的then()方法来连续执行三个异步函数，在执行下一个函数之前等待每个函数的完成。

// void runUsingFuture(){
//   findEntryPoint().then((entryPoint){
//     return runExecutable(entryPoint,args);
//   }).then(flushThenExit);
// }

// //使用await表达式的等价代码看起来更像同步代码：
// Future<void> runUsingAsyncAwait() async {
//   // ...
//   var entryPoint = await findEntryPoint();
//   var exitCode = await runExecutable(entryPoint, args);
//   await flushThenExit(exitCode);
// }