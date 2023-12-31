import 'package:flutter/material.dart';

import '../model/category.dart';

class CategoryGridItem extends StatelessWidget {
  CategoryGridItem(
      {super.key, required this.category, required this.onSelectedCategory});

  final Category category;

  void Function() onSelectedCategory;

  @override
  Widget build(context) {
    return InkWell(
      splashColor: Colors.red,
      onTap: onSelectedCategory,
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(15)),
          gradient: LinearGradient(
            colors: [
              category.color.withOpacity(.8),
              category.color.withOpacity(.1)
            ],
          ),
        ),
        child: Text(
          category.title,
          style: const TextStyle(fontSize: 20, color: Colors.white),
        ),
      ),
    );
  }
}
