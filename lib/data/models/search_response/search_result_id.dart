import 'package:equatable/equatable.dart';

class SearchResultId extends Equatable {
  final String kind;
  final String videoId;
  final String channelId;
  final String playlistId;

  const SearchResultId({
    required this.kind,
    required this.videoId,
    required this.channelId,
    required this.playlistId,
  });

  factory SearchResultId.fromJson(Map<String, dynamic> json) {
    return SearchResultId(
      kind: json['kind'] ?? '',
      videoId: json['videoId'] ?? '',
      channelId: json['channelId'] ?? '',
      playlistId: json['playlistId'] ?? '',
    );
  }

  @override
  List<Object?> get props => [kind, videoId, channelId, playlistId];
}
