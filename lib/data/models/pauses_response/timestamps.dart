import 'package:equatable/equatable.dart';

class Timestamp extends Equatable {
  final double millis;

  const Timestamp({required this.millis});

  factory Timestamp.fromJson(dynamic json) {
    return Timestamp(millis: json['millis'] as double);
  }

  @override
  List<Object?> get props => [millis];
}
