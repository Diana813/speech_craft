import 'package:speech_craft/data/models/searchResult/thumbnail.dart';

class Thumbnails {
  Thumbnail defaultThumbnail;
  Thumbnail mediumThumbnail;
  Thumbnail highThumbnail;

  Thumbnails({
    required this.defaultThumbnail,
    required this.mediumThumbnail,
    required this.highThumbnail,
  });

  factory Thumbnails.fromJson(Map<String, dynamic> json) {
    return Thumbnails(
      defaultThumbnail: Thumbnail.fromJson(json['default'] ?? {}),
      mediumThumbnail: Thumbnail.fromJson(json['medium'] ?? {}),
      highThumbnail: Thumbnail.fromJson(json['high'] ?? {}),
    );
  }
}
