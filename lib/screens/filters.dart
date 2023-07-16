import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart%20';
import 'package:provider/providers/filter.dart';

enum Filter { GlutenFree, LactoseFree, Vegetarian, Vegan }

class FiltersScreen extends ConsumerWidget {
  FiltersScreen({
    super.key,
  });

  @override
  Widget build(context, WidgetRef ref) {
    final activeFilters = ref.watch(filterProvider);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.black87,
        title: const Text('Your Filters'),
      ),
      // drawer: MainDrawer(onSelectScreen: selectScreen),
      body: Container(
          color: Colors.black87,
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              SwitchListTile(
                value: activeFilters[Filter.GlutenFree]!,
                onChanged: (isChecked) {
                  ref
                      .read(filterProvider.notifier)
                      .setFilter(Filter.GlutenFree, isChecked);
                },
                title: const Text(
                  'Gluten_free',
                  style: TextStyle(
                      color: Color.fromARGB(255, 206, 161, 116),
                      fontSize: 22,
                      fontWeight: FontWeight.bold),
                ),
                subtitle: const Text(
                  'You\'ll just see gluten_free meals',
                  style: TextStyle(
                      color: Color.fromARGB(221, 206, 172, 144), fontSize: 12),
                ),
              ),
              SwitchListTile(
                value: activeFilters[Filter.LactoseFree]!,
                onChanged: (isChecked) {
                  ref
                      .read(filterProvider.notifier)
                      .setFilter(Filter.LactoseFree, isChecked);
                },
                title: const Text(
                  'Lactose_free',
                  style: TextStyle(
                      color: Color.fromARGB(255, 206, 161, 116),
                      fontSize: 22,
                      fontWeight: FontWeight.bold),
                ),
                subtitle: const Text(
                  'You\'ll just see lactose_free meals',
                  style: TextStyle(
                      color: Color.fromARGB(221, 206, 172, 144), fontSize: 12),
                ),
              ),
              SwitchListTile(
                value: activeFilters[Filter.Vegetarian]!,
                onChanged: (isChecked) {
                  ref
                      .read(filterProvider.notifier)
                      .setFilter(Filter.Vegetarian, isChecked);
                },
                title: const Text(
                  'Vegetarian',
                  style: TextStyle(
                    color: Color.fromARGB(255, 206, 161, 116),
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: const Text(
                  'You\'ll just see vegetarian meals',
                  style: TextStyle(
                      color: Color.fromARGB(221, 206, 172, 144), fontSize: 12),
                ),
              ),
              SwitchListTile(
                value: activeFilters[Filter.Vegan]!,
                onChanged: (isChecked) {
                  ref
                      .read(filterProvider.notifier)
                      .setFilter(Filter.Vegan, isChecked);
                },
                title: const Text(
                  'Vegan',
                  style: TextStyle(
                      color: Color.fromARGB(255, 206, 161, 116),
                      fontSize: 22,
                      fontWeight: FontWeight.bold),
                ),
                subtitle: const Text(
                  'You\'ll just see vegan meals',
                  style: TextStyle(
                      color: Color.fromARGB(221, 206, 172, 144), fontSize: 12),
                ),
              )
            ],
          ),
        ),
    );
  }
}
