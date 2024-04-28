part of 'translation_cubit.dart';

@immutable
sealed class TranslationState extends Equatable {
  const TranslationState();

  @override
  List<Object?> get props => [];
}

final class TranslationInitial extends TranslationState {
  const TranslationInitial();
}

final class TranslationLoading extends TranslationState {
  const TranslationLoading();
}

final class TranslationLoaded extends TranslationState {
  final String translation;

  const TranslationLoaded({required this.translation});

  @override
  List<Object?> get props => [translation];
}

final class TranslationAtError extends TranslationState {
  final String errorMessage;

  const TranslationAtError({required this.errorMessage});

  @override
  List<Object?> get props => [errorMessage];
}
