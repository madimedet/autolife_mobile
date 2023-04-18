import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/model/card_transactions.dart';
import '../widgets/widgets/transaction_container.dart';
import 'transaction_bloc/bloc/transaction_bloc.dart';

class AllTransactionDataPage extends StatefulWidget {
  const AllTransactionDataPage({super.key});

  @override
  State<AllTransactionDataPage> createState() => _AllTransactionDataPage();
}

class _AllTransactionDataPage extends State<AllTransactionDataPage> {

  List<TransactionsModel> cardTransactionData = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocConsumer<TransactionBloc, TransactionState>(
      listener: (context, state) {
        if (state is AllTransactionLoadingErrorState) {
              ScaffoldMessenger.of(context)
                ..hideCurrentSnackBar()
                ..showSnackBar(
                  const SnackBar(
                    behavior: SnackBarBehavior.floating,
                    content: Text('Ошибка при загрузке транзакции',
                        textScaleFactor: 1.0),
                    duration: Duration(milliseconds: 3000),
                  ),
                );
            }
      },
      builder: (context, state) {
         if (state is AllTransactionLoadingState) {
           return   const Center(child: CircularProgressIndicator());
            }
        return SingleChildScrollView(
              child: Column(
            children: [              
              cardTransactionData.isNotEmpty
                  ? ListView.builder(
                      shrinkWrap: true,
                      itemCount: cardTransactionData.length,
                      itemBuilder: (context, index) {
                        return TransactionWidget(
                          id: cardTransactionData[index].id,
                          createdAt: cardTransactionData[index].createdAt,
                          currency: cardTransactionData[index].currency,
                          referenceId: cardTransactionData[index].referenceId,
                          serviceDescription:
                              cardTransactionData[index].serviceDescription,
                          serviceAmount:
                              cardTransactionData[index].serviceAmount,
                          userId: cardTransactionData[index].userId,
                          serviceId: cardTransactionData[index].serviceId,
                        );
                      })
                  :  const Padding(
                    padding: EdgeInsets.only(top: 12.0),
                    child: SizedBox(height: 60,child: Center(child: Text("У вас пока нет транзакции"))),
                  ),
              Container(
                margin: const EdgeInsets.only(top: 24.0),
                alignment: Alignment.center,
                child: FloatingActionButton(
                  elevation: 2.0,
                  onPressed: () {
                  
                    context.read<TransactionBloc>().add(AllTransactionEvent());
                  },
                  backgroundColor: Colors.blue,
                  mini: false,
                  child: const Icon(Icons.refresh_sharp),
                ),
              )
            ],
          ));
      },
    ));
  }
}
