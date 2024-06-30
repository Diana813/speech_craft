import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:speech_craft/data/data_sources/video_data/video_remote_data_source.dart';
import 'package:speech_craft/data/exceptions/exceptions.dart';

import 'video_remote_data_source_test.mocks.dart';

@GenerateNiceMocks([MockSpec<http.Client>()])
void main() {
  group('VideoRemoteDataSourceImpl', () {
    late VideoRemoteDataSourceImpl dataSource;
    late MockClient mockClient;

    setUp(() {
      mockClient = MockClient();
      dataSource = VideoRemoteDataSourceImpl(client: mockClient);
    });

    test('uploadVideoToCoreService should return status code 200', () async {
      final mockResponse = http.Response('video/mp4', 200);
      when(mockClient.get(any, headers: anyNamed('headers')))
          .thenAnswer((_) async => mockResponse);

      final result = await dataSource.uploadVideoToCoreService(videoId: 'abc123');

      expect(result, '200');
    });

    test('uploadVideoToCoreService should return status code 304', () async {
      final mockResponse = http.Response('video/mp4', 304);
      when(mockClient.get(any, headers: anyNamed('headers')))
          .thenAnswer((_) async => mockResponse);

      final result = await dataSource.uploadVideoToCoreService(videoId: 'abc123');

      expect(result, '304');
    });

    test('uploadVideoToCoreService should throw ServerException on error', () async {
      final mockResponse = http.Response('Error', 404);
      when(mockClient.get(any, headers: anyNamed('headers')))
          .thenAnswer((_) async => mockResponse);

      expect(dataSource.uploadVideoToCoreService(videoId: 'abc123'), throwsA(isA<ServerException>()));
    });
  });
}