import 'dart:convert';
import 'package:flutter_code_challenge/core/errors/failures.dart';
import 'package:flutter_code_challenge/modules/home/data/models/post_model.dart';
import 'package:flutter_code_challenge/modules/home/domain/entities/post_entity.dart';
import 'package:flutter_code_challenge/modules/home/domain/repository/post_repository.dart';
import 'package:http/http.dart' as http;
import 'package:oxidized/oxidized.dart';

class PostRepositoryImpl extends PostRepository {
  final http.Client client;

  PostRepositoryImpl(this.client);

  @override
  Future<Result<List<PostEntity>, Failure>> fetchPosts(
      int page, int limit) async {
    try {
      final url = Uri.https('jsonplaceholder.typicode.com', '/posts', {
        '_page': '$page',
        '_limit': '$limit',
      });

      final response = await client.get(url);

      if (response.statusCode == 200) {
        final List data = json.decode(response.body) as List;
        final dataMap = data.map((json) => PostModel.fromJson(json)).toList();
        return Ok(dataMap);
      } else {
        return Err(
          Failure(
            'Failed to load posts',
            code: response.statusCode,
          ),
        );
      }
    } on FormatException catch (e) {
      return Err(Failure('Invalid JSON format: $e'));
    } on http.ClientException catch (e) {
      return Err(Failure('HTTP Client error: $e'));
    } catch (e) {
      return Err(Failure('Unexpected error: $e'));
    }
  }
}
