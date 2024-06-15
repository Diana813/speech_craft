class AccentData {
  final String word;
  final List<double> sampledAudioLector;
  final List<double> sampledAudioUser;

  AccentData(
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
}
