import 'package:speech_craft/common/keys.dart';

class SearchRequestBuilder {
  String? queryParams;
  String? regionCode;

  SearchRequestBuilder setQueryParams(String? queryParams) {
    this.queryParams = queryParams;
    return this;
  }

  SearchRequestBuilder setRegionCode(String? regionCode) {
    this.regionCode = regionCode;
    return this;
  }

  Map<String, String> build() {
    Map<String, String> parameters = {};
    if (queryParams != null) {
      parameters['q'] = queryParams!;
    }
    if (regionCode != null) {
      parameters['regionCode'] = regionCode!;
    }
    parameters['maxResults'] = '25';
    parameters['type'] = 'video';
    parameters['part'] = 'snippet';
    parameters['key'] = GOOGLE_API_KEY;
    return parameters;
  }
}