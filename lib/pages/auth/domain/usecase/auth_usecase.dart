import 'package:dartz/dartz.dart';

import 'package:equatable/equatable.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/token_entity.dart';
import '../repositories/auth_repo.dart';

class AuthSignIn implements UseCase<TokenEntity, AuthSignParams> {
  final AuthRepository repository;

  AuthSignIn(this.repository);

  @override
  Future<Either<Failure, TokenEntity>> call(AuthSignParams params) async {
    return await repository.loginSignin(params);
  }
}

class AuthSignParams extends Equatable {
  final String phoneNumber;
  final String password;

  const AuthSignParams({required this.phoneNumber, required this.password});

  @override
  List<Object> get props => [phoneNumber, password];
}
