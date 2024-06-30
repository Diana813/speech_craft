import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:speech_craft/data/data_sources/video_data/pauses_remote_source.dart';
import 'package:speech_craft/data/exceptions/exceptions.dart';
import 'package:speech_craft/data/models/pauses_response/timestamps.dart';
import 'package:http/http.dart' as http;

import 'pauses_remote_source_test.mocks.dart';

@GenerateNiceMocks([MockSpec<http.Client>()])
void main() {
  group('PausesRemoteDataSourceImpl', () {
    late PausesRemoteDataSourceImpl dataSource;
    late MockClient mockClient;

    setUp(() {
      mockClient = MockClient();
      dataSource = PausesRemoteDataSourceImpl(client: mockClient);
    });

    test('getPauses should return a list of Timestamps', () async {
      final mockResponse = http.Response(json.encode([
        {'millis': '10.0'},
        {'millis': '45.0'},
        {'millis': '30.0'},
      ]), 200);
      when(mockClient.get(any)).thenAnswer((_) async => mockResponse);

      final result = await dataSource.getPauses(videoId: 'abc123');

      expect(result, isA<List<Timestamp>>());
      expect(result.length, 3);
      expect(result[0].millis, 10.0);
      expect(result[1].millis, 45.0);
      expect(result[2].millis, 30.0);
    });

    test('getPauses should throw ServerException on error', () async {
      final mockResponse = http.Response('Error', 404);
      when(mockClient.get(any)).thenAnswer((_) async => mockResponse);

      expect(dataSource.getPauses(videoId: 'abc123'), throwsA(isA<ServerException>()));
    });
  });
}