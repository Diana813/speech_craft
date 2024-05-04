import 'package:equatable/equatable.dart';

class RegionCodeEntity extends Equatable {
  final String country;
  final String? code;

  const RegionCodeEntity({
    required this.country,
    required this.code,
  });

  @override
  List<Object?> get props => [country, code];
}
