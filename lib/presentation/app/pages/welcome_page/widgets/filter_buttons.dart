import 'package:flutter/material.dart';
import 'package:speech_craft/common/strings.dart';

import 'drop_down_button.dart';

class FilterButtons extends StatelessWidget {
  const FilterButtons(
      {super.key,
      required this.countries,
      required this.languages,
      required this.onCountryChanged,
      required this.onLanguageChanged});

  final List<String> countries;
  final List<String> languages;

  final Function onCountryChanged;
  final Function onLanguageChanged;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 8, right: 8),
            child: AutocompleteField(
              elements: countries,
              onChanged: (value) => onCountryChanged(value),
              labelText: country,
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 8.0, left: 8),
            child: AutocompleteField(
              elements: languages,
              onChanged: (value) => onLanguageChanged(value),
              labelText: language,
            ),
          ),
        ),
      ],
    );
  }
}
