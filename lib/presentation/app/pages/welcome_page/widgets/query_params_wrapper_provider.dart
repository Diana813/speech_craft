import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../injection_container.dart';
import '../cubit/query_params/query_params_cubit.dart';
import '../welcome_page.dart';

class WelcomePageWrapperProvider extends StatelessWidget {
  final String title;

  const WelcomePageWrapperProvider({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) => serviceLocator<QueryParamsCubit>(),
        child: WelcomePage(
          title: title,
        ));
  }
}
