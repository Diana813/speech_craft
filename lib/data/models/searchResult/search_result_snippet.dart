import 'package:speech_craft/data/models/searchResult/thumbnails.dart';

class SearchResultSnippet {
  DateTime publishedAt;
  String channelId;
  String title;
  String description;
  Thumbnails thumbnails;
  String channelTitle;
  String liveBroadcastContent;

  SearchResultSnippet({
    required this.publishedAt,
    required this.channelId,
    required this.title,
    required this.description,
    required this.thumbnails,
    required this.channelTitle,
    required this.liveBroadcastContent,
  });

  factory SearchResultSnippet.fromJson(Map<String, dynamic> json) {
    return SearchResultSnippet(
      publishedAt: DateTime.parse(json['publishedAt'] ?? ''),
      channelId: json['channelId'] ?? '',
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      thumbnails: Thumbnails.fromJson(json['thumbnails'] ?? {}),
      channelTitle: json['channelTitle'] ?? '',
      liveBroadcastContent: json['liveBroadcastContent'] ?? '',
    );
  }
}