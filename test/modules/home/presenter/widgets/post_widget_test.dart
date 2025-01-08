import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_code_challenge/modules/home/domain/entities/post_entity.dart';
import 'package:flutter_code_challenge/modules/home/presenter/widgets/custom_text_icon_button.dart';
import 'package:flutter_code_challenge/modules/home/presenter/widgets/post_widet.dart';

import 'package:flutter_test/flutter_test.dart';

void main() {
  setUpAll(() {
    HttpOverrides.global = null;
  });
  group(
    'PostWidget',
    () {
      const post = PostEntity(
        userId: 1,
        id: 1,
        title: 'Test Title',
        body: 'This is the body of the test post',
      );

      testWidgets('renders the post title and body',
          (WidgetTester tester) async {
        await tester.runAsync(() async {
          await tester.pumpWidget(
            const MaterialApp(
              home: Scaffold(
                body: PostWidet(
                  post: post,
                ),
              ),
            ),
          );
        });

        expect(find.text('Test Title'), findsOneWidget);
        expect(find.text('This is the body of the test post'), findsOneWidget);
      });

      testWidgets('renders the "Community" tag', (WidgetTester tester) async {
        await tester.pumpWidget(
          const MaterialApp(
            home: Scaffold(
              body: PostWidet(
                post: post,
              ),
            ),
          ),
        );

        expect(find.text('Community'), findsOneWidget);
      });

      testWidgets('renders CustomTextIconButton', (WidgetTester tester) async {
        await tester.pumpWidget(
          const MaterialApp(
            home: Scaffold(
              body: PostWidet(post: post),
            ),
          ),
        );

        expect(find.byType(CustomTextIconButton), findsOneWidget);
      });

      testWidgets('renders the image', (WidgetTester tester) async {
        await tester.pumpWidget(
          const MaterialApp(
            home: Scaffold(
              body: PostWidet(post: post),
            ),
          ),
        );

        expect(find.byType(Image), findsOneWidget);
      });
    },
  );
}
