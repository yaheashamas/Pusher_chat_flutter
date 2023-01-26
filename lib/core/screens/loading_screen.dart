import 'dart:ui';

import 'package:chat/features/auth/presentation/blocs/loading_cubit/loading_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoadingScreen extends StatelessWidget {
  final Widget widget;

  const LoadingScreen({super.key, required this.widget});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoadingCubit, bool>(
      builder: (context, isShow) {
        return AbsorbPointer(
          absorbing: isShow,
          child: Stack(
            fit: StackFit.expand,
            children: [
              widget,
              if (isShow)
                BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 2.0, sigmaY: 2.0),
                  child: Container(
                    alignment: Alignment.center,
                    child: const Center(
                      child: CircularProgressIndicator(),
                    ),
                  ),
                ),
            ],
          ),
        );
      },
    );
  }
}
