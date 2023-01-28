import 'package:chat/core/error/failures.dart';
import 'package:chat/features/chat/domain/entities/model/chat_model.dart';
import 'package:chat/features/chat/domain/repositories/chat_repository.dart';
import 'package:dartz/dartz.dart';

class GetChatUseCase {
  ChatRepository chatRepository;
  GetChatUseCase(this.chatRepository);

  Future<Either<Failure, List<ChatModel>>> call() async {
    return await chatRepository.getChats();
  }
}
