import 'package:speech_craft/domain/entities/language_entity.dart';

import '../entities/region_code_entity.dart';
import '../repositories/search_query_params_repository.dart';

class SearchQueryParamsUseCases {
  final SearchQueryParamsRepository queryParamsRepository;

  SearchQueryParamsUseCases({required this.queryParamsRepository});

  List<LanguageEntity> getLanguages() {
    return queryParamsRepository.getLanguagesFromDatasource();
  }

  List<RegionCodeEntity> getRegionCodes() {
    return queryParamsRepository.getRegionCodesFromDatasource();
  }
}
