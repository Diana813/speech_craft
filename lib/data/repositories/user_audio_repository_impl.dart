import 'package:dartz/dartz.dart';
import 'package:speech_craft/data/data_sources/user_audio_data/user_audio_remote_data_source.dart';
import 'package:speech_craft/domain/failures/failures.dart';
import 'package:speech_craft/domain/repositories/user_audio_repository.dart';

import '../exceptions/exceptions.dart';

class UserAudioRepositoryImpl implements UserAudioRepository {
  final UserAudioRemoteDataSource userAudioRemoteDataSource;

  UserAudioRepositoryImpl({required this.userAudioRemoteDataSource});

  @override
  Future<Either<String, Failure>> fetchUserAudioUrl() async {
    try {
      final response = await userAudioRemoteDataSource.fetchUserAudioUrl();
      return left(response);
    } on ServerException catch (_) {
      return right(ServerFailure());
    } catch (e) {
      return right(GeneralFailure());
    }
  }
}
