import 'package:dartz/dartz.dart';

import '../failures/failures.dart';

abstract class UserAudioRepository {
  Future<Either<String, Failure>> fetchUserAudioUrl();
}
