import 'package:dartz/dartz.dart';
import 'package:salla/domain/repository/login_repository.dart';

import '../../core/failure/failure.dart';

class LoginUseCase {
  final LoginRepository loginRepository;

  LoginUseCase(this.loginRepository);

//this is the only function in the class. Single Responsibility
  Future<Either<Failure, bool>> execute(String email, String password) async {
    return await loginRepository.login(email, password);
  }
}
