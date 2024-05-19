import 'dart:convert';

import 'package:speech_craft/assets/countries.dart';
import 'package:speech_craft/assets/languages.dart';

import '../../models/search_request/country.dart';
import '../../models/search_request/language.dart';

abstract class QueryParamsRemoteDataSource {
  List<Language> getLanguages();

  List<Country> getCountries();
}

class QueryParamsRemoteDataSourceImpl implements QueryParamsRemoteDataSource {
  @override
  List<Country> getCountries() {
    List<dynamic> result = jsonDecode(countries);
    return result.map((it) => Country.fromJson(it)).toList();
  }

  @override
  List<Language> getLanguages() {
    List<dynamic> result = jsonDecode(languages);
    return result.map((it) => Language.fromJson(it)).toList();
  }
}
