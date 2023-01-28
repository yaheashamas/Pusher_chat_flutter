import 'package:chat/features/chat/domain/entities/model/chat_message_model.dart';
import 'package:chat/features/chat/domain/entities/model/chat_model.dart';
import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:equatable/equatable.dart';
import 'package:chat/features/auth/domain/entities/user/user_model.dart';

class ChatEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class StartedEvent extends ChatEvent {}

//get messages
class GetChatMessageEvent extends ChatEvent {}

//refresh after send message
class LoadMoreChatMessageEvent extends ChatEvent {}

//selected chat
class ChatSelectedEvent extends ChatEvent {
  final ChatModel chat;
  ChatSelectedEvent(this.chat);
}

//select user
class UserSelectedEvent extends ChatEvent {
  final UserModel user;
  UserSelectedEvent(this.user);
}

class ResetEvent extends ChatEvent {
  final bool? shouldResetChat;
  ResetEvent(this.shouldResetChat);
}

//send new message
class SendMessageEvent extends ChatEvent {
  final int chatId;
  final ChatMessage message;
  final String? socketId;
  SendMessageEvent(
    this.chatId,
    this.message, {
    this.socketId,
  });
}

//add new message from listion
class AddNewMessage extends ChatEvent {
  final ChatMessageModel message;
  AddNewMessage(this.message);
}