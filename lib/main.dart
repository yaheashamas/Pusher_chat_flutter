import 'package:chat/core/router/fade_page_route_builder.dart';
import 'package:chat/core/router/route.dart';
import 'package:chat/core/router/route_constants.dart';
import 'package:chat/core/utils/dio_client/api.dart';
import 'package:chat/di.dart';
import 'package:chat/features/auth/presentation/blocs/auth/auth_bloc.dart';
import 'package:chat/features/auth/presentation/blocs/loading_cubit/loading_cubit.dart';
import 'package:chat/features/chat/presentation/bloc/chat/chat_bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';

import 'core/screens/loading_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //getit
  await configureInjection();
  //api
  await Api.initializeInterceptors();
  //get path
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: kIsWeb
        ? HydratedStorage.webStorageDirectory
        : await getTemporaryDirectory(),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => getIt.get<AuthCubit>()),
        BlocProvider(create: (context) => getIt.get<LoadingCubit>()),
        BlocProvider(create: (context) => getIt.get<ChatBloc>()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        builder: (context, child) => LoadingScreen(widget: child!),
        initialRoute: RouteList.initial,
        onGenerateRoute: (settings) {
          final routes = Routes.getRoutes(settings);
          final WidgetBuilder? builder = routes[settings.name];
          return FadePageRouteBuilder(
            builder: builder!,
            settings: settings,
          );
        },
      ),
    );
  }
}
