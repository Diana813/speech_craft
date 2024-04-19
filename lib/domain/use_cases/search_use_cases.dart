import 'package:dartz/dartz.dart';
import 'package:speech_craft/data/repositories/search_result_repository_implementation.dart';
import 'package:speech_craft/domain/entities/search_result_entity.dart';

import '../failures/failures.dart';

class SearchUseCases{
  final searchResultsRepository = SearchResultRepositoryImpl();

  Future<Either<List<SearchResultEntity>, Failure>> getSearchResults({String? keywords}) async {
    final videos = searchResultsRepository.getSearchResultsFromDatasource(keywords: keywords);
    //business logic
    return videos;
  }
}