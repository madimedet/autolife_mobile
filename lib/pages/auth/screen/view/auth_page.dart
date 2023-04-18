import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../constants/colors/colors.dart';
import '../../../../core/database/auth_params.dart';
import '../../../../core/di/injection_container.dart';
import '../../../../routes/app_routes.dart';
import '../../data/model/user_model.dart';
import '../widgets/const_widgets.dart';
import 'bloc/auth_bloc.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});
  @override
  Widget build(BuildContext context) {
    final TextEditingController uinController = TextEditingController();
    final TextEditingController firstName = TextEditingController();
    final TextEditingController midName = TextEditingController();
    final TextEditingController lastName = TextEditingController();
    final TextEditingController pass = TextEditingController();
    final TextEditingController phone = TextEditingController();
    return Scaffold(
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is RegisterErrorState) {
            Navigator.pushNamed(context, Routes.AUTH);
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(
                const SnackBar(
                  behavior: SnackBarBehavior.floating,
                  content: Text(
                      'Пользователь с таким именем уже зарегистрирован!',
                      textScaleFactor: 1.0),
                  duration: Duration(milliseconds: 3000),
                ),
              );
          }
          if (state is RegisterSuccessState) {
            //go to the MainPAge;
            Navigator.pushNamed(context, Routes.LOGIN);
            UserInfo? userInfo = sl<AuthConfig>().userInfo;
            print('sucess');
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(
                const SnackBar(
                  behavior: SnackBarBehavior.floating,
                  content: Text('Success', textScaleFactor: 1.0),
                  duration: Duration(milliseconds: 3000),
                ),
              );
          }
        },
        builder: (context, state) {
          return Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(top: 30),
                child: Column(
                  children: [
                    const Text(
                      "Регистрация",
                      style: style,
                    ),
                    const SizedBox(height: 58),
                    Textfield1(
                      keyboard: TextInputType.number,
                      max: 12,
                      labelText: "ИИН",
                      color: ColorStyles.colors3,
                      controller: uinController,
                    ),
                    Textfield1(
                      keyboard: TextInputType.text,
                      labelText: "пароль",
                      obscureText: true,
                      color: ColorStyles.colors3,
                      controller: pass,
                    ),
                    Textfield1(
                      keyboard: TextInputType.name,
                      labelText: "Имя",
                      color: ColorStyles.colors3,
                      controller: firstName,
                    ),
                    Textfield1(
                      keyboard: TextInputType.name,
                      labelText: "Фамилия",
                      color: ColorStyles.colors3,
                      controller: lastName,
                    ),
                    Textfield1(
                      keyboard: TextInputType.name,
                      labelText: "Отчество",
                      color: ColorStyles.colors3,
                      controller: midName,
                    ),
                    Textfield1(
                      keyboard: TextInputType.phone,
                      max: 11,
                      labelText: "номер телефона",
                      color: Colors.black,
                      controller: phone,
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    SizedBox(
                      height: 60.0,
                      width: 370.0,
                      child: ElevatedButton(
                        onPressed: () {
                          if (uinController.text.isNotEmpty &&
                              phone.text.isNotEmpty &&
                              pass.text.isNotEmpty &&
                              firstName.text.isNotEmpty &&
                              midName.text.isNotEmpty &&
                              lastName.text.isNotEmpty) {
                            context.read<AuthBloc>().add(RegistrEvent(
                                uin: uinController.text,
                                firstName: firstName.text,
                                lastName: lastName.text,
                                midName: midName.text,
                                password: pass.text,
                                phone: phone.text));
                          }else{
                  ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              const SnackBar(
                behavior: SnackBarBehavior.floating,
                content: Text('Поля не могут быть пустыми',
                    textScaleFactor: 1.0),
                duration: Duration(milliseconds: 3000),
                backgroundColor: Colors.red,
              ),
            );
                  }
                        },
                        style: style3,
                        child: const Text(
                          'зарегистрироваться',
                          style: style4,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
