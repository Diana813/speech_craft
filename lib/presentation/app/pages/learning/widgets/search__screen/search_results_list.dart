import 'package:flutter/material.dart';
import 'package:speech_craft/presentation/app/pages/learning/widgets/search__screen/search_result_item.dart';

import '../../../../../../data/models/searchResult/search_result.dart';

class SearchResultsList extends StatelessWidget {
  const SearchResultsList({
    super.key,
    required this.videos,
  });

  final List<SearchResult> videos;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: videos.length,
      itemBuilder: (context, index) {
        return SearchResultItemWidget(
          result: videos[index],
          onTap: () {},
        );
      },
    );
  }
}
