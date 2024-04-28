import 'package:flutter/material.dart';
import 'package:speech_craft/presentation/app/pages/learning/learning_page.dart';
import 'package:speech_craft/presentation/app/pages/welcome/widgets/query_params_wrapper_provider.dart';
import 'package:speech_craft/presentation/common/theme.dart';

import '../../common/strings.dart';

class BaseApp extends StatelessWidget {
  const BaseApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        themeMode: ThemeMode.system,
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        home: const WelcomePageWrapperProvider(
          title: appName,
        ),
        routes: <String, WidgetBuilder>{
          '/welcome_page': (BuildContext context) =>
              const WelcomePageWrapperProvider(title: appName),
          '/learning_page': (BuildContext context) =>
              const LearningPage(title: appName)
        });
  }
}
