import 'package:equatable/equatable.dart';
import 'package:flutter_infinite_list/model/post.dart';

abstract class PostState extends Equatable {
  const PostState();

  @override
  List<Object> get props {
    return [];
  }
}

class PostUninitialized extends PostState {}

class PostError extends PostState {}

class PostLoaded extends PostState {
  final List<Post> posts;
  final bool hasReachedMax;

  PostLoaded({this.posts, this.hasReachedMax});

  PostLoaded copyWith({List<Post> posts, bool hasReachedMax}) {
    return PostLoaded(
      posts: posts ?? this.posts,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
    );
  }

  @override
  List<Object> get props {
    return [posts, this.hasReachedMax];
  }

  @override
  String toString() {
    return 'PostLoaded{posts: $posts, hasReachedMax: $hasReachedMax}';
  }
}
