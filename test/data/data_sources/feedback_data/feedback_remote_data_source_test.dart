import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:speech_craft/data/data_sources/feedback_data/feedback_remote_data_source.dart';
import 'package:speech_craft/data/exceptions/exceptions.dart';
import 'package:speech_craft/data/models/success_rate_response/user_success_rate.dart';

import 'feedback_remote_data_source_test.mocks.dart';

@GenerateNiceMocks([MockSpec<http.Client>()])
void main() {
  late FeedbackRemoteDataSourceImpl dataSource;
  late MockClient mockClient;

  final host = kIsWeb
      ? '127.0.0.1'
      : Platform.isAndroid
      ? '192.168.1.165'
      : '127.0.0.1';

  Uri url = Uri(
    scheme: 'http',
    host: host,
    port: 5000,
    path: '/api/get_user_success_rate',
  );


  setUp(() {
    mockClient = MockClient();
    dataSource = FeedbackRemoteDataSourceImpl(client: mockClient);
  });

  group('getSuccessRate', () {
    test('returns UserSuccessRate if the http call completes successfully', () async {
      final mockResponse = http.Response(json.encode({
        'wordsAccuracy': 0.85,
        'transcription': {
          'lectorTranscription': 'example lector transcription',
          'userTranscription': 'example user transcription'
        },
        'accentAccuracy': 0.9,
        'accent': [
          {
            'word': 'example',
            'sampled_audio_lector': [0.1, 0.2, 0.3],
            'sampled_audio_user': [0.1, 0.2, 0.3]
          }
        ],
        'intonationAccuracy': 0.8,
        'intonation': {
          'lectorIntonation': [0.1, 0.2, 0.3],
          'userIntonation': [0.1, 0.2, 0.3]
        },
        'pronunciationAccuracy': 0.87,
      }), 200);
      when(mockClient.get(url)).thenAnswer((_) async => mockResponse);

      final result = await dataSource.getSuccessRate();

      expect(result, isA<UserSuccessRate>());
      expect(result.wordsAccuracy, 0.85);
      expect(result.transcription.lectorTranscription, 'example lector transcription');
      expect(result.transcription.userTranscription, 'example user transcription');
      expect(result.accentAccuracy, 0.9);
      expect(result.accentData[0].word, 'example');
      expect(result.accentData[0].sampledAudioLector, [0.1, 0.2, 0.3]);
      expect(result.accentData[0].sampledAudioUser, [0.1, 0.2, 0.3]);
      expect(result.intonationAccuracy, 0.8);
      expect(result.intonation.lectorIntonation, [0.1, 0.2, 0.3]);
      expect(result.intonation.userIntonation, [0.1, 0.2, 0.3]);
      expect(result.pronunciationAccuracy, 0.87);
    });

    test('throws ServerException if the http call completes with an error', () async {
      final mockResponse = http.Response('Error', 404);
      when(mockClient.get(url)).thenAnswer((_) async => mockResponse);

      expect(dataSource.getSuccessRate(), throwsA(isA<ServerException>()));
    });
  });
}
