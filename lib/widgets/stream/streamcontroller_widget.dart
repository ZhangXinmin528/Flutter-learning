import 'dart:async';

void main() {
  ///单订阅
  // controllerOne();

  ///多订阅
  controllers();
}

///构建单订阅控制器
void controllerOne() {
  StreamController<String> controller = StreamController();
  controller.stream.listen((event) {
    print('event:$event');
  });

  controller.sink.add('aaa');

  controller.add('bbb');
  controller.add('ccc');
  controller.close();
}

///多订阅控制器
void controllers() {
  StreamController<String> controller = StreamController();
  final stream = controller.stream.asBroadcastStream();
  stream.listen((event) {
    print('data:$event');
  });

  stream.listen((event) {
    print('data:$event');
  });

  controller.sink.add("aaa");
  //使用完毕一定关闭；
  controller.close();
}
