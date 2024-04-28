import 'package:dartz/dartz.dart';

import '../failures/failures.dart';
import '../repositories/region_code_repository.dart';

class RegionCodeUseCases {
  final RegionCodeRepository regionCodeRepository;

  RegionCodeUseCases({required this.regionCodeRepository});

  Future<Either<String, Failure>> getRegionCode(
      {required String country}) async {
    return await regionCodeRepository.getRegionCodeFromDatasource(
        country: country);
  }
}
