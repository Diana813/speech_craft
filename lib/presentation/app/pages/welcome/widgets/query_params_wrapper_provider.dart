import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:speech_craft/presentation/app/pages/welcome/cubit/query_params/query_params_cubit.dart';
import 'package:speech_craft/presentation/app/pages/welcome/welcome_page.dart';

import '../../../../../injection_container.dart';

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
