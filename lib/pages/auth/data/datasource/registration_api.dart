import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import '../../../../core/error/exceptions.dart';
import '../../../../network_info/api_url.dart';
import '../model/auth_model.dart';
import '../model/token_model.dart';
import '../model/user_model.dart';

abstract class RegistrationDataSource {
  Future<UserInfo> registration(Registration registrationData);
  Future<TokenModel> authSignIn(String phone, String password);
 
}

class UserModel {}

class RegistrationDataSourceImpl implements RegistrationDataSource {
  final Dio dio;

  RegistrationDataSourceImpl({required this.dio});
  Map<String, String> headers = {
    "Content-Type": "application/json",
    "accept": "*/*"
  };

  // @override
  // Future<TokenModel> authSignIn(String phone, String password) async {
  //   print('phone: $phone');
  //   print('code: $password');
  //   var response = await dio
  //       .post('${Api.url}/user/login', data: {"phone_number": "$phone", "password": "$password", "role": "inspector"});

  //   print(response.data);
  //   print(response.statusCode);
  //   if (response.statusCode == 200) {
  //     print(response.data);
  //     return TokenModel.fromJson(response.data['payload']);
  //   } else {
  //     throw ServerException();
  //   }
  // }

  /// Get user info from back-end
  // @override
  // Future<UserInfo> getUserInfo(String token) async {
  //   debugPrint('GETTING USER INFO');
  //   headers.addAll({"Authorization": "Bearer $token"});
  //   Response response = await dio.get('${Api.url}/user/getUser',
  //       options: Options(
  //         headers: headers,
  //         validateStatus: (status) => status! < 501,
  //       ));

  //   if (response.statusCode == 200 || response.statusCode == 201) {
  //     debugPrint(response.data);
  //     var userResponse = convert.jsonDecode(response.data);
  //     return UserInfo.fromJson(userResponse);
  //   } else {
  //     throw ServerException();
  //   }
  // }

  @override
  Future<TokenModel> authSignIn(String phone, String password) async {
try{    debugPrint('phone: $phone');
    debugPrint('code: $password');
    var response =
        await http.post(Uri.parse('${Api.url}/api/auth/login'), body: {
      "phone": phone,
      "password": password,
    });

    debugPrint(response.body);
    // ignore: avoid_print
    print(response.statusCode);
    if (response.statusCode == 200 || response.statusCode == 201) {
      debugPrint(response.body);
      var jsonResponse =
          convert.jsonDecode(response.body) as Map<String, dynamic>;
      return TokenModel.fromJson(jsonResponse, response);
    } else {
      throw ServerException();
    }}catch(e){
      print(e);
     throw ServerException();
    }
  }

  @override
  Future<UserInfo> registration(Registration registrationData) async {
    debugPrint('datasource $registrationData');
    var json = {
      "uin": "${registrationData.uin}",
      "password": "${registrationData.password}",
      "firstName": "${registrationData.firstName}",
      "midName": "${registrationData.midName}",
      "lastName": "${registrationData.lastName}",
      "phone": "${registrationData.phone}"
    };
    debugPrint('json $json');

    var response = await http.post(
        Uri.parse('${Api.url}/api/auth/registration'),
        body: jsonEncode(json),
        headers: headers);

    debugPrint(response.body);
    debugPrint(response.statusCode.toString());
    if (response.statusCode == 200 || response.statusCode == 201) {
      debugPrint(response.body);
      var jsonResponse =
          convert.jsonDecode(response.body) as Map<String, dynamic>;
      return UserInfo.fromJson(jsonResponse);
    } else {
      throw ServerException();
    }
  }
}
