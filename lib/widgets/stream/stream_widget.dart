import 'dart:async';

///Stream使用示例
void main() async {
  Stream<int> stream = countStream(10);

  int sum = await sumStream(stream);

  print('sum = $sum');
}

Stream<int> countStream(int max) async* {
  for (int i = 0; i < max; i++) {
    yield i;
  }
}

Future<int> sumStream(Stream<int> stream) async {
  int sum = 0;
  await for (int value in stream) {
    sum += value;
  }
  return sum;
}
