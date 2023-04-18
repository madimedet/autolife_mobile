import 'package:autolife_application_3/pages/accommodations_page/data/model/accomm_model.dart';
import 'package:autolife_application_3/pages/accommodations_page/screen/view/bloc/accommodation_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../routes/app_routes.dart';
import '../../../../auth/screen/widgets/const_widgets.dart';
import '../../../../card_page/screen/view/card_bloc/card_bloc.dart';

class CreateAccomPage extends StatefulWidget {
  const CreateAccomPage({super.key});

  @override
  State<CreateAccomPage> createState() => _CreateAccomPageState();
}

class _CreateAccomPageState extends State<CreateAccomPage> {
  final TextEditingController name = TextEditingController();
  List<AccommodationsModel> createAccom = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: BlocConsumer<AccommodationBloc, AccommodationState>(
          listener: (context, state) {
            if (state is CreatingAccomErrorState) {
              ScaffoldMessenger.of(context)
                ..hideCurrentSnackBar()
                ..showSnackBar(
                  const SnackBar(
                    behavior: SnackBarBehavior.floating,
                    content:
                        Text('Ошибка при создании услуг', textScaleFactor: 1.0),
                    duration: Duration(milliseconds: 3000),
                  ),
                );
            }
          },
          builder: (context, state) {
            if (state is CreatingAccomState) {
              return const Center(child: CircularProgressIndicator());
            }
            return Center(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 12.0),
                    child: Textfield1(
                        labelText: "напишите услугу",
                        color: Colors.black,
                        controller: name,
                        keyboard: TextInputType.name),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 24.0),
                    alignment: Alignment.center,
                    child: SizedBox(
                      height: 60.0,
                      width: 370.0,
                      child: ElevatedButton(
                        onPressed: () {
                          if (name.text.isNotEmpty) {
                            print("${name.text}}");
                            context
                                .read<AccommodationBloc>()
                                .add(CreateAccommEvent(name: name.text));
                          } else {
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
                        style: style3,
                        child: const Text(
                          'Создать услугу',
                          style: style4,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  SizedBox(
                    height: 60.0,
                    width: 370.0,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, Routes.LISTACCOMM);
                      },
                      style: style3,
                      child: const Text(
                        'Список услуг',
                        style: style4,
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ));
  }
}
