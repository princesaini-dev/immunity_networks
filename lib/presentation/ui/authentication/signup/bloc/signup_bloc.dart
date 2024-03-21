import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:immunity_networks/domain/repository/api_repository.dart';
import 'package:immunity_networks/presentation/resources/string_manager.dart';
import 'package:immunity_networks/presentation/ui/authentication/signup/bloc/signup_event.dart';
import 'package:immunity_networks/presentation/ui/authentication/signup/bloc/signup_state.dart';
import 'package:immunity_networks/presentation/utills/extentions.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  final repo = ApiRepository();
  SignUpBloc() : super(SignUpStatusInitial()) {
    on<SignUpUser>(_signUpFunction);
  }

  Future<FutureOr<void>> _signUpFunction(
      SignUpUser event, Emitter<SignUpState> emit) async {
    if (!event.phoneNumber.isValidatePhoneNumber()) {
      return null;
    }
    emit(SignUpStatusLoading());
    var data = <String, String>{};
    data['phone'] = event.phoneNumber;
    var response = await repo.callSignUpApi(data);
    if (response.isSuccess()) {
      emit(SignUpStatusSuccess(signUpDataResponse: response.data));
    } else {
      showToast(response.error ?? StringManager.somethingWentWrong);
      emit(SignUpStatusInitial());
    }
  }
}
