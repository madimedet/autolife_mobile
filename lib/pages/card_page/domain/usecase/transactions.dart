import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';


import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';

import '../../data/model/card_transactions.dart';
import '../repositories/card_repo.dart';

class TransactionCard implements UseCase<List<TransactionsModel>, TransactionParams> {
  late final CardRepository cardrepository;

  TransactionCard(this.cardrepository);

  @override
  Future<Either<Failure, List<TransactionsModel>>> call(
      TransactionParams params) async {
    return await cardrepository.getTransactions(params);
  }
}

class TransactionParams extends Equatable { 
  final int transactionData;
  const TransactionParams({required this.transactionData});

  @override
  List<Object> get props => [transactionData];
}
