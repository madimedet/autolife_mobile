import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/token_entity.dart';
import '../repositories/auth_repo.dart';

class GetToken implements UseCase<TokenEntity, NoParams> {
  final AuthRepository repository;

  GetToken(this.repository);

  @override
  Future<Either<Failure, TokenEntity>> call(NoParams noParams) async {
    return await repository.getTokenFromLocal();
  }
}
