import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:speech_craft/domain/failures/failures.dart';

abstract class UseCase<Type, Params> {
  Future<Either<Type, Failure>> call({required Params params});
}

abstract class Params extends Equatable {}
