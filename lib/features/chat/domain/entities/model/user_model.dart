import 'package:equatable/equatable.dart';

class UserModel extends Equatable {
  final int id;
  final String email;
  final String username;

  const UserModel(
    this.id,
    this.email,
    this.username,
  );

  @override
  List<Object> get props => [id, email, username];

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'email': email,
      'username': username,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      map['id'],
      map['email'],
      map['username'],
    );
  }

}
