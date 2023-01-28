import 'package:chat/features/chat/domain/entities/model/chat_message_model.dart';
import 'package:chat/features/chat/domain/entities/model/chat_model.dart';
import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:equatable/equatable.dart';

import 'package:chat/features/chat/presentation/bloc/chat/data_status.dart';

class ChatState extends Equatable {
  final List<ChatModel> chats;
  final List<ChatMessageModel> chatMessages;
  final ChatModel? selectedChat;
  final DataStatus status;
  final String message;
  final int? otherUserId;
  final int page;
  final bool isLastPage;

  factory ChatState.initial() {
    return const ChatState(
      page: 1,
      isLastPage: false,
      chats: [],
      chatMessages: [],
      message: "",
      selectedChat: null,
      otherUserId: null,
      status: DataStatus.initial,
    );
  }

  const ChatState({
    required this.chats,
    required this.chatMessages,
    required this.selectedChat,
    required this.status,
    required this.message,
    required this.otherUserId,
    required this.isLastPage,
    required this.page,
  });

  ChatState copyWith({
    List<ChatModel>? chats,
    List<ChatMessageModel>? chatMessages,
    ChatModel? selectedChat,
    DataStatus? status,
    String? message,
    int? otherUserId,
    bool? isLastPage,
    int? page,
  }) {
    return ChatState(
      chats: chats ?? this.chats,
      chatMessages: chatMessages ?? this.chatMessages,
      selectedChat: selectedChat ?? this.selectedChat,
      status: status ?? this.status,
      message: message ?? this.message,
      otherUserId: otherUserId ?? this.otherUserId,
      isLastPage: isLastPage ?? this.isLastPage,
      page: page ?? this.page,
    );
  }

  @override
  List<Object> get props {
    return [
      chats,
      chatMessages,
      status,
      message,
      isLastPage,
      page,
    ];
  }

  bool get isSearchChat => otherUserId != null && selectedChat == null;

  bool get isListChat => otherUserId == null && selectedChat != null;

  bool get isNotificationChat => otherUserId == null && selectedChat == null;

  List<ChatMessage> get uiChatMessages =>
      chatMessages.map((e) => e.toChatMessage).toList();
}
