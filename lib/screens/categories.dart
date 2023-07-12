import 'package:flutter/material.dart';
import 'package:meals_app/data/dummy_data.dart';
import 'package:meals_app/screens/meals.dart';
import 'package:meals_app/widgets/grid_widget_items.dart';

import '../model/category.dart';
import '../model/meal.dart';

class CategoriesScreen extends StatelessWidget {
  CategoriesScreen({super.key,required this.onFavoriteListEdit, required this.filteredMeals});
  final void Function(Meal meal) onFavoriteListEdit;
  List<Meal> filteredMeals;


  void _selectedCategory(BuildContext context, Category category) {
    List<Meal> selectedMeals = filteredMeals.where((meal) => meal.categories.contains(category.id)).toList();

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (ctx) => MealsScreen(meals: selectedMeals, title: category.title, onFavoriteListEdit: onFavoriteListEdit,
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
                category: category, onSelectedCategory:() { _selectedCategory(context,category);},
              )
          ],
        ),

    );
  }
}
