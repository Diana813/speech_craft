import 'package:speech_craft/domain/entities/language_entity.dart';
import 'package:speech_craft/domain/entities/region_code_entity.dart';
import 'package:speech_craft/domain/repositories/search_query_params_repository.dart';

import '../data_sources/search_query_params_data/search_query_params_data_source.dart';

class SearchQueryParamsRepositoryImpl extends SearchQueryParamsRepository {
  final SearchQueryParamsDataSource queryParamsRemoteDataSourceImpl;

  SearchQueryParamsRepositoryImpl({required this.queryParamsRemoteDataSourceImpl});

  @override
  List<LanguageEntity> getLanguagesFromDatasource() {
    return queryParamsRemoteDataSourceImpl.getLanguages();
  }

  @override
  List<RegionCodeEntity> getRegionCodesFromDatasource() {
    return queryParamsRemoteDataSourceImpl.getCountries();
  }
}
