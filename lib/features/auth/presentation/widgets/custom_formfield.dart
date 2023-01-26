import 'package:chat/core/styles/app_colors.dart';
import 'package:chat/core/styles/text_styles.dart';
import 'package:flutter/material.dart';

class CustomFormField extends StatelessWidget {
  final int maxLines;
  final String headingText;
  final String hintText;
  final bool obsecureText;
  final Widget suffixIcon;
  final TextInputType textInputType;
  final TextInputAction textInputAction;
  final TextEditingController controller;
  Function(String)? onChanged;
  String? errorText;

  CustomFormField(
      {Key? key,
      required this.headingText,
      required this.hintText,
      required this.obsecureText,
      required this.suffixIcon,
      required this.textInputType,
      required this.textInputAction,
      required this.controller,
      required this.maxLines,
      this.onChanged,
      this.errorText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(left: 30, right: 20, bottom: 10),
          child: Text(headingText, style: KTextStyle.textFieldHeading),
        ),
        Stack(
          children: [
            Container(
              margin: const EdgeInsets.only(left: 20, right: 20),
              decoration: BoxDecoration(
                color: AppColors.grayshade,
                borderRadius: BorderRadius.circular(15),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: TextField(
                maxLines: maxLines,
                controller: controller,
                textInputAction: textInputAction,
                keyboardType: textInputType,
                obscureText: obsecureText,
                onChanged: onChanged,
                decoration: InputDecoration(
                  hintText: hintText,
                  errorText: errorText,
                  hintStyle: KTextStyle.textFieldHintStyle,
                  border: InputBorder.none,
                  suffixIcon: suffixIcon,
                  filled: true,
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}
