import 'package:bloc/bloc.dart';
import 'package:speech_craft/presentation/app/pages/learning_page/cubit/translation/translation_state.dart';

import '../../../../../../domain/use_cases/translation_use_cases.dart';

class TranslationCubit extends Cubit<TranslationState> {
  final TranslationUseCases translationUseCases;

  TranslationCubit({required this.translationUseCases})
      : super(TranslationInitial());

  Future<void> translateSegment(String sentence) async {
    final translationOrFailure = await translationUseCases.call(
        params: TranslationParams(sentence: sentence));

    translationOrFailure.fold(
        (translation) => emit(
            TranslationUploaded(sentence: sentence, translation: translation)),
        (failure) => emit(TranslationAtError(
            errorMessage: failure.getMessage(), sentence: sentence)));
  }
}
