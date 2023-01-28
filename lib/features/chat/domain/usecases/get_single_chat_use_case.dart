import 'package:chat/core/error/failures.dart';
import 'package:chat/features/chat/domain/entities/model/chat_model.dart';
import 'package:chat/features/chat/domain/repositories/chat_repository.dart';
import 'package:dartz/dartz.dart';

class GetSingleChatUseCase {
  ChatRepository chatRepository;
  GetSingleChatUseCase(this.chatRepository);

  Future<Either<Failure, ChatModel?>> call(int chatId) async {
    return await chatRepository.getSingleChat(chatId);
  }
}
