import 'package:get_it/get_it.dart';
import 'package:speech_craft/data/data_sources/feedback_data/feedback_remote_data_source.dart';
import 'package:speech_craft/data/data_sources/search_results_data/search_results_remote_data_source.dart';
import 'package:speech_craft/data/data_sources/translation_data/translation_request_builder.dart';
import 'package:speech_craft/data/data_sources/video_data/video_remote_data_source.dart';
import 'package:speech_craft/data/repositories/feedback_repository_impl.dart';
import 'package:speech_craft/data/repositories/search_result_repository_implementation.dart';
import 'package:speech_craft/data/repositories/user_audio_repository_impl.dart';
import 'package:speech_craft/data/repositories/video_repository_implementation.dart';
import 'package:speech_craft/domain/repositories/feedback_repository.dart';
import 'package:speech_craft/domain/repositories/translation_repository.dart';
import 'package:speech_craft/domain/repositories/user_audio_repository.dart';
import 'package:speech_craft/domain/repositories/video_repository.dart';
import 'package:speech_craft/domain/use_cases/search_query_params_use_cases.dart';
import 'package:speech_craft/domain/use_cases/search_use_cases.dart';
import 'package:speech_craft/domain/use_cases/translation_use_cases.dart';
import 'package:speech_craft/domain/use_cases/video_use_cases.dart';
import 'package:speech_craft/presentation/app/pages/learning_page/cubit/translation/translation_cubit.dart';
import 'package:speech_craft/presentation/app/pages/learning_page/cubit/learning/learning_cubit.dart';
import 'package:speech_craft/presentation/app/pages/learning_page/cubit/start_button_cubit.dart';
import 'package:speech_craft/presentation/app/pages/learning_page/cubit/search_results/search_results_cubit.dart';
import 'package:speech_craft/presentation/app/pages/learning_page/cubit/user_audio_player/user_audio_player_cubit.dart';
import 'package:speech_craft/presentation/app/pages/learning_page/cubit/video_loader/video_loader_cubit.dart';
import 'package:speech_craft/presentation/app/pages/learning_page/cubit/video_player/video_player_cubit.dart';
import 'package:speech_craft/presentation/app/pages/welcome_page/cubit/query_params/query_params_cubit.dart';

import 'data/data_sources/search_query_params_data/search_query_params_data_source.dart';
import 'data/data_sources/translation_data/translation_remote_data_source.dart';
import 'data/data_sources/user_audio_data/user_audio_remote_data_source.dart';
import 'data/data_sources/video_data/pauses_remote_source.dart';
import 'data/repositories/pauses_repository_implementation.dart';
import 'data/repositories/search_query_params_repository_implementation.dart';
import 'data/repositories/translation_repository_implementation.dart';
import 'domain/repositories/pauses_repository.dart';
import 'domain/repositories/search_query_params_repository.dart';
import 'domain/repositories/search_results_repository.dart';
import 'package:http/http.dart' as http;

import 'domain/use_cases/feedback_use_cases.dart';

final serviceLocator = GetIt.instance;

Future<void> init() async {
  // Welcome page

  // data layer
  serviceLocator.registerFactory<SearchQueryParamsDataSource>(
      () => SearchQueryParamsRemoteDataSourceImpl());

  serviceLocator.registerFactory<SearchQueryParamsRepository>(() =>
      SearchQueryParamsRepositoryImpl(
          queryParamsRemoteDataSourceImpl: serviceLocator()));

  // domain layer
  serviceLocator.registerFactory(
      () => SearchQueryParamsUseCases(queryParamsRepository: serviceLocator()));

  // presentation layer
  serviceLocator.registerFactory(
      () => QueryParamsCubit(queryParamsUseCases: serviceLocator()));

  // Learning Page

  // external
  serviceLocator.registerFactory(() => http.Client());

  // data layer
  serviceLocator.registerFactory<SearchResultsRemoteDataSource>(
      () => SearchResultsRemoteDataSourceImpl(client: serviceLocator()));

  serviceLocator.registerFactory<SearchResultsRepository>(() =>
      SearchResultsRepositoryImpl(
          searchResultsRemoteDataSourceImpl: serviceLocator()));

  serviceLocator.registerFactory<TranslationRemoteDataSource>(
    () => TranslationRemoteDataSourceImpl(
      builder: TranslationRequestBuilder(),
    ),
  );

  serviceLocator.registerFactory<TranslationRepository>(() =>
      TranslationRepositoryImpl(
          translationRemoteDataSourceImpl: serviceLocator()));

  serviceLocator.registerFactory<FeedbackRemoteDataSource>(
    () => FeedbackRemoteDataSourceImpl(client: serviceLocator()),
  );

  serviceLocator.registerFactory<UserAudioRemoteDataSource>(
    () => UserAudioRemoteDataSourceImpl(client: serviceLocator()),
  );

  serviceLocator.registerFactory<FeedbackRepository>(() =>
      FeedbackRepositoryImpl(feedbackRemoteDataSourceImpl: serviceLocator()));

  serviceLocator.registerFactory<VideoRemoteDataSource>(
      () => VideoRemoteDataSourceImpl(client: serviceLocator()));

  serviceLocator.registerFactory<VideoRepository>(
      () => VideoRepositoryImpl(videoRemoteDataSourceImpl: serviceLocator()));

  serviceLocator.registerFactory<PausesRemoteDataSource>(
      () => PausesRemoteDataSourceImpl(client: serviceLocator()));

  serviceLocator.registerFactory<PausesRepository>(
      () => PausesRepositoryImpl(pausesRemoteDataSourceImpl: serviceLocator()));

  serviceLocator.registerFactory<UserAudioRepository>(() =>
      UserAudioRepositoryImpl(userAudioRemoteDataSource: serviceLocator()));

  // domain layer
  serviceLocator.registerFactory(() => SearchUseCases(
      searchResultsRepository: serviceLocator(),
      translationRepository: serviceLocator()));

  serviceLocator.registerFactory(
      () => FeedbackUseCases(feedbackRepository: serviceLocator()));

  serviceLocator.registerFactory(() => UploadVideoUseCase(
      videoRepository: serviceLocator(), pausesRepository: serviceLocator()));

  serviceLocator.registerFactory(
      () => TranslationUseCases(translationRepository: serviceLocator()));

  // presentation layer
  serviceLocator.registerFactory(
      () => SearchResultsCubit(searchUseCases: serviceLocator()));

  serviceLocator
      .registerFactory(() => LearningCubit(feedbackUseCases: serviceLocator()));

  serviceLocator.registerFactory(() =>
      VideoLoaderCubit(uploadVideoUseCase: serviceLocator(), videoId: ''));

  serviceLocator.registerFactory(() => VideoPlayerCubit(''));

  serviceLocator.registerFactory(
      () => TranslationCubit(translationUseCases: serviceLocator()));

  serviceLocator.registerFactory(() => StartButtonCubit());

  serviceLocator.registerFactory(
      () => UserAudioPlayerCubit(userAudioRepository: serviceLocator()));
}
