import 'package:flutter_code_challenge/core/errors/failures.dart';
import 'package:flutter_code_challenge/modules/home/domain/entities/post_entity.dart';
import 'package:oxidized/oxidized.dart';

abstract class PostRepository {
  Future<Result<List<PostEntity>, Failure>> fetchPosts(
    int page,
    int limit,
  );
}
