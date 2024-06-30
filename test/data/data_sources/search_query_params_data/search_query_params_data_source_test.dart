import 'package:flutter_test/flutter_test.dart';
import 'package:speech_craft/data/data_sources/search_query_params_data/search_query_params_data_source.dart';
import 'package:speech_craft/data/models/search_request/country.dart';
import 'package:speech_craft/data/models/search_request/language.dart';

void main() {
  group('SearchQueryParamsRemoteDataSourceImpl', () {
    test('getLanguages should return a list of Language', () {
      //given
      final dataSource = SearchQueryParamsRemoteDataSourceImpl();

      //when
      final languages = dataSource.getLanguages();

      //then
      expect(languages, isA<List<Language>>());
      expect(languages.length, 184);
      expect(languages[0].name, 'Afar');
      expect(languages[1].name, 'Abkhazian');
      expect(languages[2].name, 'Avestan');
    });

    test('getCountries should return a list of Country', () {
      //given
      final dataSource = SearchQueryParamsRemoteDataSourceImpl();

      //when
      final countries = dataSource.getCountries();

      //then
      expect(countries, isA<List<Country>>());
      expect(
          countries.length, 240);
      expect(countries[0].name, 'Afghanistan');
      expect(countries[0].code, 'AF');
      expect(countries[1].name, 'Åland Islands');
      expect(countries[1].code, 'AX');
    });
  });
}
