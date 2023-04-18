import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

import '../../../../../../core/usecases/usecase.dart';
import '../../../../data/model/card_transactions.dart';
import '../../../../domain/usecase/allTransaction.dart';
import '../../../../domain/usecase/transactions.dart';


part 'transaction_event.dart';
part 'transaction_state.dart';

class TransactionBloc extends Bloc<TransactionEvent, TransactionState> {
  final TransactionAll transactionAll;
  final TransactionCard transactionCardList;
  TransactionBloc(this.transactionCardList, this.transactionAll) : super(TransactionInitial()){
    on<TransactionEvent>((event, emit) async {
   if(event is GetTransactionEvent){
    final newTransactionList = await transactionCardList(TransactionParams(transactionData: event.transactionData));
    newTransactionList.fold((error){
    print("erroe $error");
    emit(TransactionLoadingErrorState(message: error.toString())); 
},(newTransactionList){
  print("Transaction loading success $newTransactionList");
  emit(TransactionLoadingSuccessState(transactionsModel: newTransactionList.reversed.toList()));
});
   }
   if(event is AllTransactionEvent){
 emit(AllTransactionLoadingState());
 try {
     print('Get AllTransactionCardList');
          final newAllTransactionList = await transactionAll(NoParams());
         newAllTransactionList.fold((error) {
            print(' errorState AllTransactionCardList $error');
            emit(AllTransactionLoadingErrorState(message: error.toString()));


    },(newAllTransactionList){
       print("Transaction loading success $newAllTransactionList");
        emit(AllTransactionLoadingSuccessState(allTransactionModel: newAllTransactionList.reversed.toList())); 
    } );
 } on DioError catch (e) {
   print('errorState $e');
   emit(AllTransactionLoadingErrorState(message: e.toString()));
 }catch(e){
  print('errorState $e');
   emit(AllTransactionLoadingErrorState(message: e.toString()));
 }
}
}

    );
  }

 
}
