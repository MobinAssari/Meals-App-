import 'package:flutter_riverpod/flutter_riverpod.dart%20';

import '../screens/filters.dart';

class FiltersNotifier extends StateNotifier<Map<Filter, bool>> {
  FiltersNotifier()
      : super({
          Filter.LactoseFree: false,
          Filter.GlutenFree: false,
          Filter.Vegan: false,
          Filter.Vegetarian: false,
        });
void setFilters(Map<Filter,bool> chosenFilters){
  state = chosenFilters;
}
  void setFilter(Filter filter, bool isChecked) {
    state = {...state, filter: isChecked};
  }
}

final filterProvider =
    StateNotifierProvider<FiltersNotifier, Map<Filter, bool>>(
        (ref) => FiltersNotifier());
