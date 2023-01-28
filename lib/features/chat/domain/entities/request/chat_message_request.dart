import 'package:equatable/equatable.dart';

class ChatMessageRequest extends Equatable {
  final int chat_id;
  final String message;

  const ChatMessageRequest({
    required this.chat_id,
    required this.message,
  });

  @override
  List<Object> get props => [chat_id, message];

  Map<String, dynamic> toMap() {
    return {
      'chat_id': chat_id,
      'message': message,
    };
  }

  factory ChatMessageRequest.fromMap(Map<String, dynamic> map) {
    return ChatMessageRequest(
      chat_id: map['chat_id'],
      message: map['message'],
    );
  }
}
