import 'package:flutter/cupertino.dart';
import 'package:speech_craft/common/strings.dart';

@immutable
sealed class Failure {
  final String message;
  const Failure(this.message);

  String getMessage();
}

class ServerFailure extends Failure {
  const ServerFailure(super.message);

  @override
  String getMessage() {
    return "$apiFailureErrorMessage ($message)";
  }
}

class SavingDataFailure extends Failure {
  const SavingDataFailure(super.message);

  @override
  String getMessage() {
    return "$savingDataFailureMessage ($message)";
  }
}

class GeneralFailure extends Failure {
  const GeneralFailure(super.message);

  @override
  String getMessage() {
    return "$generalErrorMessage ($message)";
  }
}
