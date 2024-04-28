import 'package:dartz/dartz.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:speech_craft/data/data_sources/search_results_remote_data_source.dart';
import 'package:speech_craft/data/exceptions/exceptions.dart';
import 'package:speech_craft/data/repositories/search_result_repository_implementation.dart';
import 'package:speech_craft/domain/entities/search_result_entity.dart';
import 'package:speech_craft/domain/failures/failures.dart';
import 'package:test/test.dart';

import 'search_result_repository_implementation_test.mocks.dart';
import 'search_results_dummy_data.dart';

@GenerateNiceMocks([MockSpec<SearchResultsRemoteDataSource>()])
void main() {
  group('Search Result Repository Impl', () {
    final mockSearchResultsRemoteDataSource =
        MockSearchResultsRemoteDataSource();
    final searchResultRepositoryUnderTest = SearchResultsRepositoryImpl(
        searchResultsRemoteDataSourceImpl: mockSearchResultsRemoteDataSource);


    group('should return SearchRepositoryEntity', () {
      test('when SearchResultsRemoteDataSource returns list of SearchResults', () async {
        //given
        when(mockSearchResultsRemoteDataSource.getListOfVideos())
            .thenAnswer((realInvocation) => Future.value(dummySearchResults));

        //when
        final result = await searchResultRepositoryUnderTest
            .getSearchResultsFromDatasource();

        //then
        expect(result.isLeft(), true);
        expect(result.toString(), expectedSearchResultsEntity.toString());
        verify(mockSearchResultsRemoteDataSource.getListOfVideos()).called(1);
        verifyNoMoreInteractions(mockSearchResultsRemoteDataSource);
      });
    });


    group('should return Failure', () {
      test('when SearchResultsRemoteDataSource returns Server Error', () async {
        //given
        when(mockSearchResultsRemoteDataSource.getListOfVideos())
            .thenThrow(ServerException());

        //when
        final result = await searchResultRepositoryUnderTest
            .getSearchResultsFromDatasource();

        //then
        expect(result.isRight(), true);
        expect(result, Right<List<SearchResultEntity>, Failure>(ServerFailure()));
      });


      test('when SearchResultsRemoteDataSource returns Type Error', () async {
        //given
        when(mockSearchResultsRemoteDataSource.getListOfVideos())
            .thenThrow(TypeError());

        //when
        final result = await searchResultRepositoryUnderTest
            .getSearchResultsFromDatasource();

        //then
        expect(result.isRight(), true);
        expect(result, Right<List<SearchResultEntity>, Failure>(GeneralFailure()));
      });
    });
  });
}
