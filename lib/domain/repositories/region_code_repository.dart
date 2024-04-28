import 'package:dartz/dartz.dart';

import '../failures/failures.dart';

abstract class RegionCodeRepository {
  Future<Either<String, Failure>> getRegionCodeFromDatasource(
      {required String country});
}
