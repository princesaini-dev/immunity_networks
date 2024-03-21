import 'package:immunity_networks/data/model/auth_data_model.dart';

abstract class VerifyOtpState {}

class VerifyOtpStatusInitial extends VerifyOtpState {}

class VerifyOtpStatusLoading extends VerifyOtpState {}

class VerifyOtpStatusSuccess extends VerifyOtpState {
  final AuthDataModel authDataModel;

  VerifyOtpStatusSuccess({required this.authDataModel});
}
