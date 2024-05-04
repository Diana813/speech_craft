import 'package:get_it/get_it.dart';
import 'package:speech_craft/data/data_sources/query_params_remote_data_source.dart';
import 'package:speech_craft/data/data_sources/search_results_remote_data_source.dart';
import 'package:speech_craft/data/data_sources/translation_request_builder.dart';
import 'package:speech_craft/data/repositories/search_result_repository_implementation.dart';
import 'package:speech_craft/domain/repositories/translation_repository.dart';
import 'package:speech_craft/domain/use_cases/query_params_use_cases.dart';
import 'package:speech_craft/domain/use_cases/search_use_cases.dart';
import 'package:speech_craft/presentation/app/pages/learning/cubit/search_results/search_results_cubit.dart';
import 'package:speech_craft/presentation/app/pages/welcome/cubit/query_params/query_params_cubit.dart';

import 'data/data_sources/translation_remote_data_source.dart';
import 'data/repositories/query_params_repository_implementation.dart';
import 'data/repositories/translation_repository_implementation.dart';
import 'domain/repositories/query_params_repository.dart';
import 'domain/repositories/search_results_repository.dart';
import 'package:http/http.dart' as http;

final serviceLocator = GetIt.instance;

Future<void> init() async {
  // Welcome page
  // data layer
  serviceLocator.registerFactory<QueryParamsRemoteDataSource>(
      () => QueryParamsRemoteDataSourceImpl());

  serviceLocator.registerFactory<QueryParamsRepository>(() =>
      QueryParamsRepositoryImpl(
          queryParamsRemoteDataSourceImpl: serviceLocator()));

  // domain layer
  serviceLocator.registerFactory(
      () => QueryParamsUseCases(queryParamsRepository: serviceLocator()));

  // presentation layer
  serviceLocator.registerFactory(
      () => QueryParamsCubit(queryParamsUseCases: serviceLocator()));

  // Search results screen
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

  // domain layer
  serviceLocator.registerFactory(() => SearchUseCases(
      searchResultsRepository: serviceLocator(),
      translationRepository: serviceLocator()));

  // presentation layer
  serviceLocator.registerFactory(
      () => SearchResultsCubit(searchUseCases: serviceLocator()));
}
