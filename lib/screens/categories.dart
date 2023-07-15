import 'package:flutter/material.dart';
import 'package:provider/screens/meals.dart';

import '../data/dummy_data.dart';
import '../model/category.dart';
import '../model/meal.dart';
import '../widgets/grid_widget_items.dart';

class CategoriesScreen extends StatelessWidget {
  CategoriesScreen(
      {super.key,
      required this.filteredMeals});

  List<Meal> filteredMeals;

  void _selectedCategory(BuildContext context, Category category) {
    List<Meal> selectedMeals = filteredMeals
        .where((meal) => meal.categories.contains(category.id))
        .toList();

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (ctx) => MealsScreen(
          meals: selectedMeals,
          title: category.title,
        ),
      ),
    );
  }

  @override
  Widget build(context) {
    return Container(
      color: Colors.black87,
      child: GridView(
        padding: const EdgeInsets.all(10),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20),
        children: [
          for (var category in availableCategories)
            CategoryGridItem(
              category: category,
              onSelectedCategory: () {
                _selectedCategory(context, category);
              },
            )
        ],
      ),
    );
  }
}
