import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';


import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../../data/model/auth_model.dart';
import '../../data/model/user_model.dart';
import '../repositories/auth_repo.dart';

class RegistarationUseCase implements UseCase<UserInfo, RegistarationParams> {
  final AuthRepository repository;

  RegistarationUseCase(this.repository);

  @override
  Future<Either<Failure, UserInfo>> call(RegistarationParams params) async {
    return await repository.authSignIn(params);
  }
}

class RegistarationParams extends Equatable {
  final Registration registration;

  const RegistarationParams({required this.registration});

  @override
  List<Object> get props => [registration];
}
