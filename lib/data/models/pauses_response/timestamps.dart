import 'package:equatable/equatable.dart';

class Timestamp extends Equatable {
  final double millis;

  const Timestamp({required this.millis});

  factory Timestamp.fromJson(dynamic json) {
    return Timestamp(millis: double.parse(json['millis'] as String));
  }

  @override
  List<Object?> get props => [millis];
}
