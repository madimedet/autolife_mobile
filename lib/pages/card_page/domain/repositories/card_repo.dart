
import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../data/model/card_model.dart';
import '../../data/model/card_transactions.dart';
import '../entities/card_entity.dart';
import '../usecase/get_card_info.dart';
import '../usecase/transactions.dart';

abstract class CardRepository {
  Future<Either<Failure, CardModel>> postCreateCard();
  Future<Either<Failure, List<CardModel>>> getCardInfo();
  Future<Either<Failure, List<TransactionsModel>>> getTransactions(
      TransactionParams params);
  Future<Either<Failure, List<TransactionsModel>>> postTransactionsAll();
}
