import 'package:chat/core/router/route_constants.dart';
import 'package:chat/core/screens/main_layer_screen.dart';
import 'package:chat/di.dart';
import 'package:chat/features/auth/presentation/blocs/user_cubit/user_cubit.dart';
import 'package:chat/features/chat/presentation/widgets/custom_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatListScreen extends StatelessWidget {
  const ChatListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => getIt.get<UserCubit>()),
      ],
      child: Scaffold(
        drawer: const CustomDrawer(),
        floatingActionButton: FloatingActionButton(
          onPressed: () => Navigator.of(context).pushNamed(RouteList.search),
          child: const Icon(Icons.search),
        ),
        body: const MainLayerScreen(
          title: "Chat",
          child: Center(
            child: Text("Chat Screen"),
          ),
        ),
      ),
    );
  }
}
