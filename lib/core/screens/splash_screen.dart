import 'package:chat/core/router/route_constants.dart';
import 'package:chat/features/auth/presentation/blocs/auth/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool _isInit = false;

  @override
  void didChangeDependencies() {
    _initialed();
    super.didChangeDependencies();
  }

  void _initialed() async {
    if (!_isInit) {
      await Future.delayed(const Duration(milliseconds: 500));
      if (!mounted) return;
      // final authState = context.read<AuthBloc>().state;
      final redirectScreen = RouteList.login;
      // authState.isAuthinticated ? RouteList.chatList : RouteList.login;
      Navigator.of(context).pushNamed(redirectScreen);
      _isInit = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
