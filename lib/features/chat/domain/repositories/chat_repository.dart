import 'package:chat/core/error/failures.dart';
import 'package:chat/features/chat/domain/entities/model/chat_message_model.dart';
import 'package:chat/features/chat/domain/entities/model/chat_model.dart';
import 'package:chat/features/chat/domain/entities/request/chat_message_request.dart';
import 'package:chat/features/chat/domain/entities/request/chat_request.dart';
import 'package:dartz/dartz.dart';

abstract class ChatRepository {
  //get chat's messages
  Future<Either<Failure, List<ChatMessageModel>>> getChatMessages({
    required int chatId,
    required int page,
  });
  Future<Either<Failure, ChatMessageModel>> createChatMessage(
    ChatMessageRequest request,
    String? socketId,
  );

  //create chat , get single and many chat
  Future<Either<Failure, ChatModel?>> createChat(ChatRequest request);
  Future<Either<Failure, List<ChatModel>>> getChats();
  Future<Either<Failure, ChatModel?>> getSingleChat(int chatId);
}
