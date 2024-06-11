import 'package:flutter/material.dart';
import 'package:speech_craft/presentation/app/base_app.dart';
import 'package:permission_handler/permission_handler.dart';

import 'injection_container.dart' as dependency_injection;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dependency_injection.init();
  await _requestMicrophonePermission();
  runApp(const BaseApp());
}

_requestMicrophonePermission() async {
  return await Permission.microphone
      .onDeniedCallback(() {

  })
      .onGrantedCallback(() {
  })
      .onPermanentlyDeniedCallback(() {

  })
      .onRestrictedCallback(() {

  })
      .onLimitedCallback(() {

  })
      .onProvisionalCallback(() {

  })
      .request();
}
