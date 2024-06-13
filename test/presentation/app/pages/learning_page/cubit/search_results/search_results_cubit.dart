import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:speech_craft/common/strings.dart';
import 'package:speech_craft/domain/entities/search_result_entity.dart';
import 'package:speech_craft/domain/failures/failures.dart';
import 'package:speech_craft/domain/use_cases/search_use_cases.dart';
import 'package:speech_craft/presentation/app/pages/learning_page/cubit/search_results/search_results_cubit.dart';

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
        videoId: '1',
      ),
    ];

    blocTest<SearchResultsCubit, SearchResultsState>(
      'nothing when no method was called',
      build: () => SearchResultsCubit(searchUseCases: mockSearchUseCases),
      expect: () => const <SearchResultsState>[],
    );

    blocTest<SearchResultsCubit, SearchResultsState>(
      '[SearchResultsLoading, SearchResultsLoaded] when onSearchParamsSubmitted() was called',
      setUp: () {
        final params = SearchParams(
          keywords: 'test',
          regionCode: 'US',
          languageCode: 'en',
        );
        when(mockSearchUseCases.call(params: params)).thenAnswer(
              (_) async => const Left(dummySearchResults),
        );
      },
      build: () => SearchResultsCubit(searchUseCases: mockSearchUseCases),
      act: (cubit) => cubit.onSearchParamsSubmitted(
        keywords: 'test',
        regionCode: 'US',
        languageCode: 'en',
      ),
      expect: () => [
        const SearchResultsLoading(),
        const SearchResultsLoaded(
          videos: dummySearchResults,
        ),
      ],
    );

    blocTest<SearchResultsCubit, SearchResultsState>(
      '[SearchResultsLoading, SearchResultsAtError] when onSearchParamsSubmitted() was called and ServerError occurred',
      setUp: () {
        final params = SearchParams(
          keywords: 'test',
          regionCode: 'US',
          languageCode: 'en',
        );
        when(mockSearchUseCases.call(params: params)).thenAnswer(
              (_) async => Right(ServerFailure()),
        );
      },
      build: () => SearchResultsCubit(searchUseCases: mockSearchUseCases),
      act: (cubit) => cubit.onSearchParamsSubmitted(
        keywords: 'test',
        regionCode: 'US',
        languageCode: 'en',
      ),
      expect: () => [
        const SearchResultsLoading(),
        const SearchResultsAtError(errorMessage: apiFailureErrorMessage),
      ],
    );

    blocTest<SearchResultsCubit, SearchResultsState>(
      '[SearchResultsLoading, SearchResultsAtError] when onSearchParamsSubmitted() was called and GeneralError occurred',
      setUp: () {
        final params = SearchParams(
          keywords: 'test',
          regionCode: 'US',
          languageCode: 'en',
        );
        when(mockSearchUseCases.call(params: params)).thenAnswer(
              (_) async => Right(GeneralFailure()),
        );
      },
      build: () => SearchResultsCubit(searchUseCases: mockSearchUseCases),
      act: (cubit) => cubit.onSearchParamsSubmitted(
        keywords: 'test',
        regionCode: 'US',
        languageCode: 'en',
      ),
      expect: () => [
        const SearchResultsLoading(),
        const SearchResultsAtError(errorMessage: generalErrorMessage),
      ],
    );

    blocTest<SearchResultsCubit, SearchResultsState>(
      '[VideoIdChanged] when onSelectedItemChanged() was called',
      build: () => SearchResultsCubit(searchUseCases: mockSearchUseCases),
      act: (cubit) => cubit.onSelectedItemChanged(
        videoId: '2',
        videos: dummySearchResults,
      ),
      expect: () => [
        const VideoIdChanged(
          videoId: '2',
          videos: dummySearchResults,
        ),
      ],
    );
  });
}