import 'package:flutter/material.dart';

class Shortcut extends StatelessWidget {
  final String img;
  final String title;
  const Shortcut({super.key, required this.img, required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(
          img,
          width: (title != 'Avatar' && title != 'Reels') ? 30 : 24,
          height: (title != 'Avatar' && title != 'Reels') ? 30 : 24,
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 16,
          ),
        )
      ],
    );
  }
}
