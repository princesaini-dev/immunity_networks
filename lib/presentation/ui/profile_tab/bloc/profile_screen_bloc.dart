import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:immunity_networks/domain/repository/api_repository.dart';
import 'package:immunity_networks/presentation/resources/string_manager.dart';
import 'package:immunity_networks/presentation/ui/profile_tab/bloc/profile_screen_event.dart';
import 'package:immunity_networks/presentation/ui/profile_tab/bloc/profile_screen_state.dart';
import 'package:immunity_networks/presentation/utills/extentions.dart';

class ProfileScreenBloc extends Bloc<ProfileScreenEvent, ProfileScreenState> {
  final repo = ApiRepository();
  ProfileScreenBloc() : super(ProfileScreenInitial()) {
    on<ProfileScreenObject>(_onProfileApiCall);
  }

  Future<FutureOr<void>> _onProfileApiCall(
      ProfileScreenObject event, Emitter<ProfileScreenState> emit) async {
    emit(ProfileScreenStatusLoading());
    var response = await repo.getUserProfileData();
    if (response.isSuccess()) {
      emit(ProfileScreenStatusSuccess(userProfileDataModel: response.data!));
    } else {
      showToast(response.error ?? StringManager.somethingWentWrong);
      emit(ProfileScreenInitial());
    }
  }
}
