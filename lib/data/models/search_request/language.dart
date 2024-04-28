import 'package:equatable/equatable.dart';
import 'package:speech_craft/domain/entities/language_entity.dart';

class Language extends LanguageEntity implements EquatableMixin {
  final String code;
  final String name;

  const Language({
    required this.code,
    required this.name,
  }) : super(code: code, name: name);

  factory Language.fromJson(Map<String, dynamic> json) {
    return Language(
      code: json['code'],
      name: json['name'],
    );
  }

  @override
  List<Object?> get props => [code, name];
}
