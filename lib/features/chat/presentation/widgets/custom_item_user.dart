import 'package:chat/core/styles/sizes.dart';
import 'package:flutter/material.dart';

class CustomItemUser extends StatelessWidget {
  final String name;
  final String email;
  Function() onTap;

  CustomItemUser({
    super.key,
    required this.name,
    required this.email,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 8,
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(Sizes.dimen_12),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 6),
          child: Row(
            children: [
              SizedBox(
                width: 70.0,
                height: 70.0,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(Sizes.dimen_12),
                  child: const Icon(Icons.person_outline_outlined),
                ),
              ),
              const SizedBox(width: 24),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [Text(name), Text(email)],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
