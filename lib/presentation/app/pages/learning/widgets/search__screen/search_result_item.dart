import 'package:flutter/material.dart';

import '../../../../../../data/models/searchResult/search_result.dart';

class SearchResultItemWidget extends StatelessWidget {
  final SearchResult result;
  final Function onTap;

  const SearchResultItemWidget(
      {super.key, required this.result, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: ListTile(
        tileColor: Theme.of(context).scaffoldBackgroundColor,
        title: Text(result.snippet.title,
            style: Theme.of(context).textTheme.titleSmall),
        subtitle: Text(result.snippet.description,
            style: Theme.of(context).textTheme.bodySmall),
        leading: Image.network(result.snippet.thumbnails.defaultThumbnail.url),
        onTap: () => onTap(),
      ),
    );
  }
}
