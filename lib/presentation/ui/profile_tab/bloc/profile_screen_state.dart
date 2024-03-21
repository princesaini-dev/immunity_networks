import 'package:immunity_networks/data/model/user_profile_data_model.dart';

abstract class ProfileScreenState {}

class ProfileScreenInitial extends ProfileScreenState {}

class ProfileScreenStatusLoading extends ProfileScreenState {}

class ProfileScreenStatusSuccess extends ProfileScreenState {
  final UserProfileDataModel userProfileDataModel;
  ProfileScreenStatusSuccess({required this.userProfileDataModel});
}
