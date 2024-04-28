import 'package:dartz/dartz.dart';
import 'package:speech_craft/data/models/searchResult/search_result.dart';
import 'package:speech_craft/data/models/searchResult/search_result_id.dart';
import 'package:speech_craft/data/models/searchResult/search_result_snippet.dart';
import 'package:speech_craft/data/models/searchResult/thumbnail.dart';
import 'package:speech_craft/data/models/searchResult/thumbnails.dart';
import 'package:speech_craft/domain/entities/search_result_entity.dart';
import 'package:speech_craft/domain/failures/failures.dart';

const expectedSearchResultsEntity = Left<List<SearchResultEntity>, Failure>([
  SearchResultEntity(
      title: "60 Day Dry Aged Picanha (Covered in frosting?)",
      description:
          "I recently asked myself, what makes Picanha so good? I realized it's one of the few cuts that shines in all 3 areas that make a steak ...",
      thumbnailUrl: "https://i.ytimg.com/vi/YDTANv-7k7g/default.jpg",
      videoId: "YDTANv-7k7g")
]);

final dummySearchResults = [
  SearchResult(
    kind: 'youtube#searchResult',
    etag: 'RNqfkUMD8WJxU51zO4ybvt6JZFg',
    id: const SearchResultId(
        kind: 'youtube#video',
        videoId: 'YDTANv-7k7g',
        channelId: '',
        playlistId: ''),
    snippet: SearchResultSnippet(
      publishedAt: DateTime.parse('2021-07-17 00:45:01.000Z'),
      channelId: 'UC_pT_Iz6XjuM-eMTlXghdfw',
      title: '60 Day Dry Aged Picanha (Covered in frosting?)',
      description:
          'I recently asked myself, what makes Picanha so good? I realized it\'s one of the few cuts that shines in all 3 areas that make a steak ...',
      thumbnails: const Thumbnails(
          defaultThumbnail: Thumbnail(
              url: 'https://i.ytimg.com/vi/YDTANv-7k7g/default.jpg',
              width: 120,
              height: 90),
          mediumThumbnail: Thumbnail(
              url: 'https://i.ytimg.com/vi/YDTANv-7k7g/mqdefault.jpg',
              width: 320,
              height: 180),
          highThumbnail: Thumbnail(
              url: 'https://i.ytimg.com/vi/YDTANv-7k7g/hqdefault.jpg',
              width: 480,
              height: 360)),
    ),
  ),
];
