import 'package:flutter_riverpod/flutter_riverpod.dart%20';
import 'package:provider/providers/meals_provider.dart';

import '../model/meal.dart';
import '../screens/filters.dart';

class FiltersNotifier extends StateNotifier<Map<Filter, bool>> {
  FiltersNotifier()
      : super({
          Filter.LactoseFree: false,
          Filter.GlutenFree: false,
          Filter.Vegan: false,
          Filter.Vegetarian: false,
        });

  void setFilters(Map<Filter, bool> chosenFilters) {
    state = chosenFilters;
  }

  void setFilter(Filter filter, bool isChecked) {
    state = {...state, filter: isChecked};
  }
}

final filterProvider =
    StateNotifierProvider<FiltersNotifier, Map<Filter, bool>>(
        (ref) => FiltersNotifier());

final filteredMealsProvider = Provider((ref) {
  final meals = ref.watch(mealsProvider);
  final selectedFilters = ref.watch(filterProvider);
  return meals.where((meal) {
    if (selectedFilters[Filter.LactoseFree]! && !meal.isLactoseFree) {
      return false;
    }
    if (selectedFilters[Filter.GlutenFree]! && !meal.isGlutenFree) {
      return false;
    }
    if (selectedFilters[Filter.Vegan]! && !meal.isVegan) return false;
    if (selectedFilters[Filter.Vegetarian]! && !meal.isVegetarian) {
      return false;
    }
    return true;
  }).toList();
});
