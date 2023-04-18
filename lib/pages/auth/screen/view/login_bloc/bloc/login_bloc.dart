import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';


import '../../../../../../core/database/auth_params.dart';
import '../../../../../../core/di/injection_container.dart';
import '../../../../domain/usecase/auth_usecase.dart';
import '../../../../domain/usecase/get_token.dart';
import '../../../../domain/usecase/logout.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthSignIn authSignIn;
  final Logout logout;
  final GetToken getToken;
  LoginBloc(this.authSignIn, this.logout, this.getToken)
      : super(LoginInitial()) {
    on<LoginEvent>((event, emit) async {
      if (event is SignInEvent) {
        print('Logged in');

        final response = await authSignIn(
            AuthSignParams(password: event.password, phoneNumber: event.phone));
        response.fold((error) {
            print('errorState $error');
          emit(LoginPhoneErrorState(message: error.toString()));
          return RequiredLoginState(phone: event.phone);
         
        }, (response) {
          print('successState $response');
          sl<AuthConfig>().token = response.token;
          print(sl<AuthConfig>().token);
          emit(LoginWithPhoneSuccessState(token: response.token));
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
    // @override
    // Stream<LoginState> mapEventToState(LoginEvent event) async* {
    //   yield LoginInitial();
    //   if (event is SignInEvent) {
    //     print('SignInEvent in bloc');

    //     var authGetToken = await authSignIn(
    //         AuthSignParams(phoneNumber: event.phone, password: event.password));
    //     yield authGetToken.fold((failure) {
    //       return RequiredRegisterState(phone: event.phone);
    //     }, (TokenEntity tokenEntity) {
    //       sl<AuthConfig>().token = tokenEntity.token;
    //       return LoginWithPhoneSuccessState(token: tokenEntity.token);
    //     });
    //   }
    // }
  }
}
