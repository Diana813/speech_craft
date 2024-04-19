import 'package:dartz/dartz.dart';

import '../entities/search_result_entity.dart';
import '../failures/failures.dart';

abstract class SearchResultsRepository {
  Future<Either<List<SearchResultEntity>, Failure>>
      getSearchResultsFromDatasource({required String keywords});
}
