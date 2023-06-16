
import 'package:autolife_application_3/pages/accommodations_page/screen/view/page/list_accom_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'core/di/injection_container.dart';
import 'pages/accommodations_page/screen/view/bloc/accommodation_bloc.dart';
import 'pages/accommodations_page/screen/view/page/accommodations_page.dart';
import 'pages/auth/screen/view/auth_page.dart';
import 'pages/auth/screen/view/bloc/auth_bloc.dart';
import 'pages/auth/screen/view/login_bloc/bloc/login_bloc.dart';
import 'pages/auth/screen/view/login_page.dart';
import 'pages/card_page/screen/view/card_all_transaction.dart';
import 'pages/card_page/screen/view/card_bloc/card_bloc.dart';
import 'pages/card_page/screen/view/card_page.dart';
import 'pages/card_page/screen/view/card_transaction_page.dart';
import 'pages/card_page/screen/view/transaction_bloc/bloc/transaction_bloc.dart';
import 'pages/main_page/view/home_page.dart';
import 'routes/app_routes.dart';

void main() async {
  setupInjections();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: MainColor.primaryColor,
        accentColor: MainColor.accentColor,
        canvasColor: MainColor.canvasColor,
        fontFamily: 'Ubuntu',
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const MyHomePage(),
        PenaltyScreen.pageRoute: (context) => const PenaltyScreen(),
        CheckPenaltyScreen.pageRoute: (context) => const CheckPenaltyScreen(),
        DataPenaltyScreen.pageRoute: (context) => const DataPenaltyScreen(),
      },

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 960),
      builder: (context, child) => MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => sl<LoginBloc>()),
          BlocProvider(create: (_) => sl<AuthBloc>()),
          BlocProvider(create: (_) => sl<CardCreateBloc>()),
          BlocProvider(create: (_)=> sl<TransactionBloc>()),
          BlocProvider(create: (_)=> sl<AccommodationBloc>())
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: const LoginPage(),
          routes: {
            Routes.LOGIN: (_) => const LoginPage(),
            Routes.AUTH: (_) => const AuthPage(),
            Routes.CARDS: (_) => const CreditCardsPage(),
            Routes.TRANSACTION: (_) => const TransactionDataPage(),
            Routes.ALLTRANSACTION: (_) => const AllTransactionDataPage(),
             Routes.HOME: (_) => const HomePage(),
              Routes.ALLACCOMM: (_) => const CreateAccomPage(),
              Routes.LISTACCOMM: (_) => const ListAccomPage(),
     
          },
          onUnknownRoute: (RouteSettings settings) {
            return MaterialPageRoute(builder: (_) => const LoginPage());
          },
        ),
      ),
    )});}
  
}
