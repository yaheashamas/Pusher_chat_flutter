import 'package:chat/core/router/route_constants.dart';
import 'package:chat/core/screens/splash_screen.dart';
import 'package:chat/features/auth/presentation/pages/register_screen.dart';
import 'package:chat/features/chat/presentation/pages/chat_list_screen.dart';
import 'package:chat/features/chat/presentation/pages/chat_screen.dart';
import 'package:chat/features/chat/presentation/pages/search_screen.dart';
import 'package:flutter/cupertino.dart';

import '../../features/auth/presentation/pages/login_screen.dart';

class Routes {
  static Map<String, WidgetBuilder> getRoutes(RouteSettings settings) => {
        RouteList.initial: (context) => const SplashScreen(),
        RouteList.login: (context) => const LoginScreen(),
        RouteList.register: (context) => const RegisterScreen(),
        RouteList.chatList: (context) => const ChatListScreen(),
        RouteList.search: (context) => const SearchScreen(),
        RouteList.chat: (context) => const ChatScreen(),
      };
}
