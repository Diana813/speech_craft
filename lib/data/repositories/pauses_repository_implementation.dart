import 'package:dartz/dartz.dart';

import '../../domain/failures/failures.dart';
import '../../domain/repositories/pauses_repository.dart';
import '../data_sources/video_data/pauses_remote_source.dart';
import '../exceptions/exceptions.dart';
import '../models/pauses_response/timestamps.dart';

class PausesRepositoryImpl implements PausesRepository {
  final PausesRemoteDataSource pausesRemoteDataSourceImpl;

  PausesRepositoryImpl({required this.pausesRemoteDataSourceImpl});

  @override
  Future<Either<List<Timestamp>, Failure>> getPauses({required String videoId}) async {
    try {
      final response = await pausesRemoteDataSourceImpl.getPauses(videoId: videoId);
      return left(response);
    } on ServerException catch (_) {
      return right(ServerFailure());
    } catch (e) {
      return right(GeneralFailure());
    }
  }
}