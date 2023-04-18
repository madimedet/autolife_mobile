import 'package:autolife_application_3/pages/auth/domain/usecase/get_user_info.dart';
import 'package:dartz/dartz.dart';


import '../../../../core/error/failures.dart';
import '../../../accommodations_page/domain/usecase/get_accom_info.dart';
import '../../domain/entities/token_entity.dart';
import '../../domain/entities/user_entity.dart';
import '../../domain/repositories/auth_repo.dart';
import '../../domain/usecase/auth_usecase.dart';
import '../../domain/usecase/use_case.dart';
import '../datasource/local_datasource.dart';
import '../datasource/registration_api.dart';
import '../model/token_model.dart';
import '../model/user_model.dart';

class AuthRepositoryImpl implements AuthRepository {
  final RegistrationDataSource remoteDataSource;

  final AuthenticationLocalDataSource localDataSource;
  AuthRepositoryImpl(this.remoteDataSource, this.localDataSource);

  @override
  Future<Either<Failure, UserInfo>> authSignIn(
      RegistarationParams params) async {
    try {
      // ignore: avoid_print
      print('try ${params.registration.uin}');
      UserInfo userInfo =
          await remoteDataSource.registration(params.registration);

      return Right(userInfo);
    } catch (e) {
      // ignore: avoid_print
      print('Error $e');
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> logout() {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, TokenEntity>> getTokenFromLocal() {
    throw UnimplementedError();
  }

  
  @override
  Future<Either<Failure, TokenEntity>> loginSignin(
      AuthSignParams params) async {
    try {
      TokenModel tokenEntity = await remoteDataSource.authSignIn(
          params.phoneNumber, params.password);
      bool isSavedToken = await localDataSource.saveToken(tokenEntity.token);

      if (isSavedToken) {
        return Right(tokenEntity);
      } else {
        return Left(CacheFailure());
      }
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> getUserInfo(TokenParams params) {
    // TODO: implement getUserInfo
    throw UnimplementedError();
  }

  // @override
  // Future<Either<Failure, TokenEntity>> getTokenFromLocal() async {
  //   try {
  //     String token = await localDataSource.getToken();
  //     String refreshToken = await localDataSource.getRefreshToken();
  //     TokenEntity tokenEntity = TokenModel(token: token, refreshToken: refreshToken);
  //     print(token);
  //     print(refreshToken);
  //     return Right(tokenEntity);
  //   } catch (e) {
  //     return Left(CacheFailure());
  //   }
  // }

  // @override
  // Future<Either<Failure, UserEntity>> getUserInfo(TokenParams params) async {
  // if (await networkInfo.isConnected) {
  //     try {
  //       var userModel = await remoteDataSource.getUserInfo(params.token);
  //       return Right(userModel);
  //     } catch (e) {
  //       return Left(ServerFailure(e.toString()));
  //     }
  //   } else {
  //     return Left(NetworkFailure());
  //   }
  // }

  // @override
  // Future<Either<Failure, bool>> logout() async {
  //  try {
  //     bool isDeletedToken = await localDataSource.deleteToken();
  //     if (isDeletedToken) {
  //       return Right(true);
  //     } else {
  //       return Left(CacheFailure());
  //     }
  //   } catch (e) {
  //     return Left(CacheFailure());
  //   }
  // }

}
