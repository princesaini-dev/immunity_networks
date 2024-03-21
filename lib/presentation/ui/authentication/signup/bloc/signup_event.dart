abstract class SignUpEvent {}

class SignUpUser extends SignUpEvent {
  final String phoneNumber;
  SignUpUser({required this.phoneNumber});
}
