
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

@immutable
sealed class TranslationState extends Equatable {
  const TranslationState();

  @override
  List<Object?> get props => [];
}

final class TranslationInitial extends TranslationState {}

final class TranslationUploaded extends TranslationState {
  final String sentence;
  final String translation;

  const TranslationUploaded(
      {required this.translation, required this.sentence});

  @override
  List<Object?> get props => [sentence, translation];
}

final class TranslationAtError extends TranslationState {
  final String errorMessage;
  final String sentence;

  const TranslationAtError(
      {required this.errorMessage, required this.sentence});

  @override
  List<Object?> get props => [errorMessage, sentence];
}