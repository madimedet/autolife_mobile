import 'package:autolife_application_3/pages/card_page/screen/view/transaction_bloc/bloc/transaction_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../auth/screen/widgets/const_widgets.dart';
import '../../data/model/card_transactions.dart';
import '../widgets/widgets/transaction_container.dart';

class TransactionDataPage extends StatefulWidget {
  const TransactionDataPage({super.key});

  @override
  State<TransactionDataPage> createState() => _TransactionDataPageState();
}

class _TransactionDataPageState extends State<TransactionDataPage> {
  final TextEditingController search = TextEditingController();
  List<TransactionsModel> cardTransactionData = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
        body: BlocConsumer<TransactionBloc, TransactionState>(
      listener: (context, state) {
        if (state is TransactionLoadingErrorState) {
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
         if (state is TransactionLoadingState) {
           return   const Center(child: CircularProgressIndicator());
            }
        return SingleChildScrollView(
              child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top:12.0),
                child: Textfield1(
                    labelText: "введите цисло",
                    color: Colors.black,
                    controller: search,
                    keyboard: TextInputType.number),
              ),
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
                  : const Padding(
                    padding: EdgeInsets.only(top: 12.0),
                    child: SizedBox(height: 60,child: Center(child: Text("список пуст"))),
                  ),
              Container(
                margin: const EdgeInsets.only(top: 24.0),
                alignment: Alignment.center,
                child: FloatingActionButton(
                  elevation: 2.0,
                  onPressed: () {
                  if(search.text.isNotEmpty){  print("${search.text}}");
                    context.read<TransactionBloc>().add(GetTransactionEvent(
                        transactionData: int.parse(search.text)));}else{
                              ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              const SnackBar(
                behavior: SnackBarBehavior.floating,
                content: Text('Поле не может быть пустым',
                    textScaleFactor: 1.0),
                duration: Duration(milliseconds: 3000),
                backgroundColor: Colors.red,
              ),
            );
                        }
                  },
                  backgroundColor: Colors.blue,
                  mini: false,
                  child: const Icon(Icons.get_app_outlined),
                ),
              )
            ],
          ));
      },
    ));
  }
}
