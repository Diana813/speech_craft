import 'package:http/http.dart' as http;

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
    String url = 'https://translation.googleapis.com/language/translate/v2';
    final response = await http.post(Uri.parse(url), body: {
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
