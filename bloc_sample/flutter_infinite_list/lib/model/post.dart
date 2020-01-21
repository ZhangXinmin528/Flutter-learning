import 'package:equatable/equatable.dart';

class Post extends Equatable {
  final int id;
  final String title;
  final String body;

  Post({this.id, this.title, this.body});

  @override
  // TODO: implement props
  List<Object> get props => null;

  @override
  String toString() {
    return 'Post{id: $id}';
  }
}
