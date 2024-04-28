import 'package:dartz/dartz.dart';

import '../failures/failures.dart';
import '../repositories/translation_repository.dart';

class TranslationUseCases{

  final TranslationRepository translationRepository;

  TranslationUseCases({required this.translationRepository});


  Future<Either<String, Failure>> getTranslation({required String keywords, required String language}) async {
    return await translationRepository.getTranslationFromDatasource(
        keywords: keywords, language: language);
  }

}