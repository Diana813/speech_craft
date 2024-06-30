import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
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

class GeneralFailure extends Failure {
  @override
  String getMessage() {
    return generalErrorMessage;
  }
}
