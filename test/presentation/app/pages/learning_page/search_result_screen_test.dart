import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:speech_craft/common/strings.dart';
import 'package:speech_craft/presentation/app/pages/learning_page/cubit/search_results/search_results_cubit.dart';
import 'package:speech_craft/presentation/app/pages/learning_page/search_results_fragment.dart';
import 'package:speech_craft/presentation/app/pages/learning_page/widgets/search_fragment/search_results_list.dart';

class MockSearchResultsCubit extends MockCubit<SearchResultsState>
    implements SearchResultsCubit {}

void main() {
  late MockSearchResultsCubit mockCubit;

  setUp(() {
    mockCubit = MockSearchResultsCubit();
  });

  Widget testWidget(SearchResultsCubit cubit) {
    return MaterialApp(
      home: BlocProvider<SearchResultsCubit>(
        create: (context) => cubit,
        child: const SearchResults(
          searchKeyWords: null,
        ),
      ),
    );
  }

  testWidgets(
      'SearchResults displays loading indicator when state is SearchResultsLoading',
      (WidgetTester tester) async {
    whenListen(mockCubit, Stream.fromIterable(const [SearchResultsLoading()]),
        initialState: const SearchResultsInitial());

    await tester.pumpWidget(testWidget(mockCubit));
    await tester.pump();

    expect(find.byType(CircularProgressIndicator), findsOneWidget);
  });

  testWidgets(
      'SearchResults displays SearchResultsList when state is SearchResultsLoaded',
      (WidgetTester tester) async {
    whenListen(
        mockCubit,
        Stream.fromIterable(
            const [SearchResultsLoaded(videos: [], videoIdInitial: '')]),
        initialState: const SearchResultsInitial());

    await tester.pumpWidget(testWidget(mockCubit));
    await tester.pump();

    expect(find.byType(SearchResultsList), findsOneWidget);
  });

  testWidgets(
    'SearchResults displays error message when state is SearchResultsAtError',
    (WidgetTester tester) async {
      whenListen(
        mockCubit,
        Stream.fromIterable(
          const [
            SearchResultsAtError(errorMessage: 'Error: $generalErrorMessage')
          ],
        ),
        initialState: const SearchResultsInitial(),
      );

      await tester.pumpWidget(testWidget(mockCubit));
      await tester.pump();

      expect(
          find.textContaining('Error: $generalErrorMessage'), findsOneWidget);
    },
  );

  testWidgets(
    'SearchResults displays SearchResultsList when state is VideoIdChanged',
        (WidgetTester tester) async {
      whenListen(
        mockCubit,
        Stream.fromIterable(
          const [VideoIdChanged(videoId: '1', videos: [])],
        ),
        initialState: const SearchResultsInitial(),
      );

      await tester.pumpWidget(testWidget(mockCubit));
      await tester.pump();

      expect(find.byType(SearchResultsList), findsOneWidget);
    },
  );
}
