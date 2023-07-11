import 'package:flutter/material.dart';

class Category {
  const Category(
      {required this.title, required this.id, this.color = Colors.orange});

  final String id;
  final String title;
  final Color color;
}
