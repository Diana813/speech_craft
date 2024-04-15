import 'package:speech_craft/data/models/searchResult/search_result_id.dart';
import 'package:speech_craft/data/models/searchResult/search_result_snippet.dart';

class SearchResult {
  String kind;
  String etag;
  SearchResultId id;
  SearchResultSnippet snippet;

  SearchResult({
    required this.kind,
    required this.etag,
    required this.id,
    required this.snippet,
  });

  factory SearchResult.fromJson(Map<String, dynamic> json) {
    return SearchResult(
      kind: json['kind'] ?? '',
      etag: json['etag'] ?? '',
      id: SearchResultId.fromJson(json['id'] ?? {}),
      snippet: SearchResultSnippet.fromJson(json['snippet'] ?? {}),
    );
  }
}
