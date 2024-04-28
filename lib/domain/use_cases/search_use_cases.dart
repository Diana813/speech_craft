import 'package:dartz/dartz.dart';
import 'package:speech_craft/domain/entities/search_result_entity.dart';

import '../failures/failures.dart';
import '../repositories/search_results_repository.dart';

class SearchUseCases {
  final SearchResultsRepository searchResultsRepository;

  SearchUseCases({required this.searchResultsRepository});

  Future<Either<List<SearchResultEntity>, Failure>> getSearchResults(
      {String? keywords, String? regionCode}) async {
    return searchResultsRepository.getSearchResultsFromDatasource(
        keywords: keywords, regionCode: regionCode);
  }
}
