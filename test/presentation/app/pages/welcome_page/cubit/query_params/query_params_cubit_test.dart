import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:speech_craft/domain/entities/language_entity.dart';
import 'package:speech_craft/domain/entities/region_code_entity.dart';
import 'package:speech_craft/domain/use_cases/search_query_params_use_cases.dart';
import 'package:speech_craft/presentation/app/pages/welcome_page/cubit/query_params/query_params_cubit.dart';

import 'query_params_cubit_test.mocks.dart';

@GenerateNiceMocks([MockSpec<SearchQueryParamsUseCases>()])
void main() {
  late QueryParamsCubit queryParamsCubit;
  final mockQueryParamsUseCases = MockQueryParamsUseCases();

  setUp(() {
    queryParamsCubit =
        QueryParamsCubit(queryParamsUseCases: mockQueryParamsUseCases);
  });

  group('QueryParamsCubit', () {
    final mockLanguages = [
      const LanguageEntity(code: 'en', name: 'English'),
      const LanguageEntity(code: 'es', name: 'Spanish')
    ];
    final mockRegionCodes = [
      const RegionCodeEntity(country: 'United States', code: 'US'),
      const RegionCodeEntity(country: 'Spain', code: 'ES')
    ];

    blocTest<QueryParamsCubit, QueryParamsState>(
      'emits QueryParamsLoaded when onQueryParamsRequested is called',
      build: () {
        when(mockQueryParamsUseCases.getLanguages()).thenReturn(mockLanguages);
        when(mockQueryParamsUseCases.getRegionCodes())
            .thenReturn(mockRegionCodes);
        return queryParamsCubit;
      },
      act: (cubit) => cubit.onQueryParamsRequested(),
      expect: () => [
        QueryParamsLoaded(
            languages: mockLanguages, regionCodes: mockRegionCodes)
      ],
    );

    const testCountry =
        RegionCodeEntity(code: 'US', country: 'United States');
    const testLanguage = LanguageEntity(name: 'English', code: 'en');

    blocTest<QueryParamsCubit, QueryParamsState>(
      'emits CountrySubmitted when onCountrySubmitted is called',
      build: () => queryParamsCubit,
      act: (cubit) => cubit.onCountrySubmitted(country: testCountry),
      expect: () => [const CountrySubmitted(regionCode: testCountry)],
    );

    blocTest<QueryParamsCubit, QueryParamsState>(
      'emits LanguageSubmitted when onLanguageSubmitted is called',
      build: () => queryParamsCubit,
      act: (cubit) => cubit.onLanguageSubmitted(language: testLanguage),
      expect: () => [const LanguageSubmitted(language: testLanguage)],
    );
  });
}
