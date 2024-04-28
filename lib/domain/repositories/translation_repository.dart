import 'package:dartz/dartz.dart';

import '../failures/failures.dart';

abstract class TranslationRepository {
  Future<Either<String, Failure>> getTranslationFromDatasource(
      {required String keywords, required String language});
}
