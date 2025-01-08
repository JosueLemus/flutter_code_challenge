import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_code_challenge/modules/home/domain/entities/post_entity.dart';

void main() {
  group('PostEntity', () {
    test('should properly create an instance of PostEntity', () {
      const post = PostEntity(
        userId: 1,
        id: 101,
        title: 'Test Title',
        body: 'Test Body',
      );

      expect(post.userId, 1);
      expect(post.id, 101);
      expect(post.title, 'Test Title');
      expect(post.body, 'Test Body');
    });
  });
}
