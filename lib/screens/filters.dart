import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meals_app/screens/tabs.dart';
import 'package:meals_app/widgets/filter_item.dart';
import 'package:meals_app/widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  @override
  State<FiltersScreen> createState() {
    return _FiltersScreenState();
  }

}

class _FiltersScreenState extends State<FiltersScreen> {
  var _glutinState = false;
  void selectScreen(String identifier){
    Navigator.of(context).pop();

    if(identifier == 'meals'){
      
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (ctx)=> TabsScreen(),),);
    }
  }

  @override
  Widget build(context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.black87,
        title: Text('Your Filters'),
      ),
      drawer: MainDrawer(onSelectScreen: selectScreen),
      body: Container(
        color: Colors.black87,
        padding: const EdgeInsets.all(15),
        child: const Column(
          children: [
            /*SwitchListTile(
              value: _glutinState,
              onChanged: (isChecked) {
                setState(() {
                  _glutinState = isChecked;
                });
              },
              title: const Text(
                'Glutin_free',
                style: TextStyle(
                  color: Color.fromARGB(255, 206, 173, 144),
                ),
              ),
              subtitle: const Text(
                'You\'ll just see meals which are glutin_free',
                style: TextStyle(color: Color.fromARGB(255, 206, 173, 144)),
              ),
            )*/
            FilterItem(title: 'Glutin_free', subTitle: 'You\'ll just see meals which are glutin_free'),
            FilterItem(title: 'Glutin_free', subTitle: 'You\'ll just see meals which are glutin_free'),

          ],
        ),
      ),
    );
  }
}
