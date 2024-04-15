import 'package:flutter/material.dart';
import 'package:speech_craft/data/models/search_key_words.dart';

class SearchResults extends StatelessWidget {
  const SearchResults({super.key, required this.searchKeyWords});

  final SearchKeyWords? searchKeyWords;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey,
      child: const Text('wyszukiwanie'),
    );
  }
}
