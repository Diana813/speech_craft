import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:speech_craft/common/strings.dart';
import 'package:speech_craft/presentation/app/pages/learning/cubit/search_results/search_results_cubit.dart';
import 'package:speech_craft/presentation/app/pages/learning/search_results_screen.dart';
import 'package:speech_craft/presentation/app/pages/learning/widgets/search__screen/search_results_list.dart';

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
        child: const SearchResults(searchKeyWords: null,),
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
        mockCubit, Stream.fromIterable(const [SearchResultsLoaded(videos: [])]),
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
          const [SearchResultsAtError(errorMessage: 'Error: $generalErrorMessage')],
        ),
        initialState: const SearchResultsInitial(),
      );

      await tester.pumpWidget(testWidget(mockCubit));
      await tester.pump();

      expect(find.textContaining('Error: $generalErrorMessage'), findsOneWidget);
    },
  );
}
