import 'package:flutter/material.dart';
import 'package:flutter_code_challenge/modules/home/presenter/widgets/post_widet.dart';

class BlogPostsList extends StatelessWidget {
  const BlogPostsList({super.key});

  @override
  Widget build(BuildContext context) {
    const double postWidth = 300;
    final screenWidth = MediaQuery.sizeOf(context).width;
    final int crossAxisCount = (screenWidth / postWidth).floor().clamp(1, 4);

    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
      ),
      itemCount: 30,
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 16,
      ),
      itemBuilder: (context, index) {
        return const PostWidet();
      },
    );
  }
}
