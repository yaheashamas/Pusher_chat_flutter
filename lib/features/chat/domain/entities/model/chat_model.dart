import 'package:chat/features/chat/domain/entities/model/chat_message_model.dart';
import 'package:chat/features/chat/domain/entities/model/chat_participant_model.dart';
import 'package:equatable/equatable.dart';

class ChatModel extends Equatable {
  final int id;
  final String? name;
  final int is_private;
  final String created_at;
  final String updated_at;
  final ChatMessageModel? last_message;
  final List<ChatParticipantModel> participants;

  const ChatModel(
    this.id,
    this.name,
    this.is_private,
    this.created_at,
    this.updated_at,
    this.participants, {
    this.last_message,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'is_private': is_private,
      'created_at': created_at,
      'updated_at': updated_at,
      'last_message': last_message?.toMap(),
      'participants': participants.map((x) => x.toMap()).toList(),
    };
  }

  factory ChatModel.fromMap(Map<String, dynamic> map) {
    return ChatModel(
      map['id'],
      map['name'],
      map['is_private'],
      map['created_at'],
      map['updated_at'],
      List<ChatParticipantModel>.from(map['participants']?.map(
        (x) => ChatParticipantModel.fromMap(x),
      )),
      last_message: map['last_message'] != null
          ? ChatMessageModel?.fromMap(map['last_message'])
          : null,
    );
  }

  @override
  List<Object> get props => [id, participants];
}
