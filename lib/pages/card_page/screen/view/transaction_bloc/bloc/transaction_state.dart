part of 'transaction_bloc.dart';

abstract class TransactionState extends Equatable {
  const TransactionState();
  
  @override
  List<Object> get props => [];
}

class TransactionInitial extends TransactionState {}


class TransactionLoadingState extends TransactionState{}

class TransactionLoadingSuccessState extends TransactionState{
  final List<TransactionsModel> transactionsModel;

  const TransactionLoadingSuccessState({required this.transactionsModel});
}

class TransactionLoadingErrorState extends TransactionState{
 final String message;

  const TransactionLoadingErrorState({required this.message});
}
class AllTransactionLoadingState extends TransactionState{}

class AllTransactionLoadingErrorState extends TransactionState{
  final String message;

  const AllTransactionLoadingErrorState({required this.message});
}


class AllTransactionLoadingSuccessState extends TransactionState{
  final List<TransactionsModel> allTransactionModel;

  const AllTransactionLoadingSuccessState({required this.allTransactionModel});
}