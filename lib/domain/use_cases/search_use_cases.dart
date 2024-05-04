import 'package:dartz/dartz.dart';
import 'package:speech_craft/domain/entities/search_result_entity.dart';

import '../failures/failures.dart';
import '../repositories/search_results_repository.dart';
import '../repositories/translation_repository.dart';

class SearchUseCases {
  final SearchResultsRepository searchResultsRepository;
  final TranslationRepository translationRepository;

  SearchUseCases(
      {required this.translationRepository,
      required this.searchResultsRepository});

  Future<Either<List<SearchResultEntity>, Failure>> getSearchResults(
      {String? keywords, String? regionCode, String? languageCode}) async {
    if (languageCode != null && keywords != null) {
      final translationOrFailure =
          await translationRepository.getTranslationFromDatasource(
              keywords: keywords, language: languageCode);

      return translationOrFailure.fold(
        (translation) {
          return searchResultsRepository.getSearchResultsFromDatasource(
              keywords: translation, regionCode: regionCode);
        },
        (failure) {
          return Right(failure);
        },
      );
    } else {
      return searchResultsRepository.getSearchResultsFromDatasource(
          keywords: keywords, regionCode: regionCode);
    }
  }
}
