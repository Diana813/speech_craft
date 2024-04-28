import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:speech_craft/common/strings.dart';
import 'package:speech_craft/data/data_sources/search_request_builder.dart';
import 'package:speech_craft/data/exceptions/exceptions.dart';
import 'package:speech_craft/data/models/searchResult/search_result.dart';

abstract class SearchResultsRemoteDataSource {
  Future<List<SearchResult>> getListOfVideos({String? keywords, String? regionCode});
}

class SearchResultsRemoteDataSourceImpl
    implements SearchResultsRemoteDataSource {
  final http.Client client;

  SearchResultsRemoteDataSourceImpl({required this.client});

  @override
  Future<List<SearchResult>> getListOfVideos(
      {String? keywords, String? regionCode}) async {
    SearchRequestBuilder requestBuilder = SearchRequestBuilder();

    Map<String, String> parameters = requestBuilder
        .setQueryParams(keywords)
        .setRegionCode(regionCode)
        .build();

    Uri uri = Uri.https(googleBaseUrl, youtubeEndpoint, parameters);
    final response = await client.get(uri);
    final responseBody = json.decode(response.body);

    if (response.statusCode != 200) {
      log('ERROR: ${responseBody['error']['message']}');
      throw ServerException();
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
