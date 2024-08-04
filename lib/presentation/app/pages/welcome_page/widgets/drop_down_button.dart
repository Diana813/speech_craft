import 'package:flutter/material.dart';

import '../../../../common/theme.dart';


class AutocompleteField extends StatelessWidget {
  const AutocompleteField({
    super.key,
    required this.elements,
    required this.onChanged,
    required this.labelText,
  });

  final List<String> elements;
  final Function(String) onChanged;
  final String labelText;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: AppTheme.lightTale[600],
      ),
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return Autocomplete<String>(
            optionsBuilder: (TextEditingValue textEditingValue) {
              if (textEditingValue.text.isEmpty) {
                return const Iterable<String>.empty();
              }
              return elements.where((String option) {
                return option.toLowerCase().contains(textEditingValue.text.toLowerCase());
              });
            },
            onSelected: (String selection) {
              onChanged(selection);
            },
            fieldViewBuilder: (BuildContext context, TextEditingController textEditingController, FocusNode focusNode, VoidCallback onFieldSubmitted) {
              return TextField(
                controller: textEditingController,
                focusNode: focusNode,
                onSubmitted: (String value) {
                  onFieldSubmitted();
                },
                decoration: InputDecoration(
                  focusColor: Theme.of(context).shadowColor,
                  fillColor: Theme.of(context).primaryColorDark,
                  hoverColor: Theme.of(context).primaryColor,
                  labelText: labelText,
                  labelStyle: Theme.of(context).textTheme.bodyMedium,
                ),
              );
            },
            optionsViewBuilder: (BuildContext context, AutocompleteOnSelected<String> onSelected, Iterable<String> options) {
              final optionCount = options.length;
              return Align(
                alignment: Alignment.topLeft,
                child: Material(
                  color: Colors.transparent,
                  child: Container(
                    width: constraints.maxWidth,
                    color: AppTheme.lightTale[300],
                    constraints: const BoxConstraints(
                      maxHeight: 200,
                    ),
                    child: ConstrainedBox(
                      constraints: BoxConstraints(
                        maxHeight: optionCount * 48.0,
                      ),
                      child: ListView.builder(
                        padding: const EdgeInsets.all(8.0),
                        itemCount: optionCount,
                        shrinkWrap: true, // shrink the list to fit its content
                        itemBuilder: (BuildContext context, int index) {
                          final String option = options.elementAt(index);
                          return GestureDetector(
                            onTap: () {
                              onSelected(option);
                            },
                            child: ListTile(
                              title: Text(option),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}