import 'package:chat/core/styles/app_colors.dart';
import 'package:chat/core/styles/text_styles.dart';
import 'package:flutter/material.dart';

class CustomHeader extends StatelessWidget {
  final String text;
  final bool isBack;

  const CustomHeader({
    Key? key,
    required this.text,
    required this.isBack,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 16, left: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: isBack
            ? [
                InkWell(
                  onTap: () => Navigator.of(context).pop(),
                  child: const Icon(
                    Icons.arrow_back_ios_new_rounded,
                    color: AppColors.whiteshade,
                    size: 24,
                  ),
                ),
                const SizedBox(width: 16),
                Text(text, style: KTextStyle.headerTextStyle)
              ]
            : [Text(text, style: KTextStyle.headerTextStyle)],
      ),
    );
  }
}