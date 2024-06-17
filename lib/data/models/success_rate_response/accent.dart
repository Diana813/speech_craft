import 'package:equatable/equatable.dart';

class AccentData extends Equatable {
  final String word;
  final List<double> sampledAudioLector;
  final List<double> sampledAudioUser;

  const AccentData(
      {required this.word,
      required this.sampledAudioLector,
      required this.sampledAudioUser});

  factory AccentData.fromJson(Map<String, dynamic> json) {
    return AccentData(
      word: json['word'],
      sampledAudioLector: List<double>.from(
          json['sampled_audio_lector'].map((x) => x.toDouble())),
      sampledAudioUser: List<double>.from(
          json['sampled_audio_user'].map((x) => x.toDouble())),
    );
  }

  @override
  List<Object?> get props => [word, sampledAudioLector, sampledAudioUser];
}
