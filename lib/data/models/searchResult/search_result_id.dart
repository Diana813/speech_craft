class SearchResultId {
  String kind;
  String videoId;
  String channelId;
  String playlistId;

  SearchResultId({
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
}