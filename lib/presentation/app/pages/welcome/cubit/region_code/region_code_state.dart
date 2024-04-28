part of 'region_code_cubit.dart';

@immutable
sealed class RegionCodeState extends Equatable {
  const RegionCodeState();

  @override
  List<Object?> get props => [];
}

final class RegionCodeInitial extends RegionCodeState {
  const RegionCodeInitial();
}


final class RegionCodeLoading extends RegionCodeState {
  const RegionCodeLoading();
}

final class RegionCodeLoaded extends RegionCodeState {
  final String regionCode;

  const RegionCodeLoaded({required this.regionCode});

  @override
  List<Object?> get props => [regionCode];
}


final class RegionCodeAtError extends RegionCodeState {
  final String errorMessage;

  const RegionCodeAtError({required this.errorMessage});

  @override
  List<Object?> get props => [errorMessage];
}
