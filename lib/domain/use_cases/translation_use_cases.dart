import 'package:dartz/dartz.dart';

import '../../common/use_case.dart';
import '../failures/failures.dart';
import '../repositories/translation_repository.dart';

class TranslationParams extends Params {
  final String? sentence;
  final String languageCode;

  TranslationParams({this.sentence, this.languageCode = "pl"});

  @override
  List<Object?> get props => [sentence, languageCode];
}

class TranslationUseCases extends UseCase<String, TranslationParams> {
  final TranslationRepository translationRepository;

  TranslationUseCases({required this.translationRepository});

  @override
  Future<Either<String, Failure>> call(
      {required TranslationParams params}) async {
    if (params.sentence != null) {
      return await translationRepository.getTranslationFromDatasource(
          keywords: params.sentence!, language: params.languageCode);
    } else {
      return const Left('');
    }
  }
}
