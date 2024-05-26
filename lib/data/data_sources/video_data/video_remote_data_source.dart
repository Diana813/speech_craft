import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:http/http.dart' as http;

import '../../../common/strings.dart';
import '../../exceptions/exceptions.dart';

abstract class VideoRemoteDataSource {
  Future<String> uploadVideoToCoreService({required String videoId});
}

class VideoRemoteDataSourceImpl extends VideoRemoteDataSource {
  @override
  Future<String> uploadVideoToCoreService({required String videoId}) async {
    String youtubeVideoUrl = '$youtubeUrl/watch?v=$videoId';

    Uri url = Uri(
      scheme: 'http',
      host: Platform.isAndroid ? '10.0.2.2' : '127.0.0.1',
      port: 5000,
      path: '/api/video',
      queryParameters: {'youtube_url': youtubeVideoUrl},
    );

    final response = await http.post(url, headers: {'Accept': 'video/mp4'});

    final jsonResponse = json.decode(response.body);

    if (response.statusCode != 200) {
      log('ERROR: ${jsonResponse['error']['message']}');
      throw ServerException();
    }
    return response.body;
  }
}
