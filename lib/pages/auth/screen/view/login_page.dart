import 'package:flutter/material.dart';


import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: unused_import
import '../../../../constants/colors/colors.dart';
import '../../../../core/database/auth_params.dart';
import '../../../../routes/app_routes.dart';
import '../widgets/const_widgets.dart';
import 'login_bloc/bloc/login_bloc.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
 
    final TextEditingController phoneNumber = TextEditingController();
    final TextEditingController password = TextEditingController();

    return Scaffold(
        body: BlocConsumer<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state is RequiredLoginState) {
           Navigator.pushNamed(context, Routes.LOGIN);
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              const SnackBar(
                behavior: SnackBarBehavior.floating,
                content: Text('Не правильный пароль или логин',
                    textScaleFactor: 1.0),
                duration: Duration(milliseconds: 3000),
                backgroundColor: Colors.red,
              ),
            );
        }
        if (state is LoginWithPhoneSuccessState) {
          Navigator.pushNamed(context, Routes.HOME);
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              const SnackBar(
                behavior: SnackBarBehavior.floating,
                content: Text('Вы вошли', textScaleFactor: 1.0),
                duration: Duration(milliseconds: 3000),
              ),
            );
        }
      },
      builder: ((context, state) {
        return Padding(
          padding: const EdgeInsets.only(top: 30),
          child: Center(
            child: SingleChildScrollView(
              child: Form(

                child: Column(
                  children: [
                    const Text(
                      "Вход",
                      style: style,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Textfield1(
                      max: 11,
                      keyboard: TextInputType.phone,
                      labelText: 'номер телефона',
                      color: ColorStyles.colors3,
                      controller: phoneNumber,
                    ),
                    Textfield1( 
                      keyboard: TextInputType.text,
                      labelText: 'пароль',
                      color: ColorStyles.colors3,
                      controller: password,
                      obscureText: true,
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    SizedBox(
                      height: 60.0,
                      width: 370.0,
                      child: ElevatedButton(
                        onPressed: () {
                           if (phoneNumber.text.isNotEmpty && password.text.isNotEmpty) {
                    context.read<LoginBloc>().add(SignInEvent(
                              password: password.text, phone: phoneNumber.text));
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Processing Data')),
                    );
                  }else{
                  ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              const SnackBar(
                behavior: SnackBarBehavior.floating,
                content: Text('Не правильный пароль или логин',
                    textScaleFactor: 1.0),
                duration: Duration(milliseconds: 3000),
                backgroundColor: Colors.red,
              ),
            );}},     style: style3,
                        child: const Text(
                          'Войти',
                          style: style4,
                        ),
                      ),
                    ),
                    TextButton(
                      style: TextButton.styleFrom(
                        textStyle: const TextStyle(fontSize: 20),
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, Routes.AUTH);
                      },
                      child: const Text('Регистрация'),
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      }),
    ));
  }
}
