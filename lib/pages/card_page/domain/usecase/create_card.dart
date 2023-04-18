import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../../data/model/card_model.dart';
import '../entities/card_entity.dart';
import '../repositories/card_repo.dart';

class CreateCard implements UseCase<CardModel, NoParams> {
  late final CardRepository cardrepository;

  CreateCard(this.cardrepository);

  @override
  Future<Either<Failure, CardModel>> call(NoParams params) async {
    return await cardrepository.postCreateCard();
  }
}
