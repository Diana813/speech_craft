import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:speech_craft/data/data_sources/video_data/pauses_remote_source.dart';
import 'package:speech_craft/data/exceptions/exceptions.dart';
import 'package:speech_craft/data/models/pauses_response/timestamps.dart';
import 'package:speech_craft/data/repositories/pauses_repository_implementation.dart';
import 'package:speech_craft/domain/failures/failures.dart';

import 'pauses_repository_implementation_test.mocks.dart';

@GenerateNiceMocks([MockSpec<PausesRemoteDataSource>()])
void main() {
  late PausesRepositoryImpl repository;
  late MockPausesRemoteDataSource mockDataSource;

  setUp(() {
    mockDataSource = MockPausesRemoteDataSource();
    repository = PausesRepositoryImpl(pausesRemoteDataSourceImpl: mockDataSource);
  });

  group('getPauses', () {
    const videoId = 'abc123';

    final successResponse = [
      const Timestamp(millis: 10.0),
      const Timestamp(millis: 45.0),
      const Timestamp(millis: 30.0),
    ];

    test('should return list of Timestamps on successful getPauses', () async {
      when(mockDataSource.getPauses(videoId: videoId)).thenAnswer((_) async => successResponse);

      final result = await repository.getPauses(videoId: videoId);

      expect(result, left(successResponse));
    });

    test('should return ServerFailure on ServerException', () async {
      when(mockDataSource.getPauses(videoId: videoId)).thenThrow(ServerException());

      final result = await repository.getPauses(videoId: videoId);

      expect(result, right(ServerFailure()));
    });

    test('should return GeneralFailure on other exceptions', () async {
      when(mockDataSource.getPauses(videoId: videoId)).thenThrow(Exception());

      final result = await repository.getPauses(videoId: videoId);

      expect(result, right(GeneralFailure()));
    });
  });
}