import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:speech_craft/domain/entities/language_entity.dart';

import '../../../../../../domain/entities/region_code_entity.dart';
import '../../../../../../domain/use_cases/query_params_use_cases.dart';

part 'query_params_state.dart';

class QueryParamsCubit extends Cubit<QueryParamsState> {
  final QueryParamsUseCases queryParamsUseCases;

  QueryParamsCubit({required this.queryParamsUseCases})
      : super(const QueryParamsInitial());

  void onQueryParamsRequested() {
    final languages = queryParamsUseCases.getLanguages();
    final regionCodes = queryParamsUseCases.getRegionCodes();
    emit(QueryParamsLoaded(languages: languages, regionCodes: regionCodes));
  }

  void onCountrySubmitted({required RegionCodeEntity country}) {
    emit(CountrySubmitted(regionCode: country));
  }

  void onLanguageSubmitted({required LanguageEntity language}) {
    emit(LanguageSubmitted(language: language));
  }
}
