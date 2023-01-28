import 'package:flutter/material.dart';
import 'package:chat/core/styles/app_colors.dart';

class MainLayerScreen extends StatelessWidget {
  final String title;
  final Widget child;

  const MainLayerScreen({
    Key? key,
    required this.title,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          alignment: Alignment.topCenter,
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: AppColors.blue,
          child: AppBar(centerTitle: true, title: Text(title)),
        ),
        Positioned(
          top: MediaQuery.of(context).size.height * 0.11,
          bottom: 0,
          right: 0,
          left: 0,
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
              color: AppColors.whiteshade,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40),
                topRight: Radius.circular(40),
              ),
            ),
            child: child,
          ),
        ),
      ],
    );
  }
}
