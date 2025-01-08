import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_code_challenge/modules/home/data/models/post_model.dart';

void main() {
  group('PostModel', () {
    test('should create a PostModel from JSON', () {
      const json = {
        'userId': 1,
        'id': 101,
        'title': 'Test Title',
        'body': 'Test Body',
      };

      final model = PostModel.fromJson(json);

      expect(model.userId, 1);
      expect(model.id, 101);
      expect(model.title, 'Test Title');
      expect(model.body, 'Test Body');
    });
  });
}
