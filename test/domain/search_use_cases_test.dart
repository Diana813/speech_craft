import 'package:dartz/dartz.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:speech_craft/domain/entities/search_result_entity.dart';
import 'package:speech_craft/domain/failures/failures.dart';
import 'package:speech_craft/domain/repositories/search_results_repository.dart';
import 'package:speech_craft/domain/repositories/translation_repository.dart';
import 'package:speech_craft/domain/use_cases/search_use_cases.dart';
import 'package:test/test.dart';

import 'search_use_cases_test.mocks.dart';

@GenerateNiceMocks([MockSpec<SearchResultsRepository>(), MockSpec<TranslationRepository>()])
void main() {
  group('Search Use Cases', () {
    final mockSearchResultsRepository = MockSearchResultsRepository();
    final mockTranslationRepository = MockTranslationRepository();

    final searchUseCasesUnderTest =
        SearchUseCases(searchResultsRepository: mockSearchResultsRepository, translationRepository: mockTranslationRepository);


    group('should return list of SearchResultsEntities', () {
      test('when SearchResultsRepository returns list of SearchResultsEntity',
          () async {
        //given
        const dummySearchResults = [
          SearchResultEntity(
              title: 'title',
              description: 'desc',
              thumbnailUrl: 'url',
              videoId: '1')
        ];

        when(mockSearchResultsRepository.getSearchResultsFromDatasource())
            .thenAnswer((realInvocation) => Future.value(const Left(dummySearchResults)));

        //when
        final result = await searchUseCasesUnderTest.getSearchResults();

        //then
        expect(result.isLeft(), true);
        expect(result, const Left(dummySearchResults));
        verify(mockSearchResultsRepository.getSearchResultsFromDatasource()).called(1);
        verifyNoMoreInteractions(mockSearchResultsRepository);
      });
    });


    group('should return Failure', () {
      test('when SearchResultsRepository returns Failure', () async {
            //given
            when(mockSearchResultsRepository.getSearchResultsFromDatasource())
                .thenAnswer((realInvocation) => Future.value(Right(ServerFailure())));

            //when
            final result = await searchUseCasesUnderTest.getSearchResults();

            //then
            expect(result.isRight(), true);
            expect(result, Right<List<SearchResultEntity>, Failure>(ServerFailure()));
          });
    });
  });
}
