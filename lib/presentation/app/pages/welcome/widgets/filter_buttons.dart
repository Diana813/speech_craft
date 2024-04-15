import 'package:flutter/material.dart';

import 'drop_down_button.dart';

class FilterButtons extends StatelessWidget {
  const FilterButtons(
      {super.key,
      required this.countries,
      required this.countryDropdownValue,
      required this.languages,
      required this.languageDropdownValue,
      required this.onCountryChanged,
      required this.onLanguageChanged});

  final List<String> countries;
  final List<String> languages;

  final String countryDropdownValue;
  final String languageDropdownValue;

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
            child: DropDownButton(
              elements: countries,
              dropdownValue: countryDropdownValue,
              onChanged: (value) => onCountryChanged(value),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 8.0, left: 8),
            child: DropDownButton(
              elements: languages,
              dropdownValue: languageDropdownValue,
              onChanged: (value) => onLanguageChanged(value),
            ),
          ),
        ),
      ],
    );
  }
}
