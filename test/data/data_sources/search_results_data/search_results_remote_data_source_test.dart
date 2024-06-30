import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:speech_craft/common/keys.dart';
import 'package:speech_craft/common/strings.dart';
import 'package:speech_craft/data/data_sources/search_results_data/search_results_remote_data_source.dart';
import 'package:speech_craft/data/exceptions/exceptions.dart';
import 'package:speech_craft/data/models/search_response/search_result.dart';
import 'package:test/test.dart';

import 'search_results_remote_data_source_test.mocks.dart';
import '../youtube_search_dummy_data.dart';

@GenerateNiceMocks([MockSpec<http.Client>()])
void main() {
  group('SearchResultsRemoteDataSource', () {
    final mockClient = MockClient();
    final remoteDataSourceUnderTest =
    SearchResultsRemoteDataSourceImpl(client: mockClient);

    Map<String, String> parameters = {
      'q': 'test',
      'regionCode': 'gb',
      'maxResults': '25',
      'type': 'video',
      'part': 'snippet',
      'key': GOOGLE_API_KEY,
    };

    group('should return Search Results model', () {
      test('when Client response was 200 and has valid data', () async {
        //given
        when(mockClient
            .get(Uri.https(googleBaseUrl, youtubeDataEndpoint, parameters)))
            .thenAnswer((realInvocation) =>
            Future.value(http.Response(dummySearchResults, 200)));

        final expectedResponseBody = jsonDecode(dummySearchResults);

        List<dynamic> items = expectedResponseBody['items'];

        List<SearchResult> videos = [];
        for (var item in items) {
          videos.add(SearchResult.fromJson(item));
        }

        //when
        final result = await remoteDataSourceUnderTest.getListOfVideos(keywords: 'test', regionCode: 'gb');

        //then
        expect(result, videos);
      });
    });


    group('should throw exception', () {
      test('throws server exception when Client response was not 200',
              () async {
            //given
            when(mockClient
                .get(Uri.https(googleBaseUrl, youtubeDataEndpoint, parameters)))
                .thenAnswer((realInvocation) =>
                Future.value(http.Response(exampleErrorResponse, 403)));

            //then
            expect(() => remoteDataSourceUnderTest.getListOfVideos(keywords: 'test', regionCode: 'gb'),
                throwsA(isA<ServerException>()));
          });


      test(
          'throws type error when Client response was 200, but data were invalid',
              () async {
            //given
            final response = jsonEncode({"response": "invalid response"});

            when(mockClient
                .get(Uri.https(googleBaseUrl, youtubeDataEndpoint, parameters)))
                .thenAnswer((realInvocation) =>
                Future.value(http.Response(response, 200)));

            //then
            expect(() => remoteDataSourceUnderTest.getListOfVideos(keywords: 'test', regionCode: 'gb'),
                throwsA(isA<TypeError>()));
          });
    });
  });
}
