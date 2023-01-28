import 'package:chat/core/error/failures.dart';
import 'package:chat/features/chat/domain/entities/model/chat_message_model.dart';
import 'package:chat/features/chat/domain/entities/request/chat_message_request.dart';
import 'package:chat/features/chat/domain/repositories/chat_repository.dart';
import 'package:dartz/dartz.dart';

class CreateChatMessageUseCase {
  ChatRepository chatRepository;
  CreateChatMessageUseCase(this.chatRepository);

  Future<Either<Failure, ChatMessageModel>> call({
    required ChatMessageRequest request,
    String? socketId,
  }) async {
    return await chatRepository.createChatMessage(request, socketId);
  }
}
