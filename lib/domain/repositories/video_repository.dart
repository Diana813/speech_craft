import 'package:dartz/dartz.dart';

import '../failures/failures.dart';

abstract class VideoRepository {
  Future<Either<String, Failure>> uploadVideo({required String videoId});
}
