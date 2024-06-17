import 'package:equatable/equatable.dart';

class Intonation extends Equatable {
  final List<double> lectorIntonation;
  final List<double> userIntonation;

  const Intonation({
    required this.lectorIntonation,
    required this.userIntonation,
  });

  factory Intonation.fromJson(Map<String, dynamic> json) {
    return Intonation(
      lectorIntonation:
          (json['lectorIntonation'] as List).map((e) => e as double).toList(),
      userIntonation:
          (json['userIntonation'] as List).map((e) => e as double).toList(),
    );
  }

  @override
  List<Object?> get props => [lectorIntonation, userIntonation];
}
