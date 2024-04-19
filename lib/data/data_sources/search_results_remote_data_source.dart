import 'dart:convert';

import 'package:speech_craft/common/strings.dart';
import 'package:speech_craft/data/exceptions/exceptions.dart';
import 'package:speech_craft/data/models/searchResult/search_result.dart';
import 'package:http/http.dart' as http;

import '../../common/keys.dart';

abstract class SearchResultsRemoteDataSource {
  Future<List<SearchResult>> getListOfVideos({required String keywords});
}

class SearchResultsRemoteDataSourceImpl
    implements SearchResultsRemoteDataSource {
  SearchResultsRemoteDataSourceImpl._instantiate();

  static final SearchResultsRemoteDataSourceImpl youTubeApiServiceInstance =
      SearchResultsRemoteDataSourceImpl._instantiate();

  @override
  Future<List<SearchResult>> getListOfVideos({String? keywords}) async {
    String queryParams = keywords ?? '';

    Map<String, String> parameters = {
      'q': queryParams,
      'key': GOOGLE_API_KEY,
      'maxResults': '25',
      'type': 'video',
      'part': 'snippet'
    };

    Uri uri = Uri.https(googleBaseUrl, youtubeEndpoint, parameters);
    final response = await http.get(uri);
    final responseBody = json.decode(response.body);

    if (response.statusCode != 200) {
      throw ServerException(responseBody['error']['message']);
    } else {
      List<dynamic> items = responseBody['items'];

      List<SearchResult> videos = [];
      for (var item in items) {
        videos.add(SearchResult.fromJson(item));
      }
      return videos;
    }
  }
}
