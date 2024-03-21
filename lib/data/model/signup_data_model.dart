import 'package:immunity_networks/data/model/auth_data_model.dart';

class SignUpDataResponse {
  bool? status;
  String? message;
  User? user;
  String? urlCode;
  String? phone;
  int? otp;

  SignUpDataResponse(
      {this.status, this.message, this.user, this.urlCode, this.otp});

  SignUpDataResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    urlCode = json['url_code'];
    otp = json['otp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['status'] = status;
    data['message'] = message;
    if (user != null) {
      data['user'] = user!.toJson();
    }
    data['url_code'] = urlCode;
    data['otp'] = otp;
    return data;
  }
}
