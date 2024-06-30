import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:speech_craft/data/data_sources/user_audio_data/user_audio_remote_data_source.dart';
import 'package:speech_craft/data/exceptions/exceptions.dart';

import 'user_audio_remote_data_source_test.mocks.dart';

@GenerateNiceMocks([MockSpec<http.Client>()])
void main() {
  group('UserAudioRemoteDataSourceImpl', () {
    late UserAudioRemoteDataSourceImpl dataSource;
    late MockClient mockClient;

    setUp(() {
      mockClient = MockClient();
      dataSource = UserAudioRemoteDataSourceImpl(client: mockClient);
    });

    test('fetchUserAudioUrl should return a valid URL', () async {
      final mockResponse = http.Response('audio file contents', 200);
      when(mockClient.get(any, headers: anyNamed('headers')))
          .thenAnswer((_) async => mockResponse);

      final result = await dataSource.fetchUserAudioUrl();

      expect(result, startsWith('http://'));
      expect(result.contains('/api/get_user_audio'), isTrue);
    });

    test('fetchUserAudioUrl should throw ServerException on error', () async {
      final mockResponse = http.Response('Error', 404);
      when(mockClient.get(any, headers: anyNamed('headers')))
          .thenAnswer((_) async => mockResponse);

      expect(dataSource.fetchUserAudioUrl(), throwsA(isA<ServerException>()));
    });
  });
}