import 'package:flutter/material.dart';
import '../screens/meal_details.dart';
import '../widgets/meal_item.dart';

import '../model/meal.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen({super.key, required this.meals, this.title,});


  final List<Meal> meals;
  final String? title;
  void _selectedMeal(BuildContext context, Meal meal){
      Navigator.push(context, MaterialPageRoute(builder: (ctx) => MealDetailsScreen(meal: meal,)));
  }

  @override
  Widget build(context) {
    Widget mainContent = Container(
      padding: const EdgeInsets.all(15),
      color: Colors.black87,
      child: ListView.builder(
        itemCount: meals.length,
        itemBuilder: (ctx, index) {
          return MealItem(meal: meals[index], selectMeal: () { _selectedMeal(context, meals[index]); }, );
        },
      ),
    );
    if (meals.isEmpty) {
      mainContent = Container(
        color: Colors.black87,
        child: const Center(
          child: Text(
            'There\'s not any food! ',
            style: TextStyle(
                fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      );
    }
    if(title==null){
      return mainContent;
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(
          title!,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.black87,
      ),
      body: mainContent,
    );
  }
}
