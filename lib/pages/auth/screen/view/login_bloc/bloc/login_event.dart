part of 'login_bloc.dart';

abstract class LoginEvent {}

class LogoutEvent extends LoginEvent {}

class SignInEvent extends LoginEvent {
  final String phone;
  final String password;

  SignInEvent({required this.phone, required this.password});
}
