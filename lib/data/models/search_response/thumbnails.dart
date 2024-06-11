import 'package:equatable/equatable.dart';
import 'package:speech_craft/data/models/search_response/thumbnail.dart';

class Thumbnails extends Equatable {
  final Thumbnail defaultThumbnail;
  final Thumbnail mediumThumbnail;
  final Thumbnail highThumbnail;

  const Thumbnails({
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

  @override
  List<Object?> get props => [defaultThumbnail, mediumThumbnail, highThumbnail];
}
