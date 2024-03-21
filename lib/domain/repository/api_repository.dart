import 'package:immunity_networks/app/api_constants.dart';
import 'package:immunity_networks/data/base_response_model/api_response.dart';
import 'package:immunity_networks/data/model/auth_data_model.dart';
import 'package:immunity_networks/data/model/signup_data_model.dart';
import 'package:immunity_networks/data/model/user_profile_data_model.dart';
import 'package:immunity_networks/domain/repository/http_client.dart';
import 'package:immunity_networks/presentation/utills/extentions.dart';

class ApiRepository extends HttpClient {
  Future<ApiRsponse<AuthDataModel?>> callLoginApi(
      Map<String, String> data) async {
    var result = await post(ApiConstants.loginApi, body: data);
    if (result.data != null) {
      final userData = AuthDataModel.fromJson(result.data);
      saveAuthenticationInfo(userData);
      return ApiRsponse(data: userData);
    } else {
      return ApiRsponse(error: result.error);
    }
  }

  Future<ApiRsponse<SignUpDataResponse?>> callSignUpApi(
      Map<String, String> data) async {
    var result = await post(ApiConstants.signUpApi, body: data);
    if (result.data != null) {
      final userData = SignUpDataResponse.fromJson(result.data);
      showToast(userData.message!);
      return ApiRsponse(data: userData);
    } else {
      return ApiRsponse(error: result.error);
    }
  }

  Future<ApiRsponse<AuthDataModel?>> callVerifyOtpApi(
      Map<String, String> data) async {
    var result = await post(ApiConstants.verifyOtpApi, body: data);
    if (result.data != null) {
      final userData = AuthDataModel.fromJson(result.data);
      saveAuthenticationInfo(userData);
      return ApiRsponse(data: userData);
    } else {
      return ApiRsponse(error: result.error);
    }
  }

  Future<ApiRsponse<AuthDataModel?>> callCompleteProfileApi(
      Map<String, String> data) async {
    var result = await post(ApiConstants.completeProfileApi, body: data);
    if (result.data != null) {
      final userData = AuthDataModel.fromJson(result.data);
      saveAuthenticationInfo(userData);
      return ApiRsponse(data: userData);
    } else {
      return ApiRsponse(error: result.error);
    }
  }

  Future<ApiRsponse<UserProfileDataModel?>> getUserProfileData() async {
    var result = await get(ApiConstants.getUserProfileApi);
    if (result.data != null) {
      final userData = UserProfileDataModel.fromJson(result.data);
      return ApiRsponse(data: userData);
    } else {
      return ApiRsponse(error: result.error);
    }
  }

  Future<ApiRsponse<UserProfileDataModel?>> updateUserProfileData(Map<String, String> params) async {
    var result = await post(ApiConstants.updateUserProfileApi,body: params);
    if (result.data != null) {
      final userData = UserProfileDataModel.fromJson(result.data);
      showToast(userData.message??"");
      return ApiRsponse(data: userData);
    } else {
      return ApiRsponse(error: result.error);
    }
  }

}
