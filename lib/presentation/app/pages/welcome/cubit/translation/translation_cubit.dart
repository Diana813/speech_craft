import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../../../../../domain/use_cases/translation_use_cases.dart';

part 'translation_state.dart';

class TranslationCubit extends Cubit<TranslationState> {
  final TranslationUseCases translationUseCases;

  TranslationCubit({required this.translationUseCases})
      : super(const TranslationInitial());

  void onTranslationRequested(
      {required String language, required String fraze}) async {
    emit(const TranslationLoading());

    final translationOrFailure = await translationUseCases.getTranslation(
        keywords: fraze, language: language);
    translationOrFailure.fold(
      (translation) => emit(TranslationLoaded(translation: translation)),
      (failure) => emit(TranslationAtError(errorMessage: failure.getMessage())),
    );
  }
}
