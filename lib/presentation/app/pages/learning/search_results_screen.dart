import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:speech_craft/common/strings.dart';
import 'package:speech_craft/data/models/search_key_words.dart';
import 'package:speech_craft/presentation/app/pages/learning/cubit/search_results/search_results_cubit.dart';
import 'package:speech_craft/presentation/app/pages/learning/widgets/search__screen/search_result_item.dart';

class SearchResults extends StatelessWidget {
  const SearchResults({super.key, this.searchKeyWords});

  final SearchKeyWords? searchKeyWords;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchResultsCubit, SearchResultsState>(
      builder: (context, state) {
        if (state is SearchResultsLoading) {
          return Center(
            child: CircularProgressIndicator(
              color: Theme.of(context).primaryColorLight,
            ),
          );
        } else if (state is SearchResultsLoaded) {
          return ListView.builder(
              shrinkWrap: true,
              itemCount: state.videos.length,
              itemBuilder: (context, index) {
                return SearchResultItemWidget(
                  result: state.videos[index],
                  onTap: () {},
                );
              });
        } else if (state is SearchResultsAtError) {
          return Text('Error: ${state.errorMessage}');
        } else {
          return const Text(emptyResults);
        }
      },
    );
  }
}
