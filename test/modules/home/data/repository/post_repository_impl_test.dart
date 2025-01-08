import 'dart:convert';
import 'package:flutter_code_challenge/modules/home/data/api/post_repository_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_code_challenge/modules/home/data/models/post_model.dart';

import 'package:flutter_code_challenge/core/errors/failures.dart';
import 'package:flutter_code_challenge/modules/home/domain/entities/post_entity.dart';
import 'package:http/http.dart' as http;
import 'package:mocktail/mocktail.dart';
import 'package:oxidized/oxidized.dart';

class MockHttpClient extends Mock implements http.Client {}

void main() {
  late MockHttpClient mockHttpClient;
  late PostRepositoryImpl repository;

  setUp(() {
    mockHttpClient = MockHttpClient();
    repository = PostRepositoryImpl(mockHttpClient);
  });

  group('PostRepositoryImpl', () {
    const tPage = 1;
    const tLimit = 10;
    const tUrl = 'https://jsonplaceholder.typicode.com/posts?_page=1&_limit=10';
    final tResponseData = [
      {
        'userId': 1,
        'id': 101,
        'title': 'Test Title',
        'body': 'Test Body',
      },
    ];
    final tPostModels = tResponseData.map(PostModel.fromJson).toList();

    test('should return a list of PostEntity when the call is successful',
        () async {
      when(() => mockHttpClient.get(Uri.parse(tUrl))).thenAnswer(
          (_) async => http.Response(jsonEncode(tResponseData), 200));

      final result = await repository.fetchPosts(tPage, tLimit);

      expect(result, Ok<List<PostEntity>, Failure>(tPostModels));
      verify(() => mockHttpClient.get(Uri.parse(tUrl))).called(1);
    });

    test('should return a Failure when the call fails with an error', () async {
      when(() => mockHttpClient.get(Uri.parse(tUrl)))
          .thenAnswer((_) async => http.Response('Not Found', 404));

      final result = await repository.fetchPosts(tPage, tLimit);

      expect(
        result,
        const Err<List<PostEntity>, Failure>(
            Failure('Failed to load posts', code: 404)),
      );
    });

    test('should return a Failure when the response is invalid JSON', () async {
      when(() => mockHttpClient.get(Uri.parse(tUrl)))
          .thenAnswer((_) async => http.Response('Invalid JSON', 200));

      final result = await repository.fetchPosts(tPage, tLimit);

      result.when(
        ok: (_) => fail('Expected an error, but got success'),
        err: (failure) {
          expect(failure.message, startsWith('Invalid JSON format'));
        },
      );
    });
  });
}
