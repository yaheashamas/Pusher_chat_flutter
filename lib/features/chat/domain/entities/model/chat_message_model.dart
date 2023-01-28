import 'package:chat/core/extensions/string_extenstion.dart';
import 'package:chat/features/auth/domain/entities/user/user_model.dart';
import 'package:dash_chat_2/dash_chat_2.dart';

class ChatMessageModel {
  final int id;
  final int chat_id;
  final int user_id;
  final String message;
  final String created_at;
  final String updated_at;
  final UserModel user;

  ChatMessageModel({
    required this.id,
    required this.chat_id,
    required this.user_id,
    required this.message,
    required this.created_at,
    required this.updated_at,
    required this.user,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'chat_id': chat_id,
      'user_id': user_id,
      'message': message,
      'created_at': created_at,
      'updated_at': updated_at,
      'user': user.toMap(),
    };
  }

  factory ChatMessageModel.fromMap(Map<String, dynamic> map) {
    return ChatMessageModel(
      id: map['id'],
      chat_id: map['chat_id'],
      user_id: map['user_id'],
      message: map['message'],
      created_at: map['created_at'],
      updated_at: map['updated_at'],
      user: UserModel.fromMap(map['user']),
    );
  }

  ChatMessage get toChatMessage {
    return ChatMessage(
      user: user.toChatUser,
      text: message,
      createdAt: created_at.parseDateTime,
    );
  }
}
