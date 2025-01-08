import 'package:flutter/material.dart';

class PostImage extends StatelessWidget {
  final String imageUrl;
  final double height;
  final double width;

  const PostImage({
    super.key,
    required this.imageUrl,
    this.height = 100,
    this.width = double.infinity,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(
        12,
      ),
      child: Container(
        color: Theme.of(context).brightness == Brightness.dark
            ? Colors.grey[800]
            : Colors.grey[100],
        child: Image.network(
          imageUrl,
          height: height,
          width: width,
          fit: BoxFit.cover,
          loadingBuilder: (context, child, loadingProgress) {
            if (loadingProgress == null) {
              return child;
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
          errorBuilder: (context, error, stackTrace) {
            return const SizedBox();
          },
        ),
      ),
    );
  }
}
