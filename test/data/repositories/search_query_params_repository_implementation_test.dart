import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:speech_craft/data/data_sources/search_query_params_data/search_query_params_data_source.dart';
import 'package:speech_craft/data/models/search_request/country.dart';
import 'package:speech_craft/data/models/search_request/language.dart';
import 'package:speech_craft/data/repositories/search_query_params_repository_implementation.dart';

import 'search_query_params_repository_implementation_test.mocks.dart';

@GenerateNiceMocks([MockSpec<SearchQueryParamsDataSource>()])
void main() {
  late SearchQueryParamsRepositoryImpl repository;
  late MockSearchQueryParamsDataSource mockDataSource;

  setUp(() {
    mockDataSource = MockSearchQueryParamsDataSource();
    repository = SearchQueryParamsRepositoryImpl(queryParamsRemoteDataSourceImpl: mockDataSource);
  });

  group('getLanguagesFromDatasource', () {
    final languages = [
      const Language(name: 'English', code: 'en'),
      const Language(name: 'Spanish', code: 'es'),
      const Language(name: 'French', code: 'fr'),
    ];

    test('should return list of LanguageEntity', () {
      when(mockDataSource.getLanguages()).thenReturn(languages);

      final result = repository.getLanguagesFromDatasource();

      expect(result, languages);
      verify(mockDataSource.getLanguages()).called(1);
    });
  });

  group('getRegionCodesFromDatasource', () {
    final regionCodes = [
      const Country(name: 'United States', code: 'US'),
      const Country(name: 'United Kingdom', code: 'GB'),
      const Country(name: 'Germany', code: 'DE'),
    ];

    test('should return list of RegionCodeEntity', () {
      when(mockDataSource.getCountries()).thenReturn(regionCodes);

      final result = repository.getRegionCodesFromDatasource();

      expect(result, regionCodes);
      verify(mockDataSource.getCountries()).called(1);
    });
  });
}