import 'package:equatable/equatable.dart';
import 'package:speech_craft/data/models/searchResult/thumbnails.dart';

class SearchResultSnippet extends Equatable {
  final DateTime? publishedAt;
  final String? channelId;
  final String title;
  final String description;
  final Thumbnails thumbnails;
  final String? channelTitle;
  final String? liveBroadcastContent;

  const SearchResultSnippet({
    this.publishedAt,
    this.channelId,
    required this.title,
    required this.description,
    required this.thumbnails,
    this.channelTitle,
    this.liveBroadcastContent,
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

  @override
  List<Object?> get props => [
        publishedAt,
        channelId,
        title,
        description,
        thumbnails,
        channelTitle,
        liveBroadcastContent
      ];
}
