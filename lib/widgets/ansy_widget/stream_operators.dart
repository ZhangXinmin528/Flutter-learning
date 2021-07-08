void main() {
  streamOperatiors();
}

///常用操作符使用
void streamOperatiors() async {
  ///只能进行一次监听
  //1.实现每隔一秒触发一次事件；
  final Duration duration = Duration(seconds: 1);

  Stream<int> stream = Stream.periodic(duration, (data) => data);

  stream = stream.take(10); //最多执行多少次该事件；

  //2.数据筛选
  stream = stream.where((data) => data > 3);

  //3.获取数据长度
  // print('length:${await stream.length}');

  stream.listen((event) {
    print('data:$event');
  }, onError: (error) {
    print('error:$error');
  }, onDone: () {
    print('onDone()~');
  });
}

///创建空的数据流
void emptyStream() {}
