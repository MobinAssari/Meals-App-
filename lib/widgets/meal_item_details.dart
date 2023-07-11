import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MealDetails extends StatelessWidget {
  const MealDetails({super.key, required this.text, required this.icon});

  final IconData icon;
  final String text;

  @override
  Widget build(context) {
    return Row(
      children: [
        Icon(icon, color: Colors.white),
        const SizedBox(
          width: 5,
        ),
        Text(
          text,
          style: const TextStyle(color: Colors.white, fontSize: 13),
        ),
      ],
    );
  }
}
