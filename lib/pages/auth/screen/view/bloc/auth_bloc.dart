import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../data/model/auth_model.dart';
import '../../../data/model/user_model.dart';
import '../../../domain/usecase/use_case.dart';


part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final RegistarationUseCase registarationUseCase;
  //AuthBloc(this.registarationUseCase) : super(AuthInitial());
  AuthBloc(this.registarationUseCase) : super(AuthInitial()) {
    on<AuthEvent>((event, emit) async {
      if (event is RegistrEvent) {
        print('RegistrEvent in bloc');
        Registration register = Registration(
            uin: event.uin,
            password: event.password,
            firstName: event.firstName,
            midName: event.midName,
            lastName: event.lastName,
            phone: event.phone);
        final response = await registarationUseCase(
            RegistarationParams(registration: register));
        response.fold((error) {
          print('errorState $error');
          emit(RegisterErrorState(message: error.toString()));
        }, (response) {
          print('successState $response');
          emit(RegisterSuccessState(userInfo: response));
        });
      }

      //   yield userInfo.fold((failure) {
      //     return RegisterErrorState(message: failure.props.toString());
      //   }, (UserInfo userInfo) {
      //     sl<AuthConfig>().userInfo = userInfo;
      //     return RegisterSuccessState(userInfo: userInfo);
      //   });
      // }
      // });
    });
  }
}
