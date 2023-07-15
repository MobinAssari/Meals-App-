import 'package:flutter_riverpod/flutter_riverpod.dart%20';

import '../model/meal.dart';

class FavoriteMealsNotifier extends StateNotifier<List<Meal>> {
  FavoriteMealsNotifier() : super([]);

  bool editFavoriteMealsNotifier(Meal meal) {
    if (state.contains(meal)) {
      state = state.where((m) => meal.id == m.id).toList();
      return false;
    } else {
      state = [...state, meal];
      return true;
    }
  }
}

final favoriteProvider =
    StateNotifierProvider<FavoriteMealsNotifier, List<Meal>>(
        (ref) => FavoriteMealsNotifier());
