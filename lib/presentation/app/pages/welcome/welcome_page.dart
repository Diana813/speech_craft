import 'package:flutter/material.dart';
import 'package:flutter_adaptive_scaffold/flutter_adaptive_scaffold.dart';
import 'package:speech_craft/data/models/search_key_words.dart';
import 'package:speech_craft/presentation/app/pages/welcome/welcome_screen_large.dart';
import 'package:speech_craft/presentation/app/pages/welcome/welcome_screen_small.dart';

class WelcomePage extends StatefulWidget {
  WelcomePage({super.key, required this.title});

  final String title;
  final List<String> countries = [
    "Argentyna",
    "Słowacja",
    "Polska",
    "Wielka Brytania",
    "USA"
  ];

  final List<String> languages = ["Angielski", "Hiszpański", "Niemiecki"];

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  late String _countryDropdownValue;
  late String _languageDropdownValue;
  late String? _keywords;

  @override
  void initState() {
    _countryDropdownValue = widget.countries.first;
    _languageDropdownValue = widget.languages.first;
    _keywords = null;
    super.initState();
  }

  void onCountryChanged(value) {
    setState(() {
      _countryDropdownValue = value;
    });
  }

  void onLanguageChanged(value) {
    setState(() {
      _languageDropdownValue = value;
    });
  }

  void onSearchFrazeSubmitted(value) {
    setState(() {
      _keywords = value;
    });

    print('key: $_keywords');
    Navigator.pushNamed(context, '/learning_page',
        arguments: SearchKeyWords(
          country: _countryDropdownValue,
          language: _languageDropdownValue,
          searchFraze: _keywords,
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: Text(
          widget.title,
          style: Theme.of(context).textTheme.titleLarge!,
        ),
      ),
      body: SafeArea(
        child: AdaptiveLayout(
          body: SlotLayout(
            config: <Breakpoint, SlotLayoutConfig>{
              Breakpoints.smallAndUp: SlotLayout.from(
                key: const Key('primary-body'),
                builder: (context) => WelcomeScreenSmall(
                  countries: widget.countries,
                  languages: widget.languages,
                  countryDropdownValue: _countryDropdownValue,
                  languageDropdownValue: _languageDropdownValue,
                  onCountryChanged: (value) => onCountryChanged(value),
                  onLanguageChanged: (value) => onLanguageChanged(value),
                  onSearchFrazeSubmitted: (value) =>
                      onSearchFrazeSubmitted(value),
                ),
              ),
              Breakpoints.mediumAndUp: SlotLayout.from(
                key: const Key('primary-body'),
                builder: (context) => WelcomeScreenLarge(
                  countries: widget.countries,
                  languages: widget.languages,
                  countryDropdownValue: _countryDropdownValue,
                  languageDropdownValue: _languageDropdownValue,
                  onCountryChanged: (value) => onCountryChanged(value),
                  onLanguageChanged: (value) => onLanguageChanged(value),
                  onSearchFrazeSubmitted: (value) =>
                      onSearchFrazeSubmitted(value),
                ),
              ),
            },
          ),
        ),
      ),
    );
  }
}
