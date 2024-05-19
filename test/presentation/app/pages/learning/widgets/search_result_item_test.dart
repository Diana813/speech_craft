import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:speech_craft/domain/entities/search_result_entity.dart';
import 'package:speech_craft/presentation/app/pages/learning/widgets/search__screen/search_result_item.dart';

void main() {
  group('SearchResultItemWidget tests', () {
    late SearchResultEntity mockResult;
    late Widget testWidget;

    setUp(() {
      mockResult = const SearchResultEntity(
        title: 'Test Title',
        description: 'Test Description',
        thumbnailUrl: 'https://media.licdn.com/dms/image/D5612AQFWr-GwNhjz6Q/article-cover_image-shrink_720_1280/0/1697342421411?e=2147483647&v=beta&t=6F_LcYhOm2CO3nWa9IPe-u2lyNHd2OKoloxojGZp6WU',
        videoId: '2',
      );
      HttpOverrides.global = null;

      testWidget = MaterialApp(
        home: Material(
          child: SearchResultItemWidget(
            result: mockResult,
          ),
        ),
      );
    });

    testWidgets('Widget should display correct title', (WidgetTester tester) async {
      await tester.pumpWidget(testWidget);
      await tester.pumpAndSettle();

      expect(find.text('Test Title'), findsOneWidget);
    });

    testWidgets('Widget should display correct description', (WidgetTester tester) async {
      await tester.pumpWidget(testWidget);
      await tester.pumpAndSettle();

      expect(find.text('Test Description'), findsOneWidget);
    });

    testWidgets('Widget should display correct thumbnail', (WidgetTester tester) async {
      await tester.pumpWidget(testWidget);
      await tester.pumpAndSettle();

      expect(find.byType(Image), findsOneWidget);
    });
  });
}