import 'package:speech_craft/data/data_sources/query_params_data/query_params_remote_data_source.dart';
import 'package:speech_craft/domain/entities/language_entity.dart';
import 'package:speech_craft/domain/entities/region_code_entity.dart';
import 'package:speech_craft/domain/repositories/query_params_repository.dart';

class QueryParamsRepositoryImpl extends QueryParamsRepository {
  final QueryParamsRemoteDataSource queryParamsRemoteDataSourceImpl;

  QueryParamsRepositoryImpl({required this.queryParamsRemoteDataSourceImpl});

  @override
  List<LanguageEntity> getLanguagesFromDatasource() {
    return queryParamsRemoteDataSourceImpl.getLanguages();
  }

  @override
  List<RegionCodeEntity> getRegionCodesFromDatasource() {
    return queryParamsRemoteDataSourceImpl.getCountries();
  }
}
