import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:speech_craft/domain/failures/failures.dart';
import 'package:speech_craft/domain/repositories/translation_repository.dart';
import 'package:speech_craft/domain/use_cases/translation_use_cases.dart';

import 'search_use_cases_test.mocks.dart';

@GenerateNiceMocks([MockSpec<TranslationRepository>()])
void main() {
  late TranslationUseCases useCases;
  late MockTranslationRepository mockRepository;

  setUp(() {
    mockRepository = MockTranslationRepository();
    useCases = TranslationUseCases(translationRepository: mockRepository);
  });

  group('TranslationParams', () {
    test('should create TranslationParams object with default languageCode', () {
      final params = TranslationParams(sentence: 'Hello');
      expect(params.sentence, 'Hello');
      expect(params.languageCode, 'pl');
      expect(params.props, ['Hello', 'pl']);
    });

    test('should create TranslationParams object with specified languageCode', () {
      final params = TranslationParams(sentence: 'Bonjour', languageCode: 'fr');
      expect(params.sentence, 'Bonjour');
      expect(params.languageCode, 'fr');
      expect(params.props, ['Bonjour', 'fr']);
    });
  });

  group('TranslationUseCases', () {
    const mockTranslationResult = 'Translated text';

    test('should return translated text on successful getTranslation', () async {
      final params = TranslationParams(sentence: 'Hello', languageCode: 'en');
      when(mockRepository.getTranslationFromDatasource(
          keywords: 'Hello', language: 'en'))
          .thenAnswer((_) async => const Left(mockTranslationResult));

      final result = await useCases.call(params: params);

      expect(result, const Left(mockTranslationResult));
    });

    test('should return empty string when sentence is null', () async {
      final params = TranslationParams(sentence: null, languageCode: 'en');

      final result = await useCases.call(params: params);

      expect(result, const Left(''));
    });

    test('should return GeneralFailure on other exceptions', () async {
      final params = TranslationParams(sentence: 'Hello', languageCode: 'en');
      when(mockRepository.getTranslationFromDatasource(
          keywords: 'Hello', language: 'en'))
          .thenAnswer((_) async => Right(GeneralFailure()));

      final result = await useCases.call(params: params);

      expect(result, Right(GeneralFailure()));
    });
  });
}
