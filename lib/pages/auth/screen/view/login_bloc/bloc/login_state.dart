part of 'login_bloc.dart';

abstract class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
}

class LoginInitial extends LoginState {}

class LoginWithPhoneSuccessState extends LoginState {
  final String token;
  const LoginWithPhoneSuccessState({required this.token});
}

class LoginPhoneErrorState extends LoginState {
  final String message;
  const LoginPhoneErrorState({required this.message});
}
class RequiredLoginState extends LoginState{
  final String phone;

  const RequiredLoginState({required this.phone});
}
