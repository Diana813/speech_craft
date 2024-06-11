import 'package:dartz/dartz.dart';
import 'package:speech_craft/data/models/pauses_response/timestamps.dart';

import '../failures/failures.dart';

abstract class PausesRepository {
  Future<Either<List<Timestamp>, Failure>> getPauses({required String videoId});
}
