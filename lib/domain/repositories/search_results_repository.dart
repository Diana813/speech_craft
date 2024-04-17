import 'package:flutter/cupertino.dart';

import '../entities/search_result_entity.dart';

@immutable
sealed class SearchResultsRepository{
  Future<SearchResultEntity> getSearchResultsFromDatasource();
}