import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:speech_craft/presentation/app/pages/learning/cubit/search_results/search_results_cubit.dart';
import 'package:speech_craft/presentation/app/pages/learning/learning_screen.dart';
import 'package:speech_craft/presentation/app/pages/learning/widgets/lesson_sceen/learning_page_large.dart';

class MockSearchResultsCubit extends MockCubit<SearchResultsState> implements SearchResultsCubit {}

void main() {
  late MockSearchResultsCubit mockCubit;

  setUp(() {
    mockCubit = MockSearchResultsCubit();
  });

  Widget testWidget(SearchResultsCubit cubit) {
    return MaterialApp(
      home: BlocProvider<SearchResultsCubit>(
        create: (context) => cubit,
        child: const LearningPageLarge(
          keywords: null,
        ),
      ),
    );
  }

  testWidgets(
    'LearningPageLarge displays LearningScreen with initial videoId when state is SearchResultsLoaded',
        (WidgetTester tester) async {
      whenListen(
        mockCubit,
        Stream.fromIterable(const [SearchResultsLoaded(videos: [], videoIdInitial: '123')]),
        initialState: const SearchResultsInitial(),
      );

      await tester.pumpWidget(testWidget(mockCubit));
      await tester.pump();

      expect(find.byType(LearningScreen), findsOneWidget);
      expect(find.byWidgetPredicate((widget) => widget is LearningScreen && widget.videoId == '123'), findsOneWidget);
    },
  );

  testWidgets(
    'LearningPageLarge displays LearningScreen with updated videoId when state is VideoIdChanged',
        (WidgetTester tester) async {
      whenListen(
        mockCubit,
        Stream.fromIterable(const [VideoIdChanged(videoId: '456', videos: [])]),
        initialState: const SearchResultsInitial(),
      );

      await tester.pumpWidget(testWidget(mockCubit));
      await tester.pump();

      expect(find.byType(LearningScreen), findsOneWidget);
      expect(find.byWidgetPredicate((widget) => widget is LearningScreen && widget.videoId == '456'), findsOneWidget);
    },
  );

  testWidgets(
    'LearningPageLarge displays LearningScreen with empty videoId when state is initial or any other',
        (WidgetTester tester) async {
      whenListen(
        mockCubit,
        Stream.fromIterable(const [SearchResultsInitial()]),
        initialState: const SearchResultsInitial(),
      );

      await tester.pumpWidget(testWidget(mockCubit));
      await tester.pump();

      expect(find.byType(LearningScreen), findsOneWidget);
      expect(find.byWidgetPredicate((widget) => widget is LearningScreen && widget.videoId == ''), findsOneWidget);
    },
  );
}