import 'package:flutter/material.dart';

class MenuChoice extends StatelessWidget {
  final String img;
  final String title;
  const MenuChoice({super.key, required this.img, required this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Image.asset(
          img,
          width: 30,
          height: 30,
        ),
        const SizedBox(
          width: 5,
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
