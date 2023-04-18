part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  
  @override
  List<Object> get props => [];
}
class RegistrEvent extends AuthEvent{
 final String uin;
 final String password;
 final String firstName;
 final String midName;
 final String lastName;
 final String phone;

const RegistrEvent({required this.uin,required this.password, required this.firstName,required this.midName,required this.lastName,required this.phone});
}