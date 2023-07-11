import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key});

  @override
  Widget build(context) {
    return const Drawer(
      child: Column(
        children: [
          DrawerHeader(child: Row(children: [
            Text('data')
          ],))
        ],
      ),
    );
  }
}
