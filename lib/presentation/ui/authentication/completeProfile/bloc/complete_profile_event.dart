abstract class CompleteProfileEvent {}

class CompleteProfileUser extends CompleteProfileEvent {
  final String firstName;
  final String lastName;
  final String email;
  final String phoneNumber;
  final String password;
  CompleteProfileUser({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phoneNumber,
    required this.password,
  });
}
