import 'dart:typed_data';

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:speech_craft/data/models/success_rate_response/intonation.dart';
import 'package:speech_craft/data/models/success_rate_response/transcription.dart';
import 'package:speech_craft/data/models/success_rate_response/user_success_rate.dart';
import 'package:speech_craft/data/models/upload_audio_request/time_range.dart';
import 'package:speech_craft/domain/failures/failures.dart';
import 'package:speech_craft/domain/repositories/feedback_repository.dart';
import 'package:speech_craft/domain/use_cases/feedback_use_cases.dart';

import 'feedback_use_cases_test.mocks.dart';

@GenerateNiceMocks([MockSpec<FeedbackRepository>()])
void main() {
  late FeedbackUseCases useCases;
  late MockFeedbackRepository mockRepository;

  setUp(() {
    mockRepository = MockFeedbackRepository();
    useCases = FeedbackUseCases(feedbackRepository: mockRepository);
  });

  group('FeedbackUseCases', () {
    final mockBytes = Uint8List.fromList([1, 2, 3]);
    const mockTimeRange = TimeRange(start: 0, end: 10);
    const successRateResponse = UserSuccessRate(
      wordsAccuracy: 0.85,
      transcription:
          Transcription(lectorTranscription: '', userTranscription: ''),
      accentAccuracy: 0.5,
      accentData: [],
      intonationAccuracy: 0.5,
      intonation: Intonation(lectorIntonation: [], userIntonation: []),
      pronunciationAccuracy: 0.6,
    );

    test('should return UserSuccessRate on successful call', () async {
      when(mockRepository.uploadUserAudio(
              bytes: mockBytes, timeRange: mockTimeRange))
          .thenAnswer((_) async => left(0));

      when(mockRepository.getUserSuccessRate())
          .thenAnswer((_) async => left(successRateResponse));

      final result = await useCases.call(
          params: FeedbackRequestParams(
              bytes: mockBytes, timeRange: mockTimeRange));

      expect(result, left(successRateResponse));
      verify(mockRepository.uploadUserAudio(
              bytes: mockBytes, timeRange: mockTimeRange))
          .called(1);
      verify(mockRepository.getUserSuccessRate()).called(1);
    });

    test('should return ServerFailure on upload failure', () async {
      when(mockRepository.uploadUserAudio(
              bytes: mockBytes, timeRange: mockTimeRange))
          .thenAnswer((_) async => right(ServerFailure()));

      final result = await useCases.call(
          params: FeedbackRequestParams(
              bytes: mockBytes, timeRange: mockTimeRange));

      expect(result, right(ServerFailure()));
      verify(mockRepository.uploadUserAudio(
              bytes: mockBytes, timeRange: mockTimeRange))
          .called(1);
      verifyNever(mockRepository.getUserSuccessRate());
    });

    test('should return ServerFailure on getUserSuccessRate failure', () async {
      when(mockRepository.uploadUserAudio(
              bytes: mockBytes, timeRange: mockTimeRange))
          .thenAnswer((_) async => left(0));

      when(mockRepository.getUserSuccessRate())
          .thenAnswer((_) async => right(ServerFailure()));

      final result = await useCases.call(
          params: FeedbackRequestParams(
              bytes: mockBytes, timeRange: mockTimeRange));

      expect(result, right(ServerFailure()));
      verify(mockRepository.uploadUserAudio(
              bytes: mockBytes, timeRange: mockTimeRange))
          .called(1);
      verify(mockRepository.getUserSuccessRate()).called(1);
    });

    test('should return GeneralFailure on other exceptions', () async {
      when(mockRepository.uploadUserAudio(
              bytes: mockBytes, timeRange: mockTimeRange))
          .thenAnswer((_) async => left(0));

      when(mockRepository.getUserSuccessRate())
          .thenAnswer((_) async => right(GeneralFailure()));

      final result = await useCases.call(
          params: FeedbackRequestParams(
              bytes: mockBytes, timeRange: mockTimeRange));

      expect(result, right(GeneralFailure()));
      verify(mockRepository.uploadUserAudio(
              bytes: mockBytes, timeRange: mockTimeRange))
          .called(1);
      verify(mockRepository.getUserSuccessRate()).called(1);
    });
  });
}
