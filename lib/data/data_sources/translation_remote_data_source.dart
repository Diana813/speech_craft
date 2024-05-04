import 'dart:convert';
import 'dart:developer';

import 'package:speech_craft/data/data_sources/translation_request_builder.dart';

import '../exceptions/exceptions.dart';

abstract class TranslationRemoteDataSource {
  Future<String> getTranslation(
      {required String keywords, required String languageCode});
}

class TranslationRemoteDataSourceImpl implements TranslationRemoteDataSource {
  late final TranslationRequestBuilder builder;

  TranslationRemoteDataSourceImpl({required this.builder});

  @override
  Future<String> getTranslation(
      {required String keywords, required String languageCode}) async {
    builder
      ..withKeywords(keywords)
      ..withLanguageCode(languageCode);

    final response = await builder.post();

    final jsonResponse = json.decode(response.body);
    if (response.statusCode != 200) {
      log('ERROR: ${jsonResponse['error']['message']}');
      throw ServerException();
    } else {
      return jsonResponse['data']['translations'][0]['translatedText'];
    }
  }
}
