import 'package:equatable/equatable.dart';
import 'package:chat/features/auth/domain/entities/user/user_model.dart';

class ChatParticipantModel extends Equatable {
  final int id;
  final int chat_id;
  final int user_id;
  final UserModel user;

  const ChatParticipantModel(
    this.id,
    this.chat_id,
    this.user_id,
    this.user,
  );
  @override
  List<Object?> get props => [];

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'chat_id': chat_id,
      'user_id': user_id,
      'user': user.toMap(),
    };
  }

  factory ChatParticipantModel.fromMap(Map<String, dynamic> map) {
    return ChatParticipantModel(
      map['id'],
      map['chat_id'],
      map['user_id'],
      UserModel.fromMap(map['user']),
    );
  }
}
