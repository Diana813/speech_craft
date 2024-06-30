
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:speech_craft/domain/entities/language_entity.dart';
import 'package:speech_craft/domain/entities/region_code_entity.dart';
import 'package:speech_craft/domain/repositories/search_query_params_repository.dart';
import 'package:speech_craft/domain/use_cases/search_query_params_use_cases.dart';

import 'search_query_params_use_cases.mocks.dart';

@GenerateNiceMocks([MockSpec<SearchQueryParamsRepository>()])
void main() {
  late SearchQueryParamsUseCases useCases;
  late MockSearchQueryParamsRepository mockRepository;

  setUp(() {
    mockRepository = MockSearchQueryParamsRepository();
    useCases = SearchQueryParamsUseCases(queryParamsRepository: mockRepository);
  });

  group('SearchQueryParamsUseCases', () {
    test('should return languages from repository', () {
      final mockLanguages = [
        const LanguageEntity(code: '1', name: 'English'),
        const LanguageEntity(code: '2', name: 'Spanish'),
      ];

      when(mockRepository.getLanguagesFromDatasource())
          .thenReturn(mockLanguages);

      final result = useCases.getLanguages();

      expect(result, mockLanguages);
    });

    test('should return region codes from repository', () {
      final mockRegionCodes = [
        const RegionCodeEntity(code: 'US', country: 'United States'),
        const RegionCodeEntity(code: 'GB', country: 'United Kingdom'),
      ];

      when(mockRepository.getRegionCodesFromDatasource())
          .thenReturn(mockRegionCodes);

      final result = useCases.getRegionCodes();

      expect(result, mockRegionCodes);
    });
  });
}