import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:immunity_networks/domain/repository/api_repository.dart';
import 'package:immunity_networks/presentation/resources/string_manager.dart';
import 'package:immunity_networks/presentation/ui/authentication/login/bloc/login_event.dart';
import 'package:immunity_networks/presentation/ui/authentication/login/bloc/login_state.dart';
import 'package:immunity_networks/presentation/utills/extentions.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final repo = ApiRepository();
  LoginBloc() : super(LoginStatusInitial()) {
    on<LoginUser>(_loginFunction);
  }

  Future<FutureOr<void>> _loginFunction(
      LoginUser event, Emitter<LoginState> emit) async {
    if (!event.phoneNumber.isValidatePhoneNumber()) {
      return null;
    } else if (!event.password.isValidatePassword()) {
      return null;
    }
    emit(LoginStatusLoading());
    var data = <String, String>{};
    data['phone'] = event.phoneNumber;
    data['password'] = event.password;
    var response = await repo.callLoginApi(data);
    if (response.isSuccess()) {
      emit(LoginStatusSuccess());
    } else {
      showToast(response.error ?? StringManager.somethingWentWrong);
      emit(LoginStatusInitial());
    }
  }
}
