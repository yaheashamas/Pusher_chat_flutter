import 'package:flutter/material.dart';

class CustomDrawerItem extends StatelessWidget {
  final String title;
  final Function()? onTap;

  const CustomDrawerItem({
    super.key,
    this.onTap,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Text(
        title,
        style: const TextStyle(
          fontFamily: 'Avenir',
          fontSize: 24,
          fontWeight: FontWeight.w700,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
