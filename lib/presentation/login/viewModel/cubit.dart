import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:salla/core/failure/failures.dart';
import 'package:salla/core/services/snack_bar_service.dart';
import 'package:salla/core/services/web_services.dart';
import 'package:salla/data/data_source/login/login_data_source.dart';
import 'package:salla/data/data_source/login/login_data_source_imp.dart';
import 'package:salla/data/repository_imp/login_repository_imp.dart';
import 'package:salla/domain/repository/login_repository.dart';
import 'package:salla/domain/use_cases/login_use_case.dart';
import 'package:salla/presentation/login/viewModel/states.dart';

class LoginViewModel extends Cubit<LoginStates> {
  LoginViewModel() : super(LoadingLoginState());

  final WebServices _services = WebServices();
  late LoginUseCase loginUseCase;
  late LoginRepository loginRepository;
  late LoginDataSource loginDataSource;

  Future<bool> login(String email, String password) async {
    loginDataSource = LoginDataSourceImp(dio: _services.freeDio);
    loginRepository = LoginRepositoryImp(loginDataSource);
    loginUseCase = LoginUseCase(loginRepository);

    EasyLoading.show();
    final result = await loginUseCase.execute(email, password);

    return result.fold(
      (fail) {
        var failure = fail as ServerFailure;
        EasyLoading.dismiss();
        SnackBarService.showErrorMessage(failure.message ?? "Error on login");
        return Future.value(false);
      },
      (data) {
        EasyLoading.dismiss();
        return Future.value(true);
      },
    );
  }
}
