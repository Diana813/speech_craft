import 'dart:typed_data';

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:speech_craft/data/data_sources/feedback_data/feedback_remote_data_source.dart';
import 'package:speech_craft/data/exceptions/exceptions.dart';
import 'package:speech_craft/data/models/success_rate_response/intonation.dart';
import 'package:speech_craft/data/models/success_rate_response/transcription.dart';
import 'package:speech_craft/data/models/success_rate_response/user_success_rate.dart';
import 'package:speech_craft/data/models/upload_audio_request/time_range.dart';
import 'package:speech_craft/data/repositories/feedback_repository_impl.dart';
import 'package:speech_craft/domain/failures/failures.dart';

import 'feedback_repository_impl_test.mocks.dart';


@GenerateNiceMocks([MockSpec<FeedbackRemoteDataSource>()])
void main() {
  late FeedbackRepositoryImpl repository;
  late MockFeedbackRemoteDataSource mockDataSource;

  setUp(() {
    mockDataSource = MockFeedbackRemoteDataSource();
    repository =
        FeedbackRepositoryImpl(feedbackRemoteDataSourceImpl: mockDataSource);
  });

  group('getUserSuccessRate', () {
    const successResponse = UserSuccessRate(
      wordsAccuracy: 0.85,
      transcription:
          Transcription(lectorTranscription: '', userTranscription: ''),
      accentAccuracy: 0.5,
      accentData: [],
      intonationAccuracy: 0.5,
      intonation: Intonation(lectorIntonation: [], userIntonation: []),
      pronunciationAccuracy: 0.6,
    );

    test('should return UserSuccessRate on successful getSuccessRate',
        () async {
      when(mockDataSource.getSuccessRate())
          .thenAnswer((_) async => successResponse);

      final result = await repository.getUserSuccessRate();

      expect(result, left(successResponse));
    });

    test('should return ServerFailure on ServerException', () async {
      when(mockDataSource.getSuccessRate()).thenThrow(ServerException());

      final result = await repository.getUserSuccessRate();

      expect(result, right(ServerFailure()));
    });

    test('should return GeneralFailure on other exceptions', () async {
      when(mockDataSource.getSuccessRate()).thenThrow(Exception());

      final result = await repository.getUserSuccessRate();

      expect(result, right(GeneralFailure()));
    });
  });

  group('uploadUserAudio', () {
    final mockBytes = Uint8List.fromList([1, 2, 3]);
    const successResponse = 200;

    test('should return 200 on successful uploadAudio', () async {
      when(mockDataSource.uploadAudio(
              bytes: mockBytes, timeRange: const TimeRange(start: 0, end: 10)))
          .thenAnswer((_) async => successResponse);

      final result = await repository.uploadUserAudio(
          bytes: mockBytes, timeRange: const TimeRange(start: 0, end: 10));

      expect(result, left(successResponse));
    });

    test('should return ServerFailure on ServerException', () async {
      when(mockDataSource.uploadAudio(
              bytes: mockBytes, timeRange: const TimeRange(start: 0, end: 10)))
          .thenThrow(ServerException());

      final result = await repository.uploadUserAudio(
          bytes: mockBytes, timeRange: const TimeRange(start: 0, end: 10));

      expect(result, right(ServerFailure()));
    });

    test('should return GeneralFailure on other exceptions', () async {
      when(mockDataSource.uploadAudio(
              bytes: mockBytes, timeRange: const TimeRange(start: 0, end: 10)))
          .thenThrow(Exception());

      final result = await repository.uploadUserAudio(
          bytes: mockBytes, timeRange: const TimeRange(start: 0, end: 10));

      expect(result, right(GeneralFailure()));
    });
  });
}
