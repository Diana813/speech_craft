import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import '../../exceptions/exceptions.dart';

abstract class UserAudioRemoteDataSource {
  Future<String> fetchUserAudioUrl();
}

class UserAudioRemoteDataSourceImpl extends UserAudioRemoteDataSource {
  final http.Client client;

  UserAudioRemoteDataSourceImpl({required this.client});

  @override
  Future<String> fetchUserAudioUrl() async {
    final host = kIsWeb
        ? '127.0.0.1'
        : Platform.isAndroid
            ? '192.168.1.252'
            : '127.0.0.1';

    Uri url = Uri(
      scheme: 'http',
      host: host,
      port: 5000,
      path: '/api/get_user_audio',
    );

    var response = await client.get(url, headers: {'Accept': 'audio/wav'});

    if (response.statusCode == 200) {
      return "$url?timestamp=${DateTime.now().millisecondsSinceEpoch}";
    } else {
      throw ServerException();
    }
  }
}
