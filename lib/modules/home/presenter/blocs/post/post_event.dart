part of 'post_bloc.dart';

sealed class PostEvent extends Equatable {
  const PostEvent();

  @override
  List<Object> get props => [];
}

final class FetchPostsEvent extends PostEvent {
  final int page;
  final int limit;

  const FetchPostsEvent(this.page, this.limit);

  @override
  List<Object> get props => [page, limit];
}

final class RefreshPostsEvent extends PostEvent {
  final int limit;

  const RefreshPostsEvent(this.limit);

  @override
  List<Object> get props => [limit];
}
