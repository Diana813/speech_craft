import 'package:equatable/equatable.dart';
import 'package:speech_craft/data/models/success_rate_response/transcription.dart';

import 'accent.dart';
import 'intonation.dart';

class UserSuccessRate extends Equatable {
  final double wordsAccuracy;
  final Transcription transcription;
  final double accentAccuracy;
  final List<AccentData> accentData;
  final double intonationAccuracy;
  final Intonation intonation;
  final double pronunciationAccuracy;

  const UserSuccessRate({
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

  @override
  List<Object?> get props => [
        wordsAccuracy,
        transcription,
        accentAccuracy,
        accentData,
        intonationAccuracy,
        intonation,
        pronunciationAccuracy
      ];
}
