import 'dart:async';
import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:immunity_networks/domain/repository/api_repository.dart';
import 'package:immunity_networks/presentation/resources/string_manager.dart';
import 'package:immunity_networks/presentation/ui/authentication/verifyOtp/bloc/verify_otp_event.dart';
import 'package:immunity_networks/presentation/ui/authentication/verifyOtp/bloc/verify_otp_state.dart';
import 'package:immunity_networks/presentation/utills/extentions.dart';

class VerifyOtpBloc extends Bloc<VerifyOtpEvent, VerifyOtpState> {
  final repo = ApiRepository();
  VerifyOtpBloc() : super(VerifyOtpStatusInitial()) {
    on<VerifyOtpObject>(_verifyOtpFunction);
  }

  Future<FutureOr<void>> _verifyOtpFunction(
      VerifyOtpObject event, Emitter<VerifyOtpState> emit) async {
    if (!event.otpCode.validateOTPField()) {
      return null;
    }
    emit(VerifyOtpStatusLoading());
    var data = <String, String>{};
    data['phone'] = event.phoneNumber;
    data['otp'] = event.otpCode;
    data['url_code'] = event.urlCode;
    if (Platform.isAndroid) {
      data['platform'] = 'android';
    } else if (Platform.isIOS) {
      data['platform'] = 'ios';
    }
    data['fcm_token'] = "token";
    data['device_id'] = 'Unknown';
    var response = await repo.callVerifyOtpApi(data);
    if (response.isSuccess()) {
      emit(VerifyOtpStatusSuccess(authDataModel: response.data!));
    } else {
      showToast(response.error ?? StringManager.somethingWentWrong);
      emit(VerifyOtpStatusInitial());
    }
  }
}
