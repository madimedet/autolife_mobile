
import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../../data/model/user_model.dart';
import '../entities/token_entity.dart';
import '../entities/user_entity.dart';
import '../usecase/auth_usecase.dart';
import '../usecase/get_user_info.dart';
import '../usecase/use_case.dart';

abstract class AuthRepository {
  Future<Either<Failure, TokenEntity>> loginSignin(AuthSignParams params);
  Future<Either<Failure, UserInfo>> authSignIn(RegistarationParams params);
  // Future<Either<Failure, UserEntity>> getUserInfo(TokenParams params);
  Future<Either<Failure, TokenEntity>> getTokenFromLocal();

  Future<Either<Failure, bool>> logout();
}
