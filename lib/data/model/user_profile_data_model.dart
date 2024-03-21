class UserProfileDataModel {
  bool? status;
  String? message;
  UserProfile? userProfile;

  UserProfileDataModel({this.status, this.message, this.userProfile});

  UserProfileDataModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    userProfile = json['user_profile'] != null
        ? UserProfile.fromJson(json['user_profile'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (userProfile != null) {
      data['user_profile'] = userProfile!.toJson();
    }
    return data;
  }
}

class UserProfile {
  int? id;
  String? firstName;
  String? lastName;
  String? email;
  String? phone;
  String? photoUrl;

  UserProfile(
      {this.id,
      this.firstName,
      this.lastName,
      this.email,
      this.phone,
      this.photoUrl});

  UserProfile.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    phone = json['phone'];
    photoUrl = json['photo_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['email'] = email;
    data['phone'] = phone;
    data['photo_url'] = photoUrl;
    return data;
  }
}
