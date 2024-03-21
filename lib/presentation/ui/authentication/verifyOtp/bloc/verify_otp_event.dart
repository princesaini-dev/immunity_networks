abstract class VerifyOtpEvent {}

class VerifyOtpObject extends VerifyOtpEvent {
  final String otpCode;
  final String urlCode;
  final String phoneNumber;

  VerifyOtpObject({
    required this.otpCode,
    required this.urlCode,
    required this.phoneNumber,
  });
}
