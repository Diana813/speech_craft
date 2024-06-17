import 'package:equatable/equatable.dart';

class Transcription extends Equatable {
  final String lectorTranscription;
  final String userTranscription;

  const Transcription({
    required this.lectorTranscription,
    required this.userTranscription,
  });

  factory Transcription.fromJson(Map<String, dynamic> json) {
    return Transcription(
      lectorTranscription: json['lectorTranscription'] ?? '',
      userTranscription: json['userTranscription'] ?? '',
    );
  }

  @override
  List<Object?> get props => [lectorTranscription, userTranscription];
}
