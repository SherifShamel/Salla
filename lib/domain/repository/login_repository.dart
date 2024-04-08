import 'package:dartz/dartz.dart';
import 'package:salla/core/failure/failure.dart';

abstract class LoginRepository{
  Future<Either<Failure,bool>> login(String email, String password);
}