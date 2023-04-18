import 'package:flutter/cupertino.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../../../../core/database/consts.dart';
import '../../../../core/error/failures.dart';

abstract class AuthenticationLocalDataSource {
  Future<bool> saveToken(String token);
  Future<bool> deleteToken();
  Future<String> getToken();

  Future<bool> saveRefreshToken(String token);
  Future<String> getRefreshToken();
}

class AuthenticationLocalDataSourceImpl
    implements AuthenticationLocalDataSource {
  static const FlutterSecureStorage _storage = FlutterSecureStorage();

  @override
  Future<bool> saveToken(String token) async {
    // ignore: avoid_print
    print("SAVING TOKEN");
    await _storage.write(key: ConstantsForData.ACCESS_TOKEN, value: token);
    return true;
  }

  @override
  Future<String> getToken() async {
    debugPrint("GETTING TOKEN");
    if (await _storage.containsKey(key: ConstantsForData.ACCESS_TOKEN)) {
      var token = await _storage.read(key: ConstantsForData.ACCESS_TOKEN);

      if (token != null && token != '') {
        debugPrint("TOKEN GOT: $token");
        return token;
      } else {
        throw CacheFailure();
      }
    } else {
      throw CacheFailure();
    }
  }

  @override
  Future<bool> deleteToken() async {
    await _storage.delete(key: ConstantsForData.ACCESS_TOKEN);
    await _storage.delete(key: ConstantsForData.REFRESH_TOKEN);
    return true;
  }

  @override
  Future<String> getRefreshToken() async {
    debugPrint("GETTING REFRESH TOKEN");
    if (await _storage.containsKey(key: ConstantsForData.REFRESH_TOKEN)) {
      var token = await _storage.read(key: ConstantsForData.REFRESH_TOKEN);

      if (token != null && token != '') {
        debugPrint("REFRESH TOKEN GOT: $token");
        return token;
      } else {
        throw CacheFailure();
      }
    } else {
      throw CacheFailure();
    }
  }

  @override
  Future<bool> saveRefreshToken(String token) async {
    debugPrint("SAVING TOKEN");
    await _storage.write(key: ConstantsForData.REFRESH_TOKEN, value: token);
    return true;
  }
}
