import 'package:dartz/dartz.dart';


import '../../../../core/error/failures.dart';
import '../../domain/repositories/card_repo.dart';
import '../../domain/usecase/transactions.dart';
import '../datasource/credit_card_api.dart';
import '../model/card_model.dart';
import '../model/card_transactions.dart';

class CaardRepositoryImpl implements CardRepository {
  final CreditCardDataSource cardDataSource;

  CaardRepositoryImpl(this.cardDataSource);

  @override
  Future<Either<Failure, List<CardModel>>> getCardInfo() async {
    try {
      var cardList = await cardDataSource.getCardInfo();
      return Right(cardList);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, CardModel>> postCreateCard() async {
    try {
      var card = await cardDataSource.postCreateCard();
      return Right(card);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<TransactionsModel>>> getTransactions(
      TransactionParams params) async {
    try {
      var transactionsModel =
          await cardDataSource.getTransactions(params.transactionData);
      return Right(transactionsModel);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
  
  @override
  Future<Either<Failure, List<TransactionsModel>>> postTransactionsAll() async{
try {
      var allTransactionList = await cardDataSource.posrTransactionsAll();
      return Right(allTransactionList);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
