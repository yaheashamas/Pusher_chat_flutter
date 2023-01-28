import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:equatable/equatable.dart';

class UserModel extends Equatable {
  final int id;
  final String email;
  final String username;
  const UserModel({
    required this.id,
    required this.email,
    required this.username,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'email': email,
      'username': username,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'],
      email: map['email'],
      username: map['username'],
    );
  }

  @override
  List<Object> get props => [id, email, username];

  ChatUser get toChatUser {
    return ChatUser(
      id: id.toString(),
      firstName: username,
    );
  }
}

class AuthModel extends Equatable {
  final UserModel user;
  final String token;

  const AuthModel({
    required this.user,
    required this.token,
  });

  @override
  List<Object> get props => [user, token];

  Map<String, dynamic> toMap() {
    return {
      'user': user.toMap(),
      'token': token,
    };
  }

  factory AuthModel.fromMap(Map<String, dynamic> map) {
    return AuthModel(
      user: UserModel.fromMap(map['user']),
      token: map['token'],
    );
  }
}
