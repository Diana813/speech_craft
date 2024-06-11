import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:speech_craft/data/exceptions/exceptions.dart';

import '../../../common/strings.dart';
import '../../models/pauses_response/timestamps.dart';

abstract class PausesRemoteDataSource {
  Future<List<Timestamp>> getPauses({required String videoId});
}

class PausesRemoteDataSourceImpl extends PausesRemoteDataSource {
  @override
  Future<List<Timestamp>> getPauses({required String videoId}) async {
    String youtubeVideoUrl = '$youtubeUrl/watch?v=$videoId';

    final host = kIsWeb ? '127.0.0.1' : Platform.isAndroid ? '192.168.1.165' : '127.0.0.1';

    Uri url = Uri(
      scheme: 'http',
      host: host,
      port: 5000,
      path: '/api/pauses_timestamps',
      queryParameters: {'youtube_url': youtubeVideoUrl},
    );

    var response = await http.get(url);

    if (response.statusCode == 200) {
      List<dynamic> jsonList = json.decode(response.body);
      List<Timestamp> timestamps =
          jsonList.map((json) => Timestamp.fromJson(json)).toList();
      return timestamps;
    } else {
      throw ServerException();
    }
  }
}
