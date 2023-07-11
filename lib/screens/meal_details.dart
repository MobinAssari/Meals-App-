import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

import '../model/meal.dart';

class MealDetailsScreen extends StatelessWidget {
  const MealDetailsScreen({super.key, required this.meal});

  final Meal meal;

  @override
  Widget build(context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          meal.title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.black87,
      ),
      body: Container(
        alignment: Alignment.center,
        color: Colors.black87,
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: [
            FadeInImage(
              placeholder: MemoryImage(kTransparentImage),
              image: NetworkImage(meal.imageUrl),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              'Ingredients:',textAlign: TextAlign.center,
              style: TextStyle(
                  color: Color.fromARGB(255, 230, 182, 157),
                  fontSize: 22,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 10,
            ),
            Column(
              children: [
                for (var item in meal.ingredients)
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 1.0),
                    child: Text(
                      item,
                      style: const TextStyle(color: Colors.white70, fontSize: 14),
                    ),
                  )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              'Steps:',textAlign: TextAlign.center,
              style: TextStyle(
                  color: Color.fromARGB(255, 230, 182, 157),
                  fontSize: 22,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 6,
            ),
            Column(
              children: [
                for (var item in meal.steps)
                  Padding(padding: const EdgeInsets.symmetric(vertical: 4),
                    child: Text(
                      item,
                      style: const TextStyle(color: Colors.white70, fontSize: 13,),textAlign: TextAlign.center,
                    ),
                  )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
