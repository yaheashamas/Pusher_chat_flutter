import 'package:chat/features/chat/domain/entities/model/chat_message_model.dart';
import 'package:chat/features/chat/domain/entities/request/chat_request.dart';
import 'package:chat/features/chat/domain/entities/model/chat_model.dart';
import 'package:dartz/dartz.dart';

import 'package:chat/core/error/error_handler_repository_impl.dart';
import 'package:chat/core/error/failures.dart';
import 'package:chat/features/chat/data/datasources/chat_data_source.dart';
import 'package:chat/features/chat/domain/entities/request/chat_message_request.dart';
import 'package:chat/features/chat/domain/repositories/chat_repository.dart';

class ChatRepositoryImpl extends BaseRepository implements ChatRepository {
  ChatDataSource chatDataSource;

  ChatRepositoryImpl(this.chatDataSource);

  //get chat's messages
  @override
  Future<Either<Failure, ChatMessageModel>> createChatMessage(
    ChatMessageRequest request,
    String? socketId,
  ) async {
    return body(() async {
      var result = await chatDataSource.createChatMessage(request, socketId);
      return right(result);
    });
  }

  @override
  Future<Either<Failure, List<ChatMessageModel>>> getChatMessages({
    required int chatId,
    required int page,
  }) async {
    return body(() async {
      var result = await chatDataSource.getChatMessages(chatId, page);
      return right(result);
    });
  }

  //create chat , get single and many chat
  @override
  Future<Either<Failure, ChatModel?>> createChat(ChatRequest request) async {
    return body(() async {
      var result = await chatDataSource.createChat(request);
      return right(result);
    });
  }

  @override
  Future<Either<Failure, List<ChatModel>>> getChats() async {
    return body(() async {
      var result = await chatDataSource.getChats();
      return right(result);
    });
  }

  @override
  Future<Either<Failure, ChatModel?>> getSingleChat(int chatId) async {
    return body(() async {
      var result = await chatDataSource.getSingleChat(chatId);
      return right(result);
    });
  }
}
