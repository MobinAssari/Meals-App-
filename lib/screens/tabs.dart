import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart%20';
import 'package:provider/providers/favorites_provider.dart';
import 'package:provider/providers/meals_provider.dart';
import '../data/dummy_data.dart';
import '../screens/categories.dart';
import '../screens/filters.dart';
import '../screens/meals.dart';
import '../widgets/main_drawer.dart';

import '../model/meal.dart';

const kselectedFilters = {
  Filter.GlutenFree: false,
  Filter.LactoseFree: false,
  Filter.Vegan: false,
  Filter.Vegetarian: false,
};

class TabsScreen extends ConsumerStatefulWidget {
  const TabsScreen({super.key});

  @override
  ConsumerState<TabsScreen> createState() {
    return _TabScrxeenState();
  }
}

class _TabScrxeenState extends ConsumerState<TabsScreen> {
  int _selectedPageIndex = 0;

  void _favoriteSelectMessege(String messege) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.white,
        content: Text(
          messege,
          style: const TextStyle(color: Colors.black87),
        ),
      ),
    );
  }

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  Map<Filter, bool> _selectedFilters = kselectedFilters;

  @override
  Widget build(context) {
    final meals = ref.watch(mealsProvider);
    final availabelMeals = meals.where((meal) {
      if (_selectedFilters[Filter.LactoseFree]! && !meal.isLactoseFree) {
        return false;
      }
      if (_selectedFilters[Filter.GlutenFree]! && !meal.isGlutenFree) {
        return false;
      }
      if (_selectedFilters[Filter.Vegan]! && !meal.isVegan) return false;
      if (_selectedFilters[Filter.Vegetarian]! && !meal.isVegetarian) {
        return false;
      }
      return true;
    }).toList();
    Widget activeScreen = CategoriesScreen(
      filteredMeals: availabelMeals,
    );
    var activePageTitle = "Categories";
    void selectedScreen(String identifier) async {
      Navigator.of(context).pop<Map<Filter, bool>>();
      if (identifier == 'filters') {
        final result = await Navigator.of(context).push(
          MaterialPageRoute(
            builder: (ctx) => FiltersScreen(
              currentFilters: _selectedFilters,
            ),
          ),
        );
        setState(() {
          _selectedFilters = result ?? kselectedFilters;
        });
      }
    }


    if (_selectedPageIndex == 1) {
      final favoritesProvider = ref.watch(favoriteProvider);
      activeScreen = MealsScreen(
        meals: favoritesProvider,
      );
      activePageTitle = 'Your Favorites';
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
        centerTitle: true,
        title: Text(activePageTitle),
      ),
      drawer: MainDrawer(
        onSelectScreen: selectedScreen,
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
      ),
    );
  }
}
