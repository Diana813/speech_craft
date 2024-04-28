part of 'query_params_cubit.dart';

@immutable
sealed class QueryParamsState extends Equatable {
  const QueryParamsState();

  @override
  List<Object?> get props => [];
}

final class QueryParamsInitial extends QueryParamsState {
  const QueryParamsInitial();
}

final class QueryParamsLoaded extends QueryParamsState {
  final List<LanguageEntity> languages;
  final List<RegionCodeEntity> regionCodes;

  const QueryParamsLoaded({required this.languages, required this.regionCodes});

  @override
  List<Object?> get props => [languages, regionCodes];
}

final class CountrySubmitted extends QueryParamsState {
  final RegionCodeEntity regionCode;

  const CountrySubmitted({required this.regionCode});

  @override
  List<Object?> get props => [regionCode];
}

final class LanguageSubmitted extends QueryParamsState {
  final LanguageEntity language;

  const LanguageSubmitted({required this.language});

  @override
  List<Object?> get props => [language];
}
