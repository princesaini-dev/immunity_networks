import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:immunity_networks/app/api_constants.dart';
import 'package:immunity_networks/data/base_response_model/api_response.dart';
import 'package:immunity_networks/domain/storage/secure_storage.dart';
import 'package:immunity_networks/presentation/utills/extentions.dart';

class HttpClient extends SecureStorage {
  final dio = Dio();

  void configureDio() {
    dio.options.baseUrl = ApiConstants.baseUrl;
    dio.options.connectTimeout = const Duration(seconds: 15);
    dio.options.receiveTimeout = const Duration(seconds: 15);
  }

  Future<ApiRsponse> post(String endpoint, {Object? body}) async {
    try {
      configureDio();
      final header = await getHeaderData();
      "Http request::: POST ${ApiConstants.baseUrl + endpoint} \n  Header  : $header \n Body : $body \n"
          .printMessage();
      final response = await dio.post(endpoint,
          data: jsonEncode(body),
          options: Options(
            headers: header,
          ));
      "Http response::: URL : ${ApiConstants.baseUrl + endpoint} \n Status : ${response.statusCode} \n body : ${response.data} \n"
          .printMessage();
      final Map<String, dynamic> object = response.data;
      if (response.statusCode?.isSuccess() ?? false) {
        return ApiRsponse(data: object);
      } else {
        return ApiRsponse(error: object['message']);
      }
    } on DioException catch (e) {
      "Http Error::: URL : ${ApiConstants.baseUrl + endpoint} \n Error : ${e.response} \n"
          .printMessage();
      return ApiRsponse(error: e.response?.data['message']);
    }
  }

  Future<ApiRsponse> get(String endpoint) async {
    try {
      configureDio();
      final header = await getHeaderData();
      "Http request::: GET ${ApiConstants.baseUrl + endpoint} \n  Header  : $header \n \n"
          .printMessage();
      final response = await dio.get(endpoint,
          options: Options(
            headers: header,
          ));
      "Http response::: URL : ${ApiConstants.baseUrl + endpoint} \n Status : ${response.statusCode} \n body : ${response.data} \n"
          .printMessage();
      final Map<String, dynamic> object = response.data;
      if (response.statusCode?.isSuccess() ?? false) {
        return ApiRsponse(data: object);
      } else {
        return ApiRsponse(error: object['message']);
      }
    } on DioException catch (e) {
      "Http Error::: URL : ${ApiConstants.baseUrl + endpoint} \n Error : ${e.response} \n"
          .printMessage();
      return ApiRsponse(error: e.response?.data['message']);
    }
  }
}

extension HttpValidate on int {
  bool isSuccess() {
    if (this >= 200 && this < 300) {
      return true;
    } else {
      return false;
    }
  }

  bool isUnauthorized() {
    if (this == 403) {
      return true;
    } else {
      return false;
    }
  }
}
