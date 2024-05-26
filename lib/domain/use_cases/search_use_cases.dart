import 'package:dartz/dartz.dart';
import 'package:speech_craft/domain/entities/search_result_entity.dart';

import '../../common/use_case.dart';
import '../failures/failures.dart';
import '../repositories/search_results_repository.dart';
import '../repositories/translation_repository.dart';

class SearchParams extends Params {
  final String? keywords;
  final String? regionCode;
  final String? languageCode;

  SearchParams({this.keywords, this.regionCode, this.languageCode});

  @override
  List<Object?> get props => [keywords, regionCode, languageCode];
}

class SearchUseCases extends UseCase<List<SearchResultEntity>, SearchParams> {
  final SearchResultsRepository searchResultsRepository;
  final TranslationRepository translationRepository;

  SearchUseCases(
      {required this.translationRepository,
      required this.searchResultsRepository});

  @override
  Future<Either<List<SearchResultEntity>, Failure>> call(
      {required SearchParams params}) async {
    if (params.languageCode != null && params.keywords != null) {
      final translationOrFailure =
          await translationRepository.getTranslationFromDatasource(
              keywords: params.keywords!, language: params.languageCode!);

      return translationOrFailure.fold(
        (translation) {
          return searchResultsRepository.getSearchResultsFromDatasource(
              keywords: translation, regionCode: params.regionCode);
        },
        (failure) {
          return Right(failure);
        },
      );
    } else {
      return searchResultsRepository.getSearchResultsFromDatasource(
          keywords: params.keywords, regionCode: params.regionCode);
    }
  }
}
