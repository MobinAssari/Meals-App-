import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meals_app/widgets/meal_item_details.dart';
import 'package:transparent_image/transparent_image.dart';

import '../model/meal.dart';

class MealItem extends StatelessWidget {
  MealItem({super.key, required this.meal, required this.selectMeal});

  final Meal meal;
  void Function() selectMeal;

  @override
  Widget build(context) {
    return Card(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      clipBehavior: Clip.hardEdge,
      child: InkWell(
        onTap: selectMeal,
        child: Stack(
          children: [
            FadeInImage(
              placeholder: MemoryImage(kTransparentImage),
              image: NetworkImage(meal.imageUrl),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                padding: const EdgeInsets.all(15),
                color: const Color.fromARGB(103, 4, 4, 4),
                child: Column(
                  children: [
                    Text(
                      meal.title,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        MealDetails(text: '${meal.duration} min', icon: Icons.access_time_rounded,),
                        MealDetails(text: meal.complexity.name, icon: Icons.work_outlined,),
                        MealDetails(text: meal.affordability.name, icon: Icons.attach_money,),
                       ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
