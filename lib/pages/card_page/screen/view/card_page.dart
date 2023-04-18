import 'package:flutter/material.dart';



import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../constants/colors/colors.dart';
import '../../../../core/database/auth_params.dart';
import '../../../../core/di/injection_container.dart';
import '../../../auth/data/model/auth_model.dart';
import '../../../auth/data/model/user_model.dart';
import '../../data/model/card_model.dart';
import '../widgets/widgets/BuildCard.dart';
import 'card_bloc/card_bloc.dart';

class CreditCardsPage extends StatefulWidget {
  const CreditCardsPage({super.key});

  @override
  State<CreditCardsPage> createState() => _CreditCardsPageState();
}

class _CreditCardsPageState extends State<CreditCardsPage> {
  List<CardModel> cardList = [];
  List<Registration> userList = [];
  @override
  void initState() {
    context.read<CardCreateBloc>().add(GetCardListEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        context.read<CardCreateBloc>().add(GetCardListEvent());
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text(""),
        ),
        body: SingleChildScrollView(
          child: BlocListener<CardCreateBloc, CardState>(
            listener: (context, state) {
              if (state is CardLoadingErrorState) {
                ScaffoldMessenger.of(context)
                  ..hideCurrentSnackBar()
                  ..showSnackBar(
                    const SnackBar(
                      behavior: SnackBarBehavior.floating,
                      content: Text('Ошибка при загрузке карт',
                          textScaleFactor: 1.0),
                      duration: Duration(milliseconds: 3000),
                    ),
                  );
              }
              if (state is CardLoadingSuccessState) {
                setState(() {
                  
                  cardList = state.cardModel;
                });
              }
            },
            child: BlocBuilder<CardCreateBloc, CardState>(
                builder: (context, state) {
              return Container(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    ListView.builder(
                        shrinkWrap: true,
                        primary: false,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: cardList.length,
                        itemBuilder: (context, index) {
                          return CreditCardFunction(
                            amount: cardList[index].amount,
                            cardId: cardList[index].cardId.toString(),
                            color: CardColorStyles.cardGradient1,
                            lastNumbersOfCard:
                            cardList[index].lastNumbersOfCard.toString(),
                            month: cardList[index].month,
                            name: cardList[index].name.toString(),
                            year: cardList[index].year,
                          );
                        }),
                    Container(
                      margin: const EdgeInsets.only(top: 24.0),
                      alignment: Alignment.center,
                      child: FloatingActionButton(
                        elevation: 2.0,
                        onPressed: () {
                          context
                              .read<CardCreateBloc>()
                              .add(PostCreateCardEvent());
                          context
                              .read<CardCreateBloc>()
                              .add(GetCardListEvent());
                        },
                        backgroundColor: Colors.blue,
                        mini: false,
                        child: const Icon(Icons.add),
                      ),
                    )
                  ],
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}
