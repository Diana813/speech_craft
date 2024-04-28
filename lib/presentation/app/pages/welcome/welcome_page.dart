import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:speech_craft/data/models/search_request/search_key_words.dart';
import 'package:speech_craft/domain/entities/language_entity.dart';
import 'package:speech_craft/presentation/app/pages/welcome/widgets/adaptive_layout.dart';

import '../../../../common/strings.dart';
import '../../../../domain/entities/region_code_entity.dart';
import 'cubit/query_params/query_params_cubit.dart';

class WelcomePage extends StatelessWidget {
  final String title;

  const WelcomePage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    final List<RegionCodeEntity> countries = [
      const RegionCodeEntity(country: country, code: '')
    ];
    final List<LanguageEntity> languages = [
      const LanguageEntity(code: '', name: language)
    ];

    String countryDropdownValue = countries.first.country;
    String languageDropdownValue = languages.first.name;
    LanguageEntity? languageEntity;
    RegionCodeEntity? countryEntity;

    BlocProvider.of<QueryParamsCubit>(context).onQueryParamsRequested();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: Text(
          title,
          style: Theme.of(context).textTheme.titleLarge!,
        ),
      ),
      body: BlocBuilder<QueryParamsCubit, QueryParamsState>(
        builder: (context, state) {
          if (state is QueryParamsLoaded) {
            countries.addAll(state.regionCodes);
            languages.addAll(state.languages);
          } else if (state is CountrySubmitted) {
            countryDropdownValue = state.regionCode.country;
            countryEntity = state.regionCode;
          } else if (state is LanguageSubmitted) {
            languageDropdownValue = state.language.name;
            languageEntity = state.language;
          }
          return SearchAdaptiveLayout(
            countries: countries,
            languages: languages,
            countryDropdownValue: countryDropdownValue,
            languageDropdownValue: languageDropdownValue,
            onCountryChanged: (value) =>
                BlocProvider.of<QueryParamsCubit>(context).onCountrySubmitted(
              country: RegionCodeEntity(
                  country: value,
                  code: countries
                      .firstWhere((element) => element.country == value)
                      .code),
            ),
            onLanguageChanged: (value) =>
                BlocProvider.of<QueryParamsCubit>(context).onLanguageSubmitted(
              language: LanguageEntity(
                  name: value,
                  code: languages
                      .firstWhere((element) => element.name == value)
                      .code),
            ),
            onSearchFrazeSubmitted: (value) => {
              Navigator.pushNamed(
                context,
                '/learning_page',
                arguments: SearchKeyWords(
                  regionCode: countryEntity?.code,
                  languageCode: languageEntity?.code,
                  searchFraze: value,
                ),
              )
            },
          );
        },
      ),
    );
  }
}
