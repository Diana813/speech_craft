import 'package:equatable/equatable.dart';

class SearchResultEntity extends Equatable{
  final String title;
  final String description;
  final String thumbnailUrl;
  final String videoId;

  const SearchResultEntity({
    required this.title,
    required this.description,
    required this.thumbnailUrl,
    required this.videoId
  });

  @override
  List<Object?> get props => [title, description, thumbnailUrl, videoId];
}
