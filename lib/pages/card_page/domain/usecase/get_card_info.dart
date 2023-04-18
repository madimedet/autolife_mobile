import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../../data/model/card_model.dart';
import '../entities/card_entity.dart';
import '../repositories/card_repo.dart';

class GetCardInfo implements UseCase<List<CardModel>, NoParams> {
  late final CardRepository cardrepository;

  GetCardInfo(this.cardrepository);

  @override
  Future<Either<Failure, List<CardModel>>> call(NoParams params) async {
    return await cardrepository.getCardInfo();
  }
}

class TokenParams extends Equatable {
  final String token;
  const TokenParams({required this.token});

  @override
  List<Object> get props => [];
}
