import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:speech_craft/domain/entities/search_result_entity.dart';
import 'package:speech_craft/presentation/app/pages/learning_page/widgets/search_fragment/search_result_item.dart';
import 'package:speech_craft/presentation/app/pages/learning_page/widgets/search_fragment/search_results_list.dart';


class MockFunction extends Mock {
  void call();
}

void main() {
  group('SearchResultsList tests', () {
    late List<SearchResultEntity> mockVideos;
    late Widget testWidget;

    setUp(() {
      mockVideos = [
        const SearchResultEntity(
          title: 'Test Title 1',
          description: 'Test Description 1',
          thumbnailUrl: 'https://example.com/image1.jpg',
          videoId: '1',
        ),
        const SearchResultEntity(
          title: 'Test Title 2',
          description: 'Test Description 2',
          thumbnailUrl: 'https://example.com/image2.jpg',
          videoId: '2',
        ),
      ];

      // Allow network images in test environment
      HttpOverrides.global = null;

      testWidget = MaterialApp(
        home: Scaffold(
          body: SearchResultsList(videos: mockVideos),
        ),
      );
    });

    testWidgets('Widget should display correct number of items', (WidgetTester tester) async {
      await tester.pumpWidget(testWidget);
      await tester.pumpAndSettle();

      expect(find.byType(SearchResultItemWidget), findsNWidgets(mockVideos.length));
    });

    testWidgets('Widget should display correct titles', (WidgetTester tester) async {
      await tester.pumpWidget(testWidget);
      await tester.pumpAndSettle();

      for (var i = 0; i < mockVideos.length; i++) {
        expect(find.text('Test Title ${i + 1}'), findsOneWidget);
      }
    });

    testWidgets('Widget should display correct descriptions', (WidgetTester tester) async {
      await tester.pumpWidget(testWidget);
      await tester.pumpAndSettle();

      for (var i = 0; i < mockVideos.length; i++) {
        expect(find.text('Test Description ${i + 1}'), findsOneWidget);
      }
    });

    testWidgets('Widget should display correct thumbnails', (WidgetTester tester) async {
      await tester.pumpWidget(testWidget);
      await tester.pumpAndSettle();

      for (var i = 0; i < mockVideos.length; i++) {
        expect(find.byWidgetPredicate(
              (widget) =>
          widget is Image &&
              widget.image is NetworkImage &&
              (widget.image as NetworkImage).url ==
                  'https://example.com/image${i + 1}.jpg',
        ), findsOneWidget);
      }
    });
  });
}