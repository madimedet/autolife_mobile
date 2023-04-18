import 'package:dio/dio.dart';

import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

import '../../network_info/api_url.dart';
import '../../pages/accommodations_page/data/datasource/accom_api.dart';
import '../../pages/accommodations_page/data/repositories/accom_repository_impl.dart';
import '../../pages/accommodations_page/domain/repositories/accom_repo.dart';
import '../../pages/accommodations_page/domain/usecase/create_accom.dart';
import '../../pages/accommodations_page/domain/usecase/get_accom_info.dart';
import '../../pages/accommodations_page/screen/view/bloc/accommodation_bloc.dart';
import '../../pages/auth/data/datasource/local_datasource.dart';
import '../../pages/auth/data/datasource/registration_api.dart';
import '../../pages/auth/data/repositories/auth_repository_impl.dart';
import '../../pages/auth/domain/repositories/auth_repo.dart';
import '../../pages/auth/domain/usecase/auth_usecase.dart';
import '../../pages/auth/domain/usecase/get_token.dart';
import '../../pages/auth/domain/usecase/logout.dart';
import '../../pages/auth/domain/usecase/use_case.dart';
import '../../pages/auth/screen/view/bloc/auth_bloc.dart';
import '../../pages/auth/screen/view/login_bloc/bloc/login_bloc.dart';
import '../../pages/card_page/data/datasource/credit_card_api.dart';
import '../../pages/card_page/data/repositories/card_repository_impl.dart';
import '../../pages/card_page/domain/repositories/card_repo.dart';
import '../../pages/card_page/domain/usecase/allTransaction.dart';
import '../../pages/card_page/domain/usecase/create_card.dart';
import '../../pages/card_page/domain/usecase/get_card_info.dart';
import '../../pages/card_page/domain/usecase/transactions.dart';
import '../../pages/card_page/screen/view/card_bloc/card_bloc.dart';
import '../../pages/card_page/screen/view/transaction_bloc/bloc/transaction_bloc.dart';
import '../database/auth_params.dart';

final sl = GetIt.instance;

void setupInjections() {
  sl.registerFactory<Dio>(
    () => Dio(BaseOptions(
      baseUrl: Api.url,
    )),
  );

  sl.registerLazySingleton(() => http.Client());

  //Auth
  //Config
  sl.registerLazySingleton<AuthConfig>(() => AuthConfig());

  //Datasources

  sl.registerLazySingleton<RegistrationDataSource>(
    () => RegistrationDataSourceImpl(dio: sl()),
  );
  sl.registerLazySingleton<CreditCardDataSource>(
    () => CreditCardDataSourceImpl(dio: sl()),
  );
  sl.registerLazySingleton<AccommDataSource>(
    () => AccommDataSourceImpl(dio: sl()),
  );

  //Repositories
  sl.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(sl(), sl()),
  );
  sl.registerLazySingleton<AuthenticationLocalDataSource>(
    () => AuthenticationLocalDataSourceImpl(),
  );
  sl.registerLazySingleton<CardRepository>(
    () => CaardRepositoryImpl(sl()),
  );

  sl.registerLazySingleton<AccommRepository>(
    () => AccomRepositoryImpl(sl()),
  );
  //UseCases
  sl.registerLazySingleton<RegistarationUseCase>(
      () => RegistarationUseCase(sl()));
  sl.registerLazySingleton(() => Logout(sl()));
  sl.registerLazySingleton(() => AuthSignIn(sl()));
  sl.registerLazySingleton(() => GetToken(sl()));
  sl.registerLazySingleton(() => CreateCard(sl()));
  sl.registerLazySingleton(() => GetCardInfo(sl()));
  sl.registerLazySingleton(() => TransactionCard(sl()));
  sl.registerLazySingleton(() => TransactionAll(sl()));
  sl.registerLazySingleton(() => GetAccomInfo(sl()));
   sl.registerLazySingleton(() => CreateAccom(sl()));


  //Blocs
  sl.registerFactory<AuthBloc>(
    () => AuthBloc(sl()),
  );
  sl.registerFactory<LoginBloc>(
    () => LoginBloc(sl(), sl(), sl()),
  );

  sl.registerFactory<CardCreateBloc>(
    () => CardCreateBloc(sl(), sl()),
  );
  sl.registerFactory<TransactionBloc>(
    () => TransactionBloc(sl(),sl()),
  );
  sl.registerFactory<AccommodationBloc>(
    () => AccommodationBloc(sl(),sl()),
  );
}
