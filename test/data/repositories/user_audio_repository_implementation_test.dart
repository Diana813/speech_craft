import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:speech_craft/data/data_sources/user_audio_data/user_audio_remote_data_source.dart';
import 'package:speech_craft/data/exceptions/exceptions.dart';
import 'package:speech_craft/data/repositories/user_audio_repository_impl.dart';
import 'package:speech_craft/domain/failures/failures.dart';

import 'user_audio_repository_implementation_test.mocks.dart';

@GenerateNiceMocks([MockSpec<UserAudioRemoteDataSource>()])
void main() {
  late UserAudioRepositoryImpl repository;
  late MockUserAudioRemoteDataSource mockDataSource;

  setUp(() {
    mockDataSource = MockUserAudioRemoteDataSource();
    repository = UserAudioRepositoryImpl(userAudioRemoteDataSource: mockDataSource);
  });

  group('fetchUserAudioUrl', () {
    const dummyUrl = 'http://example.com/audio.wav';

    test('should return audio URL on successful fetchUserAudioUrl', () async {
      when(mockDataSource.fetchUserAudioUrl()).thenAnswer((_) async => dummyUrl);

      final result = await repository.fetchUserAudioUrl();

      expect(result, left(dummyUrl));
      verify(mockDataSource.fetchUserAudioUrl()).called(1);
    });

    test('should return ServerFailure on ServerException', () async {
      when(mockDataSource.fetchUserAudioUrl()).thenThrow(ServerException());

      final result = await repository.fetchUserAudioUrl();

      expect(result, right(ServerFailure()));
      verify(mockDataSource.fetchUserAudioUrl()).called(1);
    });

    test('should return GeneralFailure on other exceptions', () async {
      when(mockDataSource.fetchUserAudioUrl()).thenThrow(Exception());

      final result = await repository.fetchUserAudioUrl();

      expect(result, right(GeneralFailure()));
      verify(mockDataSource.fetchUserAudioUrl()).called(1);
    });
  });
}