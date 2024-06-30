import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:speech_craft/data/models/pauses_response/timestamps.dart';
import 'package:speech_craft/domain/failures/failures.dart';
import 'package:speech_craft/domain/repositories/pauses_repository.dart';
import 'package:speech_craft/domain/repositories/video_repository.dart';
import 'package:speech_craft/domain/use_cases/video_use_cases.dart';

import 'upload_video_use_cases_test.mocks.dart';

@GenerateNiceMocks([MockSpec<VideoRepository>(), MockSpec<PausesRepository>()])
void main() {
  late UploadVideoUseCase useCase;
  late MockVideoRepository mockVideoRepository;
  late MockPausesRepository mockPausesRepository;

  setUp(() {
    mockVideoRepository = MockVideoRepository();
    mockPausesRepository = MockPausesRepository();
    useCase = UploadVideoUseCase(
      videoRepository: mockVideoRepository,
      pausesRepository: mockPausesRepository,
    );
  });

  group('UploadVideoUseCase', () {
    const videoId = 'abc123';
    const mockTimestamps = [Timestamp(millis: 10), Timestamp(millis: 20)];

    test('should return timestamps on successful uploadVideo and getPauses', () async {
      when(mockVideoRepository.uploadVideo(videoId: videoId))
          .thenAnswer((_) async => const Left(videoId));

      when(mockPausesRepository.getPauses(videoId: videoId))
          .thenAnswer((_) async => const Left(mockTimestamps));

      final result = await useCase.call(params: VideoUrlParams(videoId: videoId));

      expect(result, const Left(mockTimestamps));
    });

    test('should return ServerFailure on ServerException during uploadVideo', () async {
      when(mockVideoRepository.uploadVideo(videoId: videoId))
          .thenAnswer((_) async => Right(ServerFailure()));

      final result = await useCase.call(params: VideoUrlParams(videoId: videoId));

      expect(result, Right(ServerFailure()));
    });

    test('should return GeneralFailure on other exceptions during uploadVideo', () async {
      when(mockVideoRepository.uploadVideo(videoId: videoId))
          .thenAnswer((_) async => const Left(videoId));

      when(mockPausesRepository.getPauses(videoId: videoId))
          .thenAnswer((_) async => Right(GeneralFailure()));

      final result = await useCase.call(params: VideoUrlParams(videoId: videoId));

      expect(result, Right(GeneralFailure()));
    });
  });
}