import 'package:equatable/equatable.dart';

class SearchKeyWords extends Equatable {
  final String? regionCode;
  final String? searchFraze;
  final String? languageCode;

  const SearchKeyWords({this.languageCode, this.regionCode, this.searchFraze});

  @override
  List<Object?> get props => [regionCode, searchFraze, languageCode];
}
