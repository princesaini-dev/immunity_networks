abstract class EditProfileScreenEvent {}

class EditProfileScreenObject extends EditProfileScreenEvent {
  String firstName;
  String lastName;
  String email;

  EditProfileScreenObject(
      {required this.firstName, required this.lastName, required this.email});
}
