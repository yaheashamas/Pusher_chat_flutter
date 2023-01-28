import 'package:chat/core/screens/main_layer_screen.dart';
import 'package:chat/core/utils/pusher_client/pusher_client.dart';
import 'package:chat/di.dart';
import 'package:chat/features/auth/presentation/blocs/auth/auth_bloc.dart';
import 'package:chat/features/chat/presentation/bloc/chat/chat_bloc.dart';
import 'package:chat/features/chat/presentation/bloc/chat/chat_event.dart';
import 'package:chat/features/chat/presentation/bloc/chat/chat_state.dart';
import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  late ChatBloc chatBloc;

  @override
  void initState() {
    chatBloc = context.read<ChatBloc>();
    chatBloc.add(GetChatMessageEvent());
    super.initState();
  }

  @override
  void dispose() {
    chatBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MainLayerScreen(
        title: "name chat",
        child: BlocBuilder<ChatBloc, ChatState>(
          builder: (context, state) {
            return DashChat(
              currentUser: AuthCubit().state.user!.toChatUser,
              onSend: (ChatMessage chatMessage) {
                chatBloc.add(SendMessageEvent(
                  state.selectedChat!.id,
                  chatMessage,
                  // socketId: LaravelEcho.socketId,
                ));
              },
              messages: state.uiChatMessages,
              messageListOptions: MessageListOptions(
                onLoadEarlier: () async {},
              ),
            );
          },
        ),
      ),
    );
  }
}
