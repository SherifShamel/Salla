import 'package:dio/dio.dart';
import 'package:dio/src/response.dart';
import 'package:salla/data/data_source/login/login_data_source.dart';

class LoginDataSourceImp implements LoginDataSource {
  final Dio dio;

  LoginDataSourceImp({required this.dio});

  @override
  Future<Response> login(String email, String password) async{
    return await dio.post("/api/v1/auth/signin", data: {
      "email": email,
      "password": password,
    });
  }
}
