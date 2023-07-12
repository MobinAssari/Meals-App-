import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meals_app/screens/tabs.dart';
import 'package:meals_app/widgets/filter_item.dart';
import 'package:meals_app/widgets/main_drawer.dart';

enum Filter { GlutenFree, LactoseState, Vegetarian, Vegan }

class FiltersScreen extends StatefulWidget {
  @override
  State<FiltersScreen> createState() {
    return _FiltersScreenState();
  }
}

class _FiltersScreenState extends State<FiltersScreen> {
  var _glutinState = false;
  var _lactoseState = false;
  var _vegetarian = false;
  var _vegan = false;

  /* void selectScreen(String identifier) {
    Navigator.of(context).pop();

    if (identifier == 'meals') {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (ctx) => TabsScreen(),
        ),
      );
    }
  }*/

  @override
  Widget build(context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.black87,
        title: Text('Your Filters'),
      ),
      // drawer: MainDrawer(onSelectScreen: selectScreen),
      body: WillPopScope(
        onWillPop: () async {
          Navigator.of(context).pop({
            Filter.GlutenFree : _glutinState,
            Filter.LactoseState : _lactoseState,
            Filter.Vegan : _vegan,
            Filter.Vegetarian : _vegetarian
          });
          return false;
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
