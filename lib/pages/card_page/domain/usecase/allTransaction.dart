import 'package:dartz/dartz.dart';


import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../../data/model/card_transactions.dart';
import '../repositories/card_repo.dart';

class TransactionAll implements UseCase<List<TransactionsModel>, NoParams> {
  late final CardRepository cardrepository;

  TransactionAll(this.cardrepository);

  @override
  Future<Either<Failure, List<TransactionsModel>>> call(NoParams params) async {
    return await cardrepository.postTransactionsAll();
  }
}

