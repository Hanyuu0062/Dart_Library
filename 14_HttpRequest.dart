import 'dart:html';

void main() async {

}

void requewst_and_websoket() async{
    var url = 'https://www.bilibili.com/';
  // 获取网页原码
  String pageHtml = await HttpRequest.getString(url);
  print(pageHtml);

  // Sending data to the server
  var request = HttpRequest();
  const data = {'dart': 'fun', 'angular': 'productive'};
  request
    ..open('POST', url)
    ..setRequestHeader(
      'Content-type',
      'application/x-www-form-urlencoded',
    )
    ..send(encodeMap(data));
  await request.onLoadEnd.first;

  if (request.status == 200) {
    // Successful URL access...
  }
  // ···

  //Sending and receiving real-time data with WebSockets
  var ws = WebSocket('ws://echo.websocket.org');
  ws.send('Hello from Dart!');
  ws.onMessage.listen((MessageEvent e) {
    print('Received message: ${e.data}');
  });
}

String encodeMap(Map<String, String> data) => data.entries
    .map((e) => '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
    .join('&');
