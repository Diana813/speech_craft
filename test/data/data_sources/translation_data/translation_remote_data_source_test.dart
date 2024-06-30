import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:speech_craft/data/data_sources/translation_data/translation_remote_data_source.dart';
import 'package:speech_craft/data/data_sources/translation_data/translation_request_builder.dart';
import 'package:speech_craft/data/exceptions/exceptions.dart';

import 'translation_remote_data_source_test.mocks.dart';

@GenerateNiceMocks([MockSpec<TranslationRequestBuilder>()])
void main() {
  group('TranslationRemoteDataSourceImpl', () {
    late TranslationRemoteDataSourceImpl dataSource;
    late MockTranslationRequestBuilder mockTranslationRequestBuilder;

    setUp(() {
      mockTranslationRequestBuilder = MockTranslationRequestBuilder();
      dataSource = TranslationRemoteDataSourceImpl(builder: mockTranslationRequestBuilder);
    });

    group('getTranslation', () {
      final mockResponse = jsonEncode({
        'data': {
          'translations': [
            {'translatedText': 'translated text'}
          ]
        }
      });

      final mockErrorResponse = jsonEncode({
        'error': {
          'message': 'Bad request'
        }
      });


      test('should return translated text when the response is successful',
          () async {
        // given
        when(mockTranslationRequestBuilder.post()).thenAnswer(
            (realInvocation) => Future.value(http.Response(mockResponse, 200)));

        // when
        final result = await dataSource.getTranslation(
            keywords: 'text', languageCode: 'en');

        // then
        expect(result, 'translated text');
      });


      test('should throw ServerException when response is not successful',
          () async {
        // given
        when(mockTranslationRequestBuilder.post()).thenAnswer(
            (realInvocation) => Future.value(http.Response(mockErrorResponse, 403)));

        // then
        expect(
            () async => await dataSource.getTranslation(
                keywords: 'translated text', languageCode: 'en'),
            throwsA(const TypeMatcher<ServerException>()));
      });
    });
  });
}
