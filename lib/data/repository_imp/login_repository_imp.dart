import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:salla/core/failure/failures.dart';
import 'package:salla/core/services/web_services.dart';
import 'package:salla/data/data_source/login/login_data_source.dart';
import 'package:salla/domain/repository/login_repository.dart';

import '../../core/failure/failure.dart';

class LoginRepositoryImp implements LoginRepository {
  final LoginDataSource loginDataSource;

  LoginRepositoryImp(this.loginDataSource);

  @override
  Future<Either<Failure, bool>> login(String email, String password) async {
    try {
      final response = await loginDataSource.login(email, password);

      if (response.statusCode == 200) {
        WebServices().setMobileToken(response.data["token"]);

        return const Right(true);
      } else if (response.statusCode == 401) {
        return Left(
          ServerFailure(
            statusCode: response.statusCode.toString(),
            message: response.data["message"],
          ),
        );
      } else {
        return Left(
          ServerFailure(
            statusCode: response.statusCode.toString(),
            message: response.data["message"],
          ),
        );
      }
    } on DioException catch (error) {
      return Left(
        ServerFailure(
          statusCode: error.response?.statusCode.toString() ?? "",
          message: error.response?.data["message"] ?? "",
        ),
      );
    }
  }
}
