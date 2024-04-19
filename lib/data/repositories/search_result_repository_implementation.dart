import 'package:dartz/dartz.dart';
import 'package:speech_craft/data/exceptions/exceptions.dart';
import 'package:speech_craft/domain/entities/search_result_entity.dart';
import 'package:speech_craft/domain/failures/failures.dart';

import '../../domain/repositories/search_results_repository.dart';
import '../data_sources/search_results_remote_data_source.dart';

class SearchResultRepositoryImpl implements SearchResultsRepository {
  @override
  Future<Either<List<SearchResultEntity>, Failure>>
  getSearchResultsFromDatasource({String? keywords}) async {
    try {
      final response = await SearchResultsRemoteDataSourceImpl
          .youTubeApiServiceInstance
          .getListOfVideos(keywords: keywords);

      final videos = response
          .map((video) =>
          SearchResultEntity(
              title: video.snippet.title,
              description: video.snippet.description,
              thumbnailUrl: video.snippet.thumbnails.defaultThumbnail.url,
              videoId: video.id.videoId))
          .toList();
      return left(videos);
    } on ServerException catch (e){
      return right(ServerFailure(e.message));
    } catch (e) {
      return right(GeneralFailure(e.toString()));
    }
  }
}
