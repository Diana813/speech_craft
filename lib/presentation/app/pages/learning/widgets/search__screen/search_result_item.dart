import 'package:flutter/material.dart';
import 'package:flutter_adaptive_scaffold/flutter_adaptive_scaffold.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:speech_craft/presentation/app/pages/learning/widgets/lesson_sceen/learning_page_small.dart';

import '../../../../../../domain/entities/search_result_entity.dart';
import '../../cubit/navigation/navigation_cubit.dart';

class SearchResultItemWidget extends StatelessWidget {
  final SearchResultEntity result;

  const SearchResultItemWidget({super.key, required this.result});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: ListTile(
        tileColor: Theme.of(context).scaffoldBackgroundColor,
        title:
            Text(result.title, style: Theme.of(context).textTheme.titleSmall),
        subtitle: Text(result.description,
            style: Theme.of(context).textTheme.bodySmall),
        leading: Image.network(result.thumbnailUrl),
        onTap: () {
          context
              .read<NavigationCubit>()
              .onSelectedItemChanged(videoId: result.videoId);
          if (Breakpoints.small.isActive(context)) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    LearningPageSmall(videoId: result.videoId),
              ),
            );
          }
        },
      ),
    );
  }
}
