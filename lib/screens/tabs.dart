import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TabsScreen extends StatefulWidget {  @override
  State<TabsScreen> createState() {
    return _TabScrxeenState();
  }
}
class _TabScrxeenState extends State<TabsScreen>{
  @override
  Widget build( context) {
    return Scaffold(
      appBar: AppBar(title: Text('dynamic'),),body: ,
      bottomNavigationBar: BottomNavigationBar(items: [],),
    );
  }
}
