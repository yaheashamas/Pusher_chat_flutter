import 'package:chat/core/router/route_constants.dart';
import 'package:chat/features/auth/presentation/blocs/auth/auth_bloc.dart';
import 'package:chat/features/auth/presentation/blocs/user_cubit/user_cubit.dart';
import 'package:chat/features/auth/presentation/blocs/user_cubit/user_state.dart';
import 'package:chat/features/chat/presentation/widgets/custom_item_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          const SizedBox(height: 30),
          DrawerHeader(
            decoration: const BoxDecoration(color: Colors.transparent),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: 100,
                  width: MediaQuery.of(context).size.width,
                  child: Image.asset("assets/images/icon.png"),
                ),
                Text(AuthCubit().state.user!.email),
              ],
            ),
          ),
          const SizedBox(height: 45),
          const CustomDrawerItem(title: "chat list"),
          const SizedBox(height: 45),
          BlocBuilder<UserCubit, UserState>(
            builder: (context, state) {
              return CustomDrawerItem(
                title: "Logout",
                onTap: () {
                  context.read<UserCubit>().logout();
                  Navigator.of(context).pushReplacementNamed(RouteList.login);
                },
              );
            },
          ),
          const SizedBox(height: 45),
          Expanded(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 40,
                width: MediaQuery.of(context).size.width,
                color: Colors.blue,
                child: const Center(
                  child: Text(
                    'v1.0.1',
                    style: TextStyle(
                      fontFamily: 'Avenir',
                      fontSize: 20,
                      color: Color(0xffffffff),
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
