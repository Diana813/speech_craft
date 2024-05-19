import 'package:flutter/material.dart';
import 'package:flutter_adaptive_scaffold/flutter_adaptive_scaffold.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:speech_craft/presentation/app/pages/learning/cubit/search_results/search_results_cubit.dart';
import 'package:speech_craft/presentation/app/pages/learning/widgets/search__screen/search_result_item.dart';

import '../../../../../../domain/entities/search_result_entity.dart';
import '../lesson_sceen/learning_page_small.dart';

class SearchResultsList extends StatelessWidget {
  const SearchResultsList({
    super.key,
    required this.videos,
  });

  final List<SearchResultEntity> videos;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: videos.length,
      itemBuilder: (context, index) {
        return SearchResultItemWidget(
          result: videos[index],
          onTap: () {
            context.read<SearchResultsCubit>().onSelectedItemChanged(
                videoId: videos[index].videoId, videos: videos);
            if (Breakpoints.small.isActive(context)) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      LearningPageSmall(videoId: videos[index].videoId),
                ),
              );
            }
          },
        );
      },
    );
  }
}
