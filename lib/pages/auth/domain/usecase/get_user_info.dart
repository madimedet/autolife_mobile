import 'package:dartz/dartz.dart';

import 'package:equatable/equatable.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/user_entity.dart';
import '../repositories/auth_repo.dart';

// class GetUserInfo implements UseCase<UserEntity, TokenParams> {
//   final AuthRepository repository;

//   GetUserInfo(this.repository);

// //   @override
// //   Future<Either<Failure, UserEntity>> call(TokenParams params) async {
// //     return await repository.getUserInfo(params);
// //   }
// // }

// class TokenParams extends Equatable {
//   final String token;
//   const TokenParams({required this.token});

//   @override
//   List<Object> get props => [];
// }
