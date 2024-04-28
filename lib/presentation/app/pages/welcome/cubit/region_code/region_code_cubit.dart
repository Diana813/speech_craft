import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:speech_craft/domain/use_cases/region_code_use_cases.dart';

part 'region_code_state.dart';

class RegionCodeCubit extends Cubit<RegionCodeState> {
  final RegionCodeUseCases regionCodeUseCases;

  RegionCodeCubit({required this.regionCodeUseCases})
      : super(const RegionCodeInitial());

  void onRegionCodeRequested({required String country}) async {
    emit(const RegionCodeLoading());

    final queryParamsOrFailure =
        await regionCodeUseCases.getRegionCode(country: country);
    queryParamsOrFailure.fold(
      (regionCode) => emit(RegionCodeLoaded(regionCode: regionCode)),
      (failure) => emit(RegionCodeAtError(errorMessage: failure.getMessage())),
    );
  }
}
