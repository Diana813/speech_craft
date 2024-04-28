import '../entities/language_entity.dart';
import '../entities/region_code_entity.dart';

abstract class QueryParamsRepository {
  List<LanguageEntity> getLanguagesFromDatasource();

  List<RegionCodeEntity> getRegionCodesFromDatasource();
}
