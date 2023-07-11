import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meals_app/screens/categories.dart';
import 'package:meals_app/screens/meals.dart';

class TabsScreen extends StatefulWidget {
  @override
  State<TabsScreen> createState() {
    return _TabScrxeenState();
  }
}

class _TabScrxeenState extends State<TabsScreen> {
  int _selectedPageIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(context) {
    Widget activeScreen = const CategoriesScreen();
    if (_selectedPageIndex == 1) {
      activeScreen = MealsScreen(meals: [], title: 'Favorites');
    }

    return Scaffold(
        appBar: AppBar(
          title: Text('dynamic'),
        ),
        body: activeScreen,
        bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.set_meal), label: 'Categories'),
            BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Favorites'),
          ],
          backgroundColor: Colors.black87,
          unselectedItemColor: const Color.fromARGB(128, 11, 87, 208),
          onTap: _selectPage,
          currentIndex: _selectedPageIndex,
        ));
  }
}
