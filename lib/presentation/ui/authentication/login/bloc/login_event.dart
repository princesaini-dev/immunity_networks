abstract class LoginEvent {}

class LoginUser extends LoginEvent {
  final String phoneNumber;
  final String password;
  LoginUser({required this.phoneNumber, required this.password});
}
