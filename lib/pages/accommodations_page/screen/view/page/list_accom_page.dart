import 'package:autolife_application_3/pages/accommodations_page/data/model/accomm_model.dart';
import 'package:autolife_application_3/pages/accommodations_page/screen/view/bloc/accommodation_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../card_page/screen/widgets/widgets/transaction_container.dart';
import '../../widget/accomList.dart';

class ListAccomPage extends StatefulWidget {
  const ListAccomPage({super.key});

  @override
  State<ListAccomPage> createState() => _ListAccomPage();
}

class _ListAccomPage extends State<ListAccomPage> {
  List<AccommodationsModel> cardAccomData = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Список услуг"),
        ),
        body: SingleChildScrollView(
          child: BlocConsumer<AccommodationBloc, AccommodationState>(
            listener: (context, state) {
              if (state is AccommodationLoadingErrorState) {
                ScaffoldMessenger.of(context)
                  ..hideCurrentSnackBar()
                  ..showSnackBar(
                    const SnackBar(
                      behavior: SnackBarBehavior.floating,
                      content: Text('Ошибка при загрузке услуг',
                          textScaleFactor: 1.0),
                      duration: Duration(milliseconds: 3000),
                    ),
                  );
              }
            },
            builder: (context, state) {
              if (state is AccommodationLoadingState) {
                return const Center(child: CircularProgressIndicator());
              }
              if (state is AccommodationLoadingSuccessState) {
                cardAccomData = state.accommodation;
              }
              return Column(
                children: [
                  ListView.builder(
                      shrinkWrap: true,
                        primary: false,
                        physics: const NeverScrollableScrollPhysics(),
                      itemCount: 4,
                      itemBuilder: (context, index) {
                        return AccomListWidget(
                          id: cardAccomData[index].id,
                          name: cardAccomData[index].name,
                        );
                      }),
                  Container(
                    margin: const EdgeInsets.only(top: 24.0),
                    alignment: Alignment.center,
                    child: FloatingActionButton(
                      elevation: 2.0,
                      onPressed: () {
                        context
                            .read<AccommodationBloc>()
                            .add(GetInfoAccommEvent());
                      },
                      backgroundColor: Colors.blue,
                      mini: false,
                      child: const Icon(Icons.refresh_sharp),
                    ),
                  )
                ],
              );
            },
          ),
        ));
  }
}
