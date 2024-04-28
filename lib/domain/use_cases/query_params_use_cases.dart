import 'package:speech_craft/domain/entities/language_entity.dart';

import '../entities/region_code_entity.dart';
import '../repositories/query_params_repository.dart';

class QueryParamsUseCases {
  final QueryParamsRepository queryParamsRepository;

  QueryParamsUseCases({required this.queryParamsRepository});

  List<LanguageEntity> getLanguages() {
    return queryParamsRepository.getLanguagesFromDatasource();
  }

  List<RegionCodeEntity> getRegionCodes() {
    return queryParamsRepository.getRegionCodesFromDatasource();
  }
}
