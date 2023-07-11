import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FiltersScreen extends StatefulWidget {
  @override
  State<FiltersScreen> createState() {
    return _FiltersScreenState();
  }
}

class _FiltersScreenState extends State<FiltersScreen> {
  var _glutinState = false;

  @override
  Widget build(context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Filters'),
      ),
      body: Column(
        children: [
          SwitchListTile(
            value: _glutinState,
            onChanged: (isChecked) {
              setState(() {
                _glutinState = isChecked;
              });
            },
            title: Text('Glutin_free'),
          )
        ],
      ),
    );
  }
}
