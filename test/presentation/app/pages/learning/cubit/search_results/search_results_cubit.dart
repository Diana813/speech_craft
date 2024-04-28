import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:speech_craft/common/strings.dart';
import 'package:speech_craft/domain/entities/search_result_entity.dart';
import 'package:speech_craft/domain/failures/failures.dart';
import 'package:speech_craft/domain/use_cases/search_use_cases.dart';
import 'package:speech_craft/presentation/app/pages/learning/cubit/search_results/search_results_cubit.dart';

import 'search_results_cubit.mocks.dart';

@GenerateNiceMocks([MockSpec<SearchUseCases>()])
void main() {
  group('SearchResultsCubit', () {
    final mockSearchUseCases = MockSearchUseCases();
    const dummySearchResults = [
      SearchResultEntity(
          title: 'title',
          description: 'desc',
          thumbnailUrl: 'url',
          videoId: '1')
    ];

    group('should emit', () {
      blocTest<SearchResultsCubit, SearchResultsState>(
          'nothing when no method was called',
          build: () => SearchResultsCubit(searchUseCases: mockSearchUseCases),
          expect: () => const <SearchResultsState>[]);

      blocTest<SearchResultsCubit, SearchResultsState>(
          '[SearchResultsLoading, SearchResultsLoaded] when onSearchParamsSubmitted() was called',
          setUp: () => when(mockSearchUseCases.getSearchResults()).thenAnswer(
              (realInvocation) => Future.value(
                  const Left<List<SearchResultEntity>, Failure>(
                      dummySearchResults))),
          build: () => SearchResultsCubit(searchUseCases: mockSearchUseCases),
          act: (cubit) => cubit.onSearchParamsSubmitted(),
          expect: () => const <SearchResultsState>[
                SearchResultsLoading(),
                SearchResultsLoaded(videos: dummySearchResults)
              ]);

      blocTest<SearchResultsCubit, SearchResultsState>(
          '[SearchResultsLoading, SearchResultsAtError] when onSearchParamsSubmitted() was called and ServerError occurred',
          setUp: () => when(mockSearchUseCases.getSearchResults()).thenAnswer(
              (realInvocation) => Future.value(
                  Right<List<SearchResultEntity>, Failure>(ServerFailure()))),
          build: () => SearchResultsCubit(searchUseCases: mockSearchUseCases),
          act: (cubit) => cubit.onSearchParamsSubmitted(),
          expect: () => const <SearchResultsState>[
                SearchResultsLoading(),
                SearchResultsAtError(errorMessage: apiFailureErrorMessage),
              ]);

      blocTest<SearchResultsCubit, SearchResultsState>(
          '[SearchResultsLoading, SearchResultsAtError] when onSearchParamsSubmitted() was called and GeneralError occurred',
          setUp: () => when(mockSearchUseCases.getSearchResults()).thenAnswer(
                  (realInvocation) => Future.value(
                  Right<List<SearchResultEntity>, Failure>(GeneralFailure()))),
          build: () => SearchResultsCubit(searchUseCases: mockSearchUseCases),
          act: (cubit) => cubit.onSearchParamsSubmitted(),
          expect: () => const <SearchResultsState>[
            SearchResultsLoading(),
            SearchResultsAtError(errorMessage: generalErrorMessage),
          ]);
    });
  });
}
