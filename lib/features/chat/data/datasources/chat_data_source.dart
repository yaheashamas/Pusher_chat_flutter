import 'package:chat/core/end_point.dart';
import 'package:chat/core/utils/dio_client/api.dart';
import 'package:chat/features/chat/domain/entities/model/chat_message_model.dart';
import 'package:chat/features/chat/domain/entities/model/chat_model.dart';
import 'package:chat/features/chat/domain/entities/request/chat_message_request.dart';
import 'package:chat/features/chat/domain/entities/request/chat_request.dart';
import 'package:dio/dio.dart';

abstract class ChatDataSource {
  //get chat's messages
  Future<List<ChatMessageModel>> getChatMessages(int chatId, int page);
  Future<ChatMessageModel> createChatMessage(
    ChatMessageRequest request,
    String? socketId,
  );
  //create chat , get single and many chat
  Future<ChatModel?> createChat(ChatRequest request);
  Future<ChatModel?> getSingleChat(int chatId);
  Future<List<ChatModel>> getChats();
}

class ChatDataSourceImpl extends ChatDataSource {
  @override
  Future<ChatMessageModel> createChatMessage(
    ChatMessageRequest request,
    String? socketId,
  ) async {
    var response = await Api.dio.post(
      Endpoints.createChatMessages,
      data: request.toMap(),
      options: Options(headers: {'X-Socket-ID': socketId}),
    );
    return ChatMessageModel.fromMap(response.data['data']);
  }

  @override
  Future<List<ChatMessageModel>> getChatMessages(
    int chatId,
    int page,
  ) async {
    var response = await Api.dio.get(
      Endpoints.getChatMessages,
      queryParameters: {
        'page': page,
        'chat_id': chatId,
      },
    );
    List<ChatMessageModel> chatMessages = [];
    response.data['data'].forEach(
      (chat) => chatMessages.add(
        ChatMessageModel.fromMap(chat),
      ),
    );
    return chatMessages;
  }

  @override
  Future<ChatModel?> createChat(ChatRequest request) async {
    final response = await Api.dio.post(
      Endpoints.createChat,
      data: request.toMap(),
    );
    return ChatModel.fromMap(response.data['data']);
  }

  @override
  Future<List<ChatModel>> getChats() async {
    final response = await Api.dio.get(Endpoints.getChats);
    List<ChatModel> chatList = [];
    response.data['data'].forEach(
      (chat) => chatList.add(ChatModel.fromMap(chat)),
    );
    return chatList;
  }

  @override
  Future<ChatModel?> getSingleChat(int chatId) async {
    final response = await Api.dio.get(
      "${Endpoints.getSingleChat}$chatId",
    );
    return ChatModel.fromMap(response.data['data']);
  }
}