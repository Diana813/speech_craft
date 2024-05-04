import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:speech_craft/common/strings.dart';

@immutable
sealed class Failure extends Equatable {
  String getMessage();

  @override
  List<Object?> get props => [];
}

class ServerFailure extends Failure {
  @override
  String getMessage() {
    return apiFailureErrorMessage;
  }
}

class SavingDataFailure extends Failure {
  @override
  String getMessage() {
    return savingDataFailureMessage;
  }
}

class GeneralFailure extends Failure {
  @override
  String getMessage() {
    return generalErrorMessage;
  }
}