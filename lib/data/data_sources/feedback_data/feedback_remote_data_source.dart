import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import '../../exceptions/exceptions.dart';
import '../../models/success_rate_response/user_success_rate.dart';
import '../../models/upload_audio_request/time_range.dart';

abstract class FeedbackRemoteDataSource {
  Future<UserSuccessRate> getSuccessRate();

  Future<int> uploadAudio({required Uint8List bytes, required TimeRange timeRange});
}

class FeedbackRemoteDataSourceImpl extends FeedbackRemoteDataSource {
  final host = kIsWeb
      ? '127.0.0.1'
      : Platform.isAndroid
          ? '192.168.1.165'
          : '127.0.0.1';

  @override
  Future<UserSuccessRate> getSuccessRate() async {
    Uri url = Uri(
      scheme: 'http',
      host: host,
      port: 5000,
      path: '/api/get_user_success_rate',
    );

    var response = await http.get(url);

    if (response.statusCode == 200) {
      return UserSuccessRate.fromJson(json.decode(response.body));
    } else {
      throw ServerException();
    }
  }

  @override
  Future<int> uploadAudio({required Uint8List bytes, required TimeRange timeRange}) async {
    Uri url = Uri(
      scheme: 'http',
      host: host,
      port: 5000,
      path: '/api/upload_audio',
    );

    var timeRangeJson = json.encode(timeRange.toJson());

    var request = http.MultipartRequest('POST', url)
      ..files.add(http.MultipartFile.fromBytes('audio', bytes,
          filename: 'user_audio.wav'))
      ..fields['timeRange'] = timeRangeJson;

    var response = await request.send();

    if (response.statusCode == 200) {
      return response.statusCode;
    } else {
      throw ServerException();
    }
  }
}
