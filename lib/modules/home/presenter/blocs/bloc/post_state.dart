part of 'post_bloc.dart';

sealed class PostState extends Equatable {
  const PostState();

  @override
  List<Object> get props => [];
}

final class PostInitial extends PostState {}

final class PostLoading extends PostState {
  const PostLoading();

  @override
  List<Object> get props => [];
}

final class PostLoaded extends PostState {
  final List<PostEntity> posts;
  final bool hasReachedMax;
  final String? errorMessage;
  final bool isLoadingMore;

  const PostLoaded({
    required this.posts,
    required this.hasReachedMax,
    this.errorMessage,
    this.isLoadingMore = false,
  });

  @override
  List<Object> get props => [
        posts,
        hasReachedMax,
        errorMessage ?? '',
        isLoadingMore,
      ];
}

final class PostError extends PostState {
  final String message;

  const PostError({
    required this.message,
  });

  @override
  List<Object> get props => [
        message,
      ];
}
