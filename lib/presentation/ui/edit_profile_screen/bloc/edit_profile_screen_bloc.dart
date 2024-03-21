import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:immunity_networks/domain/repository/api_repository.dart';
import 'package:immunity_networks/presentation/resources/string_manager.dart';
import 'package:immunity_networks/presentation/ui/edit_profile_screen/bloc/edit_profile_screen_event.dart';
import 'package:immunity_networks/presentation/ui/edit_profile_screen/bloc/edit_profile_screen_state.dart';
import 'package:immunity_networks/presentation/utills/extentions.dart';

class EditProfileScreenBloc
    extends Bloc<EditProfileScreenEvent, EditProfileScreenState> {
  final repo = ApiRepository();
  EditProfileScreenBloc() : super(EditProfileScreenInitial()) {
    on<EditProfileScreenObject>(_onProfileEditApiCall);
  }

  Future<FutureOr<void>> _onProfileEditApiCall(EditProfileScreenObject event,
      Emitter<EditProfileScreenState> emit) async {
    if (!event.firstName.validateField(StringManager.firstName)) {
      return null;
    } else if (!event.lastName.validateField(StringManager.lastName)) {
      return null;
    } else if (!event.email.isValidateEmail()) {
      return null;
    }
    emit(EditProfileScreenStatusLoading());
    var params = <String, String>{};
    params['first_name'] = event.firstName;
    params['last_name'] = event.lastName;
    params['email'] = event.email;
    var response = await repo.updateUserProfileData(params);
    if (response.isSuccess()) {
      emit(EditProfileScreenStatusSuccess());
    } else {
      showToast(response.error ?? StringManager.somethingWentWrong);
      emit(EditProfileScreenInitial());
    }
  }
}
