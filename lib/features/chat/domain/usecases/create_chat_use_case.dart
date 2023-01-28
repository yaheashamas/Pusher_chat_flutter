import 'package:chat/core/error/failures.dart';
import 'package:chat/features/chat/domain/entities/model/chat_model.dart';
import 'package:chat/features/chat/domain/entities/request/chat_request.dart';
import 'package:chat/features/chat/domain/repositories/chat_repository.dart';
import 'package:dartz/dartz.dart';

class CreateChatUseCase {
  ChatRepository chatRepository;
  CreateChatUseCase(this.chatRepository);

  Future<Either<Failure, ChatModel?>> call(ChatRequest request) async {
    return await chatRepository.createChat(request);
  }
}
