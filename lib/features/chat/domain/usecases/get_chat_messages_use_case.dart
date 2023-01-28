import 'package:chat/core/error/failures.dart';
import 'package:chat/features/chat/domain/entities/model/chat_message_model.dart';
import 'package:chat/features/chat/domain/repositories/chat_repository.dart';
import 'package:dartz/dartz.dart';

class GetAllChatMessagesUseCase {
  ChatRepository chatRepository;
  GetAllChatMessagesUseCase(this.chatRepository);

  Future<Either<Failure, List<ChatMessageModel>?>> call({
    required int chatId,
    required int page,
  }) async {
    return await chatRepository.getChatMessages(
      chatId: chatId,
      page: page,
    );
  }
}
