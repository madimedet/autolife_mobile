
import 'package:autolife_application_3/pages/accommodations_page/domain/usecase/create_accom.dart';
import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../../data/model/accomm_model.dart';


abstract class AccommRepository {
  Future<Either<Failure, AccommodationsModel>> postCreateCard(CreateAccommParams createAccommParams);
  Future<Either<Failure, List<AccommodationsModel>>> getAccomInfo();
  // Future<Either<Failure, List<TransactionsModel>>> getTransactions(
  //     TransactionParams params);
  // Future<Either<Failure, List<TransactionsModel>>> postTransactionsAll();
}
