import 'package:http/http.dart' as http;
import 'package:speech_craft/common/strings.dart';

import '../../../common/keys.dart';

class TranslationRequestBuilder {
  late String keywords;
  late String languageCode;

  TranslationRequestBuilder();

  TranslationRequestBuilder withKeywords(String keywords) {
    this.keywords = keywords;
    return this;
  }

  TranslationRequestBuilder withLanguageCode(String languageCode) {
    this.languageCode = languageCode;
    return this;
  }

  Future<http.Response> post() async {
    final response = await http.post(Uri.parse(translationApiUrl), body: {
      'q': keywords,
      'target': languageCode,
      'format': 'text',
      'key': GOOGLE_API_KEY
    }, headers: {
      'Content-Type': 'application/x-www-form-urlencoded'
    });

    return response;
  }
}
