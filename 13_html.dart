import 'dart:html';

void find_elements() {
// Find an element by id (an-id).
  Element idElement = querySelector('#an-id')!;

// Find an element by class (a-class).
  Element classElement = querySelector('.a-class')!;

// Find all elements by tag (<div>).
  List<Element> divElements = querySelectorAll('div');

// Find all text inputs.
  List<Element> textInputElements = querySelectorAll(
    'input[type="text"]',
  );

// Find all elements with the CSS class 'class'
// inside of a <p> that is inside an element with
// the ID 'id'.
  List<Element> specialParagraphElements = querySelectorAll('#id p.class');

  //这个<a>标签指定了一个带有href属性的元素和一个包含 "链接文本 "字符串的文本节点（可通过文本属性访问）。
  //要改变链接所指向的URL，你可以使用AnchorElement的href属性：
  var anchor = querySelector('#example') as AnchorElement;
  anchor.href = 'https://dart.dev';
}

void manipulate() {
  // In Dart:
  const osList = ['macos', 'windows', 'linux'];
  //final userOs = determineUserOs();

  // For each possible OS...
  for (final os in osList) {
    // Matches user OS?
   // bool shouldShow = (os == userOs);

    // Find all elements with class=os. For example, if
    // os == 'windows', call querySelectorAll('.windows')
    // to find all elements with the class "windows".
    // Note that '.$os' uses string interpolation.
    for (final elem in querySelectorAll('.$os')) {
      //elem.hidden = !shouldShow; // Show or hide.
    }
  }
}

void create_ele() {
  //下面是创建段落 (<p>) 元素的示例：
  var elem = ParagraphElement();
  elem.text = 'Creating is easy';

//您还可以通过解析 HTML 文本来创建元素。还会解析和创建任何子元素。
  var elem2 = Element.html(
    '<p>Creating <em>is</em> easy!</p>',
  );

  document.body!.children.add(elem2);

  //添加节点
  querySelector('#inputs')!.nodes.add(elem);

  //替换
  querySelector('#status')!.replaceWith(elem);

  //删除
  querySelector('#expendable')?.remove();
}

void Manipulating_CSS_styles() {
  // For example, the following sample adds the warning class to an element:
  var elem = querySelector('#message')!;
  elem.classes.add('warning');

  //It’s often very efficient to find an element by ID. You can dynamically set an element ID with the id property:
  var message = DivElement();
  message.id = 'message2';
  message.text = 'Please subscribe to the Dart mailing list.';
  //您可以使用级联方法减少此示例中的冗余文本：
  var message2 = DivElement()
  ..id = 'message2'
  ..text = 'Please subscribe to the Dart mailing list.';

  //While using IDs and classes to associate an element with a set of styles is best practice,
  //sometimes you want to attach a specific style directly to the element:
  message.style
    ..fontWeight='bold'
    ..fontSize='3em';
  
}

void Handling_events(){
  // For example, here’s how you can handle clicks on a button:
  querySelector('#submitInfo')!.onClick.listen((e) {
  // When the button is clicked, it runs this code.
  //submitData();
});

// 事件可以通过 DOM 树上下传播。要发现最初触发事件的元素，请使用e.target：
  document.body!.onClick.listen((e) {
  final clickedElem = e.target;
  // ...
});
}

void main() {
  find_elements();
  manipulate();
  create_ele();
  Manipulating_CSS_styles();
}
