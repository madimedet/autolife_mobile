import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final String uid;
  final String name;
  final String phoneNumber;

  const UserEntity({
    required this.uid,
    required this.name,
    required this.phoneNumber,
  });

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'name': name,
      'phoneNumber': phoneNumber,
    };
  }

  factory UserEntity.copyWith({
    required UserEntity user,
    String firstName = '',
    String lastName = '',
    String phone = '',
  }) =>
      UserEntity(
        name: firstName == '' ? user.name : firstName,
        phoneNumber: phone == '' ? user.phoneNumber : phone,
        uid: user.uid,
      );

  @override
  List<Object> get props => [uid, name, phoneNumber];
}
