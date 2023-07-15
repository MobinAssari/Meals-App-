import 'package:flutter/material.dart';

class FilterItem extends StatefulWidget {
  const FilterItem({super.key, required this.title, required this.subTitle});

  final String title;
  final String subTitle;

  @override
  State<FilterItem> createState() {
    return _FilterItemState();
  }
}

class _FilterItemState extends State<FilterItem> {
  var _checkingState = false;

  @override
  Widget build(context) {
    return SwitchListTile(
      activeColor: const Color.fromARGB(255, 196, 129, 36),
      contentPadding: const EdgeInsets.all(7),
      value: _checkingState,
      onChanged: (isChecked) {
        setState(
          () {
            _checkingState = isChecked;
          },
        );
      },
      title: Text(
        widget.title,
        style: const TextStyle(
            color: Color.fromARGB(255, 206, 161, 116),
            fontSize: 22,
            fontWeight: FontWeight.bold),
      ),
      subtitle: Text(
        widget.subTitle,
        style: const TextStyle(
            color: Color.fromARGB(221, 206, 172, 144), fontSize: 12),
      ),
    );
  }
}
