import 'package:dartz/dartz.dart';
import 'package:speech_craft/domain/entities/search_result_entity.dart';

import '../failures/failures.dart';

class SearchUseCases{

  List<SearchResultEntity> _videos = [
    SearchResultEntity(title: 'first', description: 'description', thumbnailUrl: '', videoId: "1"),
    SearchResultEntity(title: 'second', description: 'description', thumbnailUrl: '', videoId: "1"),
    SearchResultEntity(title: 'third', description: 'description', thumbnailUrl: '', videoId: "1"),
    SearchResultEntity(title: 'fourth', description: 'description', thumbnailUrl: '', videoId: "1"),
    SearchResultEntity(title: 'fifth', description: 'description', thumbnailUrl: '', videoId: "1"),
  ];

  Future<Either<List<SearchResultEntity>, Failure>> getSearchResults() async {
    await Future.delayed(const Duration(seconds: 3));
    return left(_videos);
  }
}