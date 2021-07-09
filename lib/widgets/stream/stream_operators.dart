import 'dart:async';

void main() {
  ///1.periodic
  // periodicOperatior();

  ///2.take
  // takeOperator();

  ///3.where
  // whereOperatior();

  ///4.takeWhile
  // takeWhileOperator();

  ///5.skip
  // skipOperator();

  ///6.skipWhile
  // skipWhileOperator();

  ///7.toList
  // toListOperator();

  ///9.forEach
  // forEachOperator();

  ///10.map
  // mapOperator();

  ///11.extend
  // extendOperator();

  ///12.transform
  transformOperator();
}

///1.常用操作符使用:periodic
void periodicOperatior() async {
  ///只能进行一次监听
  final Duration duration = Duration(seconds: 1);

  Stream<int> stream = Stream.periodic(duration, (data) => data);

  stream = stream.take(10); //最多执行多少次该事件；

  stream.listen((event) {
    print('data:$event');
  }, onError: (error) {
    print('error:$error');
  }, onDone: () {
    print('onDone()~');
  });
}

///2.take操作符：最多执行多少次
void takeOperator() async {
  ///只能监听一次
  final Duration duration = Duration(seconds: 1);

  Stream<int> stream = Stream.periodic(duration, (data) => data);

  stream = stream.take(10); //最多执行多少次该事件；

  await for (int i in stream) {
    print('item:$i');
  }

  // stream.listen((event) {
  //   print('data:$event');
  // }, onError: (error) {
  //   print('error:$error');
  // }, onDone: () {
  //   print('onDone()~');
  // });
}

///3.where操作符
void whereOperatior() {
  ///只能进行一次监听
  final Duration duration = Duration(seconds: 1);

  Stream<int> stream = Stream.periodic(duration, (data) => data);

  stream = stream.take(10); //最多执行多少次该事件；

  stream = stream.where((data) => data > 3);

  stream.listen((event) {
    print('data:$event');
  }, onError: (error) {
    print('error:$error');
  }, onDone: () {
    print('onDone()~');
  });
}

///4.takeWhile操作符：（先行判断）满足某一条件执行
void takeWhileOperator() {
  ///只能进行一次监听
  final Duration duration = Duration(seconds: 1);

  Stream<int> stream = Stream.periodic(duration, (data) => data);

  stream = stream.take(10); //最多执行多少次该事件；

  stream = stream.takeWhile((data) => data < 3);

  stream.listen((event) {
    print('data:$event');
  }, onError: (error) {
    print('error:$error');
  }, onDone: () {
    print('onDone()~');
  });
}

///5.skip操作符：跳过指定的几个事件
void skipOperator() {
  ///只能进行一次监听
  final Duration duration = Duration(seconds: 1);

  Stream<int> stream = Stream.periodic(duration, (data) => data);

  stream = stream.take(10); //最多执行多少次该事件；

  stream = stream.skip(3);

  stream.listen((event) {
    print('data:$event');
  }, onError: (error) {
    print('error:$error');
  }, onDone: () {
    print('onDone()~');
  });
}

///6.skipWhile操作符:跳过满足条件的事件继续执行剩余事件；
void skipWhileOperator() {
  ///只能进行一次监听
  final Duration duration = Duration(seconds: 1);

  Stream<int> stream = Stream.periodic(duration, (data) => data);

  stream = stream.take(10); //最多执行多少次该事件；

  stream = stream.skipWhile((data) {
    return data < 5;
  });

  stream.listen((event) {
    print('data:$event');
  }, onError: (error) {
    print('error:$error');
  }, onDone: () {
    print('onDone()~');
  });
}

///7.toList操作符:跳过满足条件的事件继续执行剩余事件；
void toListOperator() async {
  ///只能进行一次监听
  final Duration duration = Duration(seconds: 1);

  Stream<int> stream = Stream.periodic(duration, (data) => data);

  stream = stream.take(10); //最多执行多少次该事件；

  List<int> list = await stream.toList();

  for (int i in list) {
    print("item:$i");
  }
}

///8.listen操作符：特定监听数据流的方式；
void listenOperator() {
  ///只能进行一次监听
  final Duration duration = Duration(seconds: 1);

  Stream<int> stream = Stream.periodic(duration, (data) => data);

  stream = stream.take(10); //最多执行多少次该事件；

  stream.listen((event) {
    print('data:$event');
  }, onError: (error) {
    print('error:$error');
  }, onDone: () {
    print('onDone()~');
  });
}

///9.forEach操作符：取出流中的元素；
void forEachOperator() {
  ///只能进行一次监听
  final Duration duration = Duration(seconds: 1);

  Stream<int> stream = Stream.periodic(duration, (data) => data);

  stream = stream.take(10); //最多执行多少次该事件；

  stream.forEach((element) {
    print('Item:$element');
  });
}

///10.map操作符：对流中的数据进行一定的变换；
void mapOperator() {
  ///只能进行一次监听
  final Duration duration = Duration(seconds: 1);

  Stream<int> stream = Stream.periodic(duration, (data) => data);

  stream = stream.take(10);

  stream = stream.map((data) => data + 1); //最多执行多少次该事件；

  stream.forEach((element) {
    print('Item:$element');
  });
}

///11.extend操作符：对流中的数据进行扩展
void extendOperator() {
  ///只能进行一次监听
  final Duration duration = Duration(seconds: 1);

  Stream<int> stream = Stream.periodic(duration, (data) => data);

  stream = stream.take(10);

  stream = stream.expand((data) => [data, data]); //最多执行多少次该事件；

  stream.forEach((element) {
    print('Item:$element');
  });
}

///12.transform操作符：流流转过程中的转换和控制
void transformOperator() {
  final stream = Stream<int>.fromIterable([1, 2, 4, 6]);
  final transformer =
      StreamTransformer<int, String>.fromHandlers(handleData: (data, sink) {
    if (data == 2) {
      sink.add('是数值2');
    } else {
      sink.add('非数值2');
    }
  });

  stream.transform(transformer).listen((event) {
    print('data:$event');
  }, onError: (error) => print('error:$error'));
}
