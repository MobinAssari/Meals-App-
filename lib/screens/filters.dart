import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart%20';
import 'package:provider/providers/filter.dart';

enum Filter { GlutenFree, LactoseFree, Vegetarian, Vegan }

class FiltersScreen extends ConsumerStatefulWidget {
  FiltersScreen({
    super.key,
  });

  @override
  ConsumerState<FiltersScreen> createState() {
    return _FiltersScreenState();
  }
}

class _FiltersScreenState extends ConsumerState<FiltersScreen> {
  var _glutinState = false;
  var _lactoseState = false;
  var _vegetarian = false;
  var _vegan = false;

  @override
  void initState() {
    final activrFilters = ref.read(filterProvider);
    _glutinState = activrFilters[Filter.GlutenFree]!;
    _lactoseState = activrFilters[Filter.LactoseFree]!;
    _vegetarian = activrFilters[Filter.Vegetarian]!;
    _vegan = activrFilters[Filter.Vegan]!;
  }

  @override
  Widget build(context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.black87,
        title: const Text('Your Filters'),
      ),
      // drawer: MainDrawer(onSelectScreen: selectScreen),
      body: WillPopScope(
        onWillPop: () async {
          ref.read(filterProvider.notifier).setFilters({
            Filter.GlutenFree: _glutinState,
            Filter.LactoseFree: _lactoseState,
            Filter.Vegan: _vegan,
            Filter.Vegetarian: _vegetarian
          });

          return true;
        },
        child: Container(
          color: Colors.black87,
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              SwitchListTile(
                value: _glutinState,
                onChanged: (isChecked) {
                  setState(() {
                    _glutinState = isChecked;
                  });
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
                value: _lactoseState,
                onChanged: (isChecked) {
                  setState(() {
                    _lactoseState = isChecked;
                  });
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
                value: _vegetarian,
                onChanged: (isChecked) {
                  setState(() {
                    _vegetarian = isChecked;
                  });
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
                value: _vegan,
                onChanged: (isChecked) {
                  setState(() {
                    _vegan = isChecked;
                  });
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
      ),
    );
  }
}
