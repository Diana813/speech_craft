import 'package:dartz/dartz.dart';

import '../../domain/failures/failures.dart';
import '../../domain/repositories/video_repository.dart';
import '../data_sources/video_data/video_remote_data_source.dart';
import '../exceptions/exceptions.dart';

class VideoRepositoryImpl implements VideoRepository {
  final VideoRemoteDataSource videoRemoteDataSourceImpl;

  VideoRepositoryImpl({required this.videoRemoteDataSourceImpl});

  @override
  Future<Either<String, Failure>> uploadVideo({required String videoId}) async {
    try {
      final response = await videoRemoteDataSourceImpl.uploadVideoToCoreService(
          videoId: videoId);
      return left(response);
    } on ServerException catch (_) {
      return right(ServerFailure());
    } catch (e) {
      return right(GeneralFailure());
    }
  }
}
