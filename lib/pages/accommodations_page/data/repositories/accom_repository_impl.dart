import 'package:autolife_application_3/pages/accommodations_page/domain/usecase/create_accom.dart';
import 'package:dartz/dartz.dart';


import '../../../../core/error/failures.dart';
import '../../domain/repositories/accom_repo.dart';
import '../datasource/accom_api.dart';
import '../model/accomm_model.dart';


class AccomRepositoryImpl implements AccommRepository {
  final AccommDataSource accommDataSource;

  AccomRepositoryImpl(this.accommDataSource);


  @override
  Future<Either<Failure, List<AccommodationsModel>>> getAccomInfo() async{
    try {
      var accomList = await accommDataSource.getAccomInfo();
      return Right(accomList);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
  
  @override
  Future<Either<Failure, AccommodationsModel>> postCreateCard(CreateAccommParams params)async {
    try {
      var accomModel =
          await accommDataSource.postCreateAccom(params.nameAccoms);
      return Right(accomModel);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
  // @override
  // Future<Either<Failure, List<CardModel>>> getCardInfo() async {
  //   try {
  //     var cardList = await accommDataSource.getCardInfo();
  //     return Right(cardList);
  //   } catch (e) {
  //     return Left(ServerFailure(e.toString()));
  //   }
  // }

  // @override
  // Future<Either<Failure, CardModel>> postCreateCard() async {
  //   try {
  //     var card = await cardDataSource.postCreateCard();
  //     return Right(card);
  //   } catch (e) {
  //     return Left(ServerFailure(e.toString()));
  //   }
  // }

//   @override
//   Future<Either<Failure, List<TransactionsModel>>> getTransactions(
//       TransactionParams params) async {
//     try {
//       var transactionsModel =
//           await cardDataSource.getTransactions(params.transactionData);
//       return Right(transactionsModel);
//     } catch (e) {
//       return Left(ServerFailure(e.toString()));
//     }
//   }
  
//   @override
//   Future<Either<Failure, List<TransactionsModel>>> postTransactionsAll() async{
// try {
//       var allTransactionList = await cardDataSource.posrTransactionsAll();
//       return Right(allTransactionList);
//     } catch (e) {
//       return Left(ServerFailure(e.toString()));
//     }
//   }
}
