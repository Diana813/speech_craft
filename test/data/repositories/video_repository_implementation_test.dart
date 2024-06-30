import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:speech_craft/data/data_sources/video_data/video_remote_data_source.dart';
import 'package:speech_craft/data/exceptions/exceptions.dart';
import 'package:speech_craft/data/repositories/video_repository_implementation.dart';
import 'package:speech_craft/domain/failures/failures.dart';

import 'video_repository_implementation_test.mocks.dart';

@GenerateNiceMocks([MockSpec<VideoRemoteDataSource>()])
void main() {
  late VideoRepositoryImpl repository;
  late MockVideoRemoteDataSource mockDataSource;

  setUp(() {
    mockDataSource = MockVideoRemoteDataSource();
    repository = VideoRepositoryImpl(videoRemoteDataSourceImpl: mockDataSource);
  });

  group('uploadVideo', () {
    const dummyVideoId = 'abc123';
    const successResponse = '200';

    test('should return 200 on successful uploadVideo', () async {
      when(mockDataSource.uploadVideoToCoreService(videoId: dummyVideoId))
          .thenAnswer((_) async => successResponse);

      final result = await repository.uploadVideo(videoId: dummyVideoId);

      expect(result, left(successResponse));
      verify(mockDataSource.uploadVideoToCoreService(videoId: dummyVideoId)).called(1);
    });

    test('should return ServerFailure on ServerException', () async {
      when(mockDataSource.uploadVideoToCoreService(videoId: dummyVideoId))
          .thenThrow(ServerException());

      final result = await repository.uploadVideo(videoId: dummyVideoId);

      expect(result, right(ServerFailure()));
      verify(mockDataSource.uploadVideoToCoreService(videoId: dummyVideoId)).called(1);
    });

    test('should return GeneralFailure on other exceptions', () async {
      when(mockDataSource.uploadVideoToCoreService(videoId: dummyVideoId))
          .thenThrow(Exception());

      final result = await repository.uploadVideo(videoId: dummyVideoId);

      expect(result, right(GeneralFailure()));
      verify(mockDataSource.uploadVideoToCoreService(videoId: dummyVideoId)).called(1);
    });
  });
}