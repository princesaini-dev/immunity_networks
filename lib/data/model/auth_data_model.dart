class AuthDataModel {
  bool? status;
  String? message;
  User? user;
  bool? profileComplete;
  String? token;

  AuthDataModel(
      {this.status, this.message, this.user, this.profileComplete, this.token});

  AuthDataModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    user = json['user'] != null
        ? User.fromJson(json['user'])
        : (json['User'] != null ? User.fromJson(json['User']) : null);
    profileComplete = json['profile_complete'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (user != null) {
      data['user'] = user!.toJson();
      data['User'] = user!.toJson(); // Include 'User' key
    }
    data['profile_complete'] = profileComplete;
    data['token'] = token;
    return data;
  }
}

class User {
  int? id;
  String? firstName;
  String? lastName;
  String? email;
  String? phone;
  int? role;
  String? emailVerifiedAt;
  String? createdAt;
  String? updatedAt;
  String? photo;
  int? pdoType;
  String? otpVerifiedOn;
  int? distributor;
  int? isParentId;
  int? distributorType;
  int? status;
  String? subDistributorComission;
  String? photoUrl;
  String? fullName;
  String? appPassword;

  User(
      {this.id,
      this.firstName,
      this.lastName,
      this.email,
      this.phone,
      this.role,
      this.emailVerifiedAt,
      this.createdAt,
      this.updatedAt,
      this.photo,
      this.pdoType,
      this.otpVerifiedOn,
      this.distributor,
      this.isParentId,
      this.distributorType,
      this.status,
      this.subDistributorComission,
      this.photoUrl,
      this.fullName,
      this.appPassword});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    phone = json['phone'];
    role = json['role'];
    emailVerifiedAt = json['email_verified_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    photo = json['photo'];
    pdoType = json['pdo_type'];
    otpVerifiedOn = json['otp_verified_on'];
    distributor = json['distributor'];
    isParentId = json['is_parentId'];
    distributorType = json['distributor_type'];
    status = json['status'];
    subDistributorComission = json['sub_distributor_comission'];
    photoUrl = json['photo_url'];
    fullName = json['full_name'];
    appPassword = json['app_password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['email'] = email;
    data['phone'] = phone;
    data['role'] = role;
    data['email_verified_at'] = emailVerifiedAt;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['photo'] = photo;
    data['pdo_type'] = pdoType;
    data['otp_verified_on'] = otpVerifiedOn;
    data['distributor'] = distributor;
    data['is_parentId'] = isParentId;
    data['distributor_type'] = distributorType;
    data['status'] = status;
    data['sub_distributor_comission'] = subDistributorComission;
    data['photo_url'] = photoUrl;
    data['full_name'] = fullName;
    data['app_password'] = appPassword;
    return data;
  }
}
