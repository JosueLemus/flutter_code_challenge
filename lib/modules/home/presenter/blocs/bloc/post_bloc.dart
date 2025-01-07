import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_code_challenge/modules/home/domain/entities/post_entity.dart';
import 'package:flutter_code_challenge/modules/home/domain/repository/post_repository.dart';

part 'post_event.dart';
part 'post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  final PostRepository repository;

  PostBloc(this.repository) : super(PostInitial()) {
    on<FetchPostsEvent>(_onFetchPosts);
    on<RefreshPostsEvent>(_onRefreshPosts);
  }

  Future<void> _onFetchPosts(
    FetchPostsEvent event,
    Emitter<PostState> emit,
  ) async {
    final currentState = state;
    List<PostEntity> oldPosts = [];
    if (currentState is PostLoaded) {
      if (currentState.hasReachedMax ||
          currentState.isLoadingMore ||
          currentState.errorMessage != null) return;
      oldPosts = currentState.posts;
    }

    emit(
      PostLoaded(
        posts: oldPosts,
        hasReachedMax: false,
        isLoadingMore: true,
      ),
    );

    final result = await repository.fetchPosts(event.page, event.limit);

    result.when(
      ok: (newPosts) {
        final updatedPosts = List<PostEntity>.from(oldPosts)..addAll(newPosts);
        emit(
          PostLoaded(
            posts: updatedPosts,
            hasReachedMax: newPosts.isEmpty,
          ),
        );
      },
      err: (failure) {
        if (oldPosts.isNotEmpty) {
          emit(
            PostLoaded(
              posts: oldPosts,
              hasReachedMax: false,
              errorMessage: failure.message,
            ),
          );
        } else {
          emit(
            PostError(
              message: failure.message,
            ),
          );
        }
      },
    );
  }

  Future<void> _onRefreshPosts(
    RefreshPostsEvent event,
    Emitter<PostState> emit,
  ) async {
    emit(const PostLoading());

    final result = await repository.fetchPosts(
      1,
      event.limit,
    );

    result.when(
      ok: (newPosts) {
        emit(
          PostLoaded(
            posts: newPosts,
            hasReachedMax: newPosts.isEmpty,
          ),
        );
      },
      err: (failure) {
        emit(
          PostError(
            message: failure.message,
          ),
        );
      },
    );
  }
}
