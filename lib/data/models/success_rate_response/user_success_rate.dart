import 'package:speech_craft/data/models/success_rate_response/transcription.dart';

import 'accent.dart';
import 'intonation.dart';

class UserSuccessRate {
  double wordsAccuracy;
  Transcription transcription;
  double accentAccuracy;
  List<AccentData> accentData;
  double intonationAccuracy;
  Intonation intonation;
  double pronunciationAccuracy;

  UserSuccessRate({
    required this.wordsAccuracy,
    required this.transcription,
    required this.accentAccuracy,
    required this.accentData,
    required this.intonationAccuracy,
    required this.intonation,
    required this.pronunciationAccuracy,
  });

  factory UserSuccessRate.fromJson(Map<String, dynamic> json) {
    var accentList = json['accent'] as List<dynamic>;
    var accentDataList = accentList.map((e) => AccentData.fromJson(e)).toList();

    return UserSuccessRate(
      wordsAccuracy: json['wordsAccuracy'].toDouble(),
      transcription:
      Transcription.fromJson(json['transcription'] as Map<String, dynamic>),
      accentAccuracy: json['accentAccuracy'].toDouble(),
      accentData: accentDataList,
      intonationAccuracy: json['intonationAccuracy'].toDouble(),
      intonation:
      Intonation.fromJson(json['intonation'] as Map<String, dynamic>),
      pronunciationAccuracy: json['pronunciationAccuracy'].toDouble(),
    );
  }
}
