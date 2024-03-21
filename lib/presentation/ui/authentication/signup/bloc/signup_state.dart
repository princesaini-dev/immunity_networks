import 'package:immunity_networks/data/model/signup_data_model.dart';

abstract class SignUpState {}

class SignUpStatusInitial extends SignUpState {}

class SignUpStatusLoading extends SignUpState {}

class SignUpStatusSuccess extends SignUpState {
  final SignUpDataResponse? signUpDataResponse;
  SignUpStatusSuccess({required this.signUpDataResponse});
}
