import 'package:dartz/dartz.dart';

import 'package:speech_craft/domain/failures/failures.dart';

import '../../domain/repositories/translation_repository.dart';
import '../data_sources/translation_data/translation_remote_data_source.dart';
import '../exceptions/exceptions.dart';

class TranslationRepositoryImpl implements TranslationRepository {
  final TranslationRemoteDataSource translationRemoteDataSourceImpl;

  TranslationRepositoryImpl({required  this.translationRemoteDataSourceImpl});

  @override
  Future<Either<String, Failure>> getTranslationFromDatasource(
      {required String keywords, required String language}) async {
    try {
      final response = await translationRemoteDataSourceImpl.getTranslation(
          keywords: keywords, languageCode: language);
      return left(response);
    } on ServerException catch (_) {
      return right(ServerFailure());
    } catch (e) {
      return right(GeneralFailure());
    }
  }
}
