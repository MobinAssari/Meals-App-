import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  MainDrawer({super.key, required this.onSelectScreen});

  void Function(String identifier) onSelectScreen;

  @override
  Widget build(context) {
    return Drawer(
      backgroundColor: const Color.fromARGB(255, 0, 0, 0),
      child: Column(
        children: [
          const DrawerHeader(
            padding: EdgeInsets.all(30),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color.fromARGB(247, 140, 95, 71),
                  Color.fromARGB(203, 0, 0, 0)
                ],
              ),
            ),
            child: Row(
              children: [
                Icon(
                  Icons.fastfood_rounded,
                  size: 70,
                  color: Color.fromARGB(255, 190, 119, 78),
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  'Let\'s cook!',
                  style: TextStyle(
                      color: Color.fromARGB(255, 190, 119, 78), fontSize: 30),
                ),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(
              Icons.food_bank_outlined,
              size: 40,
              color: Color.fromARGB(255, 206, 173, 144),
            ),
            title: const Text(
              'Meals',
              style: TextStyle(
                  color: Color.fromARGB(255, 206, 173, 144), fontSize: 22),
            ),
            onTap: () {
              onSelectScreen('meals');
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.settings,
              size: 40,
              color: Color.fromARGB(255, 206, 173, 144),
            ),
            title: const Text(
              'Filters',
              style: TextStyle(
                  color: Color.fromARGB(255, 206, 173, 144), fontSize: 22),
            ),
            onTap: () {
              onSelectScreen('filters');
            },
          )
        ],
      ),
    );
  }
}
