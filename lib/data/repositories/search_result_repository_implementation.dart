import 'package:dartz/dartz.dart';
import 'package:speech_craft/data/exceptions/exceptions.dart';
import 'package:speech_craft/domain/entities/search_result_entity.dart';
import 'package:speech_craft/domain/failures/failures.dart';

import '../../domain/repositories/search_results_repository.dart';
import '../data_sources/search_results_data/search_results_remote_data_source.dart';

class SearchResultsRepositoryImpl implements SearchResultsRepository {
  final SearchResultsRemoteDataSource searchResultsRemoteDataSourceImpl;

  SearchResultsRepositoryImpl(
      {required this.searchResultsRemoteDataSourceImpl});

  @override
  Future<Either<List<SearchResultEntity>, Failure>>
      getSearchResultsFromDatasource(
          {String? keywords, String? regionCode}) async {
    try {
      final response = await searchResultsRemoteDataSourceImpl.getListOfVideos(
          keywords: keywords, regionCode: regionCode);
      
      final videos = response
          .map((video) => SearchResultEntity(
              title: video.snippet.title,
              description: video.snippet.description,
              thumbnailUrl: video.snippet.thumbnails.defaultThumbnail.url,
              videoId: video.id.videoId))
          .toList();

      return left(videos);
    } on ServerException catch (_) {
      return right(ServerFailure());
    } catch (e) {
      return right(GeneralFailure());
    }
  }
}
