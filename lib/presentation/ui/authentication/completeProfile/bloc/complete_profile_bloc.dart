import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:immunity_networks/domain/repository/api_repository.dart';
import 'package:immunity_networks/presentation/resources/string_manager.dart';
import 'package:immunity_networks/presentation/ui/authentication/completeProfile/bloc/complete_profile_event.dart';
import 'package:immunity_networks/presentation/ui/authentication/completeProfile/bloc/complete_profile_state.dart';
import 'package:immunity_networks/presentation/utills/extentions.dart';

class CompleteProfileBloc
    extends Bloc<CompleteProfileEvent, CompleteProfileState> {
  final repo = ApiRepository();
  CompleteProfileBloc() : super(CompleteProfileStatusInitial()) {
    on<CompleteProfileUser>(_completeProfileFunction);
  }

  Future<FutureOr<void>> _completeProfileFunction(
      CompleteProfileUser event, Emitter<CompleteProfileState> emit) async {
    if (!event.firstName.validateField(StringManager.firstName)) {
      return null;
    } else if (!event.lastName.validateField(StringManager.lastName)) {
      return null;
    } else if (!event.email.isValidateEmail()) {
      return null;
    } else if (!event.password.isValidatePassword()) {
      return null;
    }
    emit(CompleteProfileStatusLoading());
    var data = <String, String>{};
    data['first_name'] = event.firstName;
    data['last_name'] = event.lastName;
    data['email'] = event.email;
    data['phone'] = event.phoneNumber;
    data['password'] = event.password;
    data['password_confirmation'] = event.password;
    data['referral_id'] = '111';
    var response = await repo.callCompleteProfileApi(data);
    if (response.isSuccess()) {
      emit(CompleteProfileStatusSuccess());
    } else {
      showToast(response.error ?? StringManager.somethingWentWrong);
      emit(CompleteProfileStatusInitial());
    }
  }
}
