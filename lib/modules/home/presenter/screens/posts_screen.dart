import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_code_challenge/core/di/dependencies.dart';
import 'package:flutter_code_challenge/modules/home/domain/repository/post_repository.dart';
import 'package:flutter_code_challenge/modules/home/presenter/blocs/post/post_bloc.dart';
import 'package:flutter_code_challenge/modules/home/presenter/widgets/post_widet.dart';

class PostsScreen extends StatelessWidget {
  const PostsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final repository = getIt<PostRepository>();
    return BlocProvider(
      create: (_) => PostBloc(repository)..add(const FetchPostsEvent(1, 10)),
      child: const BlogPostsContent(),
    );
  }
}

class BlogPostsContent extends StatefulWidget {
  const BlogPostsContent({super.key});

  @override
  State<BlogPostsContent> createState() => _BlogPostsContentState();
}

class _BlogPostsContentState extends State<BlogPostsContent> {
  ScrollController? _scrollController;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_scrollController == null) {
      _scrollController = PrimaryScrollController.of(context);
      _scrollController?.addListener(_onScroll);
    }
  }

  @override
  void dispose() {
    _scrollController?.removeListener(_onScroll);
    super.dispose();
  }

  void _onScroll() {
    if (_isBottom) {
      final bloc = context.read<PostBloc>();
      final state = bloc.state;
      if (state is PostLoaded && !state.hasReachedMax && !state.isLoadingMore) {
        bloc.add(FetchPostsEvent((state.posts.length ~/ 10) + 1, 10));
      }
    }
  }

  bool get _isBottom {
    if (!(_scrollController?.hasClients ?? false)) return false;
    final maxScroll = _scrollController!.position.maxScrollExtent;
    final currentScroll = _scrollController!.position.pixels;
    return currentScroll >= (maxScroll * 0.9);
  }

  @override
  Widget build(BuildContext context) {
    const double postWidth = 300;
    final screenWidth = MediaQuery.sizeOf(context).width;
    final int crossAxisCount = (screenWidth / postWidth).floor().clamp(1, 4);

    return BlocConsumer<PostBloc, PostState>(
      listener: (context, state) {
        if (state is PostLoaded && state.errorMessage != null) {
          _showErrorDialog(context, state.errorMessage!);
        }
      },
      builder: (context, state) {
        if (state is PostInitial || (state is PostLoading)) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is PostError) {
          return Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(state.message),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    context.read<PostBloc>().add(const FetchPostsEvent(1, 10));
                  },
                  child: const Text("Retry"),
                ),
              ],
            ),
          );
        } else if (state is PostLoaded) {
          final posts = state.posts;

          return RefreshIndicator(
            onRefresh: () async {
              context.read<PostBloc>().add(const RefreshPostsEvent(10));
            },
            child: GridView.builder(
              controller: _scrollController,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: crossAxisCount,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
              ),
              itemCount: posts.length + (state.isLoadingMore ? 1 : 0),
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 16,
              ),
              itemBuilder: (context, index) {
                if (index == posts.length) {
                  return const Padding(
                    padding: EdgeInsets.symmetric(vertical: 16.0),
                    child: Center(child: CircularProgressIndicator()),
                  );
                }

                final post = posts[index];
                return PostWidet(post: post);
              },
            ),
          );
        }

        return const SizedBox.shrink();
      },
    );
  }

  void _showErrorDialog(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Error"),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text("OK"),
          ),
        ],
      ),
    );
  }
}
