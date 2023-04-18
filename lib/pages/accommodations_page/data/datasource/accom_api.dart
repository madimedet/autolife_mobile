// ignore: unused_import
import 'dart:convert';
import 'dart:ffi';
import 'dart:math';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

// ignore: unused_import
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import '../../../../../core/error/exceptions.dart';
import '../../../../core/database/auth_params.dart';
import '../../../../core/di/injection_container.dart';
import '../../../../network_info/api_url.dart';
import '../model/accomm_model.dart';

abstract class AccommDataSource {
  Future<AccommodationsModel> postCreateAccom(String nameAccom);
  Future<List<AccommodationsModel>> getAccomInfo();

}

class AccommDataSourceImpl implements AccommDataSource {
  final Dio dio;

  AccommDataSourceImpl({required this.dio});
  Map<String, String> headers = {
    "Content-Type": "application/json",
    "accept": "*/*",
  };
  
  @override
  Future<List<AccommodationsModel>> getAccomInfo()async {
    try {
      String token = sl<AuthConfig>().token ?? '';
      debugPrint('GETTING ACCOM INFO');
      headers.addAll({"Authorization": "Bearer $token"});
      Response response = await dio.get('${Api.url}/api/accommodations',
          options: Options(
            headers: headers,
            validateStatus: (status) => status! < 501,
          ));

      if (response.statusCode == 200 || response.statusCode == 201) {
        List cardResponce = response.data;
        return cardResponce.map((e) => AccommodationsModel.fromJson(e)).toList();
      } else {
        throw ServerException();
      }
    } catch (e) {
      rethrow;
    }
  }
  
  @override
  Future<AccommodationsModel> postCreateAccom(String nameAccom)async {
      try {
      String token = sl<AuthConfig>().token ?? '';
      debugPrint('CREATING ACCOM');
      headers.addAll({"Authorization": "Bearer $token"});
      Response response = await dio.post('${Api.url}/api/accommodations',
      data: { 'name': nameAccom},
          options: Options(
            headers: headers,
            validateStatus: (status) => status! < 501,
          ));
      print(response.statusCode);
      if (response.statusCode == 200 || response.statusCode == 201) {
        return AccommodationsModel.fromJson(response.data);
      } else {
        throw ServerException();
      }
    } catch (e) {
      print(e);
      rethrow;
    }
  }


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
  // Future<List<CardModel>> getCardInfo() async {
  //   try {
  //     String token = sl<AuthConfig>().token ?? '';
  //     debugPrint('GETTING CARDS INFO');
  //     headers.addAll({"Authorization": "Bearer $token"});
  //     Response response = await dio.get('${Api.url}/api/cards',
  //         options: Options(
  //           headers: headers,
  //           validateStatus: (status) => status! < 501,
  //         ));

  //     if (response.statusCode == 200 || response.statusCode == 201) {
  //       List cardResponce = response.data;
  //       return cardResponce.map((e) => CardModel.fromJson(e)).toList();
  //     } else {
  //       throw ServerException();
  //     }
  //   } catch (e) {
  //     rethrow;
  //   }
  // }
//  List<CardModel> parseCardModel(String responseBody) {
//     final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();

//     return parsed.map<CardModel>((json) => CardModel.fromJson(json)).toList();
//   }
  // @override
  // Future<CardModel> postCreateCard() async {
  //   try {
  //     String token = sl<AuthConfig>().token ?? '';
  //     debugPrint('CREATING CREDIT CARD');
  //     headers.addAll({"Authorization": "Bearer $token"});
  //     Response response = await dio.post('${Api.url}/api/cards/create', 
  //         options: Options(
  //           headers: headers,
  //           validateStatus: (status) => status! < 501,
  //         ));
  //     print(response.statusCode);
  //     if (response.statusCode == 200 || response.statusCode == 201) {
  //       return CardModel.fromJson(response.data);
  //     } else {
  //       throw ServerException();
  //     }
  //   } catch (e) {
  //     print(e);
  //     rethrow;
  //   }
  // }
 
  
}
