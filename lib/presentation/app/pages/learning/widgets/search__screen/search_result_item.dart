import 'package:flutter/material.dart';

import '../../../../../../domain/entities/search_result_entity.dart';

class SearchResultItemWidget extends StatelessWidget {
  final SearchResultEntity result;
  final Function onTap;

  const SearchResultItemWidget(
      {super.key, required this.result, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: ListTile(
        tileColor: Theme.of(context).scaffoldBackgroundColor,
        title: Text(result.title,
            style: Theme.of(context).textTheme.titleSmall),
        subtitle: Text(result.description,
            style: Theme.of(context).textTheme.bodySmall),
        leading: Image.network(result.thumbnailUrl),
        onTap: () => onTap(),
      ),
    );
  }
}
