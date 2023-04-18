part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

class AuthInitial extends AuthState {}

class RegisterSuccessState extends AuthState {
  final UserInfo userInfo;
  const RegisterSuccessState({required this.userInfo});
}

class RegisterErrorState extends AuthState {
  final String message;
  const RegisterErrorState({required this.message});
}
