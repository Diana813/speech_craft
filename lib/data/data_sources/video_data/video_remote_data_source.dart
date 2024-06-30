import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import '../../../common/strings.dart';
import '../../exceptions/exceptions.dart';

abstract class VideoRemoteDataSource {
  Future<String> uploadVideoToCoreService({required String videoId});
}

class VideoRemoteDataSourceImpl extends VideoRemoteDataSource {
  final http.Client client;

  VideoRemoteDataSourceImpl({required this.client});

  @override
  Future<String> uploadVideoToCoreService({required String videoId}) async {
    String youtubeVideoUrl = '$youtubeUrl/watch?v=$videoId';

    final host = kIsWeb
        ? '127.0.0.1'
        : Platform.isAndroid
            ? '192.168.1.165'
            : '127.0.0.1';

    Uri url = Uri(
      scheme: 'http',
      host: host,
      port: 5000,
      path: '/api/video',
      queryParameters: {'youtube_url': youtubeVideoUrl},
    );

    final response = await client.get(url, headers: {'Accept': 'video/mp4'});

    if (response.statusCode == 200 || response.statusCode == 304) {
      return response.statusCode.toString();
    } else {
      throw ServerException();
    }
  }
}
