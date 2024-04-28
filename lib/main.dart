import 'package:flutter/material.dart';
import 'package:speech_craft/presentation/app/base_app.dart';
import 'injection_container.dart' as dependency_injection;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dependency_injection.init();

  runApp(const BaseApp());
}
