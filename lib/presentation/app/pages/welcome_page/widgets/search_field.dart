import 'package:flutter/material.dart';

import '../../../../../common/strings.dart';
import '../../../../common/theme.dart';

class SearchField extends StatelessWidget {
  const SearchField({super.key, required this.onSubmitted});

  final Function onSubmitted;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: AppTheme.lightTale[600],
      ),
      padding: const EdgeInsets.all(8),
      child: TextField(
        cursorColor: Theme.of(context).shadowColor,
        decoration: InputDecoration(
          focusColor: Theme.of(context).shadowColor,
          fillColor: Theme.of(context).primaryColorDark,
          hoverColor: Theme.of(context).primaryColor,
          labelText: searchFieldLabelText,
          labelStyle: Theme.of(context).textTheme.bodyMedium,
          suffixIcon:
              Icon(Icons.youtube_searched_for_rounded, color: Colors.red[700]),
        ),
        onSubmitted: (value) => onSubmitted(value),
      ),
    );
  }
}
