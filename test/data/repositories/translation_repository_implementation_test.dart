import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:speech_craft/data/data_sources/translation_data/translation_remote_data_source.dart';
import 'package:speech_craft/data/exceptions/exceptions.dart';
import 'package:speech_craft/data/repositories/translation_repository_implementation.dart';
import 'package:speech_craft/domain/failures/failures.dart';

import 'translation_repository_implementation_test.mocks.dart';

@GenerateNiceMocks([MockSpec<TranslationRemoteDataSource>()])
void main() {
  late TranslationRepositoryImpl repository;
  late MockTranslationRemoteDataSource mockRemoteDataSource;

  setUp(() {
    mockRemoteDataSource = MockTranslationRemoteDataSource();
    repository = TranslationRepositoryImpl(
      translationRemoteDataSourceImpl: mockRemoteDataSource,
    );
  });

  group('getTranslationFromDatasource', () {
    const testKeywords = 'test keywords';
    const testLanguage = 'test language';
    const testTranslatedText = 'test translated text';

    test('should return translated text when remote data source call is successful', () async {
      // given
      when(mockRemoteDataSource.getTranslation(
        keywords: testKeywords,
        languageCode: testLanguage,
      )).thenAnswer((_) async => testTranslatedText);

      // when
      final result = await repository.getTranslationFromDatasource(
        keywords: testKeywords,
        language: testLanguage,
      );

      // then
      expect(result, equals(left(testTranslatedText)));
    });

    test('should return ServerFailure when remote data source call throws ServerException', () async {
      // given
      when(mockRemoteDataSource.getTranslation(
        keywords: testKeywords,
        languageCode: testLanguage,
      )).thenThrow(ServerException());

      // when
      final result = await repository.getTranslationFromDatasource(
        keywords: testKeywords,
        language: testLanguage,
      );

      // then
      expect(result, equals(right(ServerFailure())));
    });

    test('should return GeneralFailure when remote data source call throws an unexpected error', () async {
      // given
      when(mockRemoteDataSource.getTranslation(
        keywords: testKeywords,
        languageCode: testLanguage,
      )).thenThrow(Exception());

      // when
      final result = await repository.getTranslationFromDatasource(
        keywords: testKeywords,
        language: testLanguage,
      );

      // then
      expect(result, equals(right(GeneralFailure())));
    });
  });
}