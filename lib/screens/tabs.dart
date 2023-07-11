import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meals_app/screens/categories.dart';
import 'package:meals_app/screens/meals.dart';
import 'package:meals_app/widgets/main_drawer.dart';

import '../model/meal.dart';

class TabsScreen extends StatefulWidget {
  @override
  State<TabsScreen> createState() {
    return _TabScrxeenState();
  }
}

class _TabScrxeenState extends State<TabsScreen> {
  int _selectedPageIndex = 0;
  void _favoriteSelectMessege(String messege){

    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(backgroundColor: Colors.white, content: Text(messege,style: const TextStyle(color: Colors.black87),),),);
  }

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }
  final List<Meal> favoriteMeals=[];

  void _favoriteListEdit(Meal selectedMeal){
    setState(() {
      if(favoriteMeals.contains(selectedMeal)){
        favoriteMeals.remove(selectedMeal);
        _favoriteSelectMessege('This meal is no longer in your favorite list');
      }
      else {
      favoriteMeals.add(selectedMeal);
      _favoriteSelectMessege('Added to favorite list');

      }
    },);

    }




  @override
  Widget build(context) {
    Widget activeScreen = CategoriesScreen(onFavoriteListEdit: _favoriteListEdit,);
    var _activePageTitle = "Categories";
    void selectedScreen(String identifier){
      if(identifier == 'meals'){
        Navigator.of(context).pop();
      }
      else if(identifier == 'filters'){

      }
    }

    if (_selectedPageIndex == 1) {
      activeScreen = MealsScreen(
        meals: favoriteMeals, onFavoriteListEdit: _favoriteListEdit,
      );
      _activePageTitle = 'Your Favorites';
    }

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black87,
          centerTitle: true,
          title: Text(_activePageTitle),
        ),drawer: MainDrawer(onSelectScreen: selectedScreen,),
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
