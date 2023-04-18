part of 'transaction_bloc.dart';

class TransactionEvent {}


class GetTransactionEvent extends TransactionEvent{
  final int transactionData;

  GetTransactionEvent({required this.transactionData});
}


class AllTransactionEvent extends TransactionEvent{}