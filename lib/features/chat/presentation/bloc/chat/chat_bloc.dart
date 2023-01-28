import 'package:chat/features/chat/domain/entities/model/chat_message_model.dart';
import 'package:chat/features/chat/domain/entities/model/chat_model.dart';
import 'package:chat/features/chat/domain/entities/request/chat_message_request.dart';
import 'package:chat/features/chat/domain/entities/request/chat_request.dart';
import 'package:chat/features/chat/domain/usecases/create_chat_message_use_case.dart';
import 'package:chat/features/chat/domain/usecases/create_chat_use_case.dart';
import 'package:chat/features/chat/domain/usecases/get_chat_messages_use_case.dart';
import 'package:chat/features/chat/domain/usecases/get_chats_use_case.dart';
import 'package:chat/features/chat/presentation/bloc/chat/chat_event.dart';
import 'package:chat/features/chat/presentation/bloc/chat/chat_state.dart';
import 'package:chat/features/chat/presentation/bloc/chat/data_status.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  GetChatUseCase getChatUseCase;
  CreateChatUseCase createChatUseCase;
  GetAllChatMessagesUseCase getAllChatMessagesUseCase;
  CreateChatMessageUseCase createChatMessageUseCase;

  ChatBloc(
    this.getChatUseCase,
    this.createChatUseCase,
    this.getAllChatMessagesUseCase,
    this.createChatMessageUseCase,
  ) : super(ChatState.initial()) {
    on<StartedEvent>((event, emit) async {
      if (state.status.isLoading) return;

      emit(state.copyWith(status: DataStatus.loading));

      final result = await getChatUseCase();

      result.fold(
        (l) => null,
        (r) => emit(state.copyWith(status: DataStatus.loaded, chats: r)),
      );
    });
    on<UserSelectedEvent>((event, emit) async {
      emit(state.copyWith(otherUserId: event.user.id));
    });
    on<ResetEvent>((event, emit) async {
      emit(state.copyWith(
        chatMessages: [],
        message: '',
        status: DataStatus.initial,
        selectedChat: null,
        otherUserId: null,
        isLastPage: false,
        page: 1,
        chats: (event.shouldResetChat != null && event.shouldResetChat!)
            ? []
            : state.chats,
      ));
    });
    on<GetChatMessageEvent>((event, emit) async {
      if (state.status.isFetching) return;

      emit(state.copyWith(status: DataStatus.fetching));

      ChatModel? chat;

      if (state.isSearchChat) {
        final chatResult = await createChatUseCase(
          ChatRequest(state.otherUserId!),
        );
        chatResult.fold(
          (l) => null,
          (r) => chat = r,
        );
      } else if (state.isListChat) {
        chat = state.selectedChat;
      }
      // else if (state.isNotificationChat) {
      //   final chatResult =
      //       await _chatRepository.getSingleChat(state.notificationChatId!);

      //   if (chatResult.success) {
      //     chat = chatResult.data;
      //   }
      // }

      if (chat == null) {
        emit(state.copyWith(chatMessages: [], status: DataStatus.loaded));
        return;
      }

      final result = await getAllChatMessagesUseCase(chatId: chat!.id, page: 1);

      emit(result.fold(
        (l) => state.copyWith(
          chatMessages: [],
          status: DataStatus.error,
          message: "getAllChatMessagesUseCase error",
        ),
        (r) => state.copyWith(
          chatMessages: r ?? [],
          status: DataStatus.loaded,
          selectedChat: chat,
        ),
      ));
    });
    on<SendMessageEvent>((event, emit) async {
      if (state.status.isSubmitting) return;

      emit(state.copyWith(status: DataStatus.submitting));

      final result = await createChatMessageUseCase(
        request: ChatMessageRequest(
          chat_id: event.chatId,
          message: event.message.text,
        ),
        socketId: event.socketId,
      );

      List<ChatMessageModel> messages = [];
      result.fold(
        (l) => emit(state.copyWith(status: DataStatus.loaded)),
        (r) {
          messages = [r, ...state.chatMessages];
          emit(
            state.copyWith(
              chatMessages: messages,
              status: DataStatus.loaded,
            ),
          );
        },
      );
    });
  }
}
