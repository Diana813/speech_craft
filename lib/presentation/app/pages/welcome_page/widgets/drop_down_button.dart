import 'package:flutter/material.dart';

import '../../../../common/theme.dart';

class DropDownButton extends StatelessWidget {
  const DropDownButton(
      {super.key,
      required this.elements,
      required this.dropdownValue,
      required this.onChanged});

  final List<String> elements;
  final String dropdownValue;
  final Function onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: AppTheme.lightTale[600],
      ),
      child: DropdownButton(
          value: dropdownValue,
          isExpanded: true,
          items: elements.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          onChanged: (value) => onChanged(value),
          dropdownColor: AppTheme.lightTale,
          iconEnabledColor: Theme.of(context).primaryColor,
          style: Theme.of(context).textTheme.bodyMedium),
    );
  }
}
