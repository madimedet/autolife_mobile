
// ignore: implementation_imports
import 'package:http/src/response.dart';
import '../../domain/entities/token_entity.dart';

class TokenModel extends TokenEntity {
  const TokenModel({
    required String token,
  }) : super(token);

  factory TokenModel.fromJson(Map<String, dynamic> json, Response response) =>
      TokenModel(
        token: json['access_token'],
      );
}
