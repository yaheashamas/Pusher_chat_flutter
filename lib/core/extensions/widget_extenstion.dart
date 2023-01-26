import 'package:chat/core/styles/app_colors.dart';
import 'package:chat/features/auth/presentation/widgets/app_bar/custom_header.dart';
import 'package:flutter/material.dart';

extension WidgetExtenstion on Widget {
  Widget mainLayer(BuildContext context, String titlePage, bool isback) {
    return SafeArea(
      child: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            color: AppColors.blue,
          ),
          CustomHeader(text: titlePage, isBack: isback),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.08,
            bottom: 0,
            right: 0,
            left: 0,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.9,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                color: AppColors.whiteshade,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
              ),
              child: SingleChildScrollView(child: this),
            ),
          ),
        ],
      ),
    );
  }
}
