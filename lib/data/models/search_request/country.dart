import 'package:equatable/equatable.dart';
import 'package:speech_craft/domain/entities/region_code_entity.dart';

class Country extends RegionCodeEntity implements EquatableMixin {
  final String code;
  final String name;

  const Country({
    required this.code,
    required this.name,
  }) : super(country: name, code: code);

  factory Country.fromJson(Map<String, dynamic> json) {
    return Country(
      code: json['code'],
      name: json['name'],
    );
  }

  @override
  List<Object?> get props => [code, name];
}
