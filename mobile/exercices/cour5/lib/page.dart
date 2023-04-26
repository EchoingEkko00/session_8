import 'package:flutter/material.dart';
import './main.dart';

class BottomNavigatorPage extends StatefulWidget {
  Function fonction;
  BottomNavigatorPage(this.fonction, {Key? key}) : super(key: key);

  static const routeName = 'bottomNav';

  @override
  State<BottomNavigatorPage> createState() => _BottomNavigatorPageState();
}

class _BottomNavigatorPageState extends State<BottomNavigatorPage> {
  int _selectedOption = 0;

  void _selectPage(int index) {
    setState(() {
      _selectedOption = index;
      print("Selected $index");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Page avec Bottom Nav'),
      ),
      body: Column(children: [
        Text("Option selected is $_selectedOption"),
        ElevatedButton(
            onPressed: () {
              widget.fonction();
            },
            child: Text("asd"))
      ]),
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        backgroundColor: Colors.orange,
        unselectedItemColor: Colors.white,
        selectedItemColor: Colors.blue,
        currentIndex: _selectedOption,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.one_k), label: "One"),
          BottomNavigationBarItem(icon: Icon(Icons.twelve_mp), label: "Two"),
          BottomNavigationBarItem(
              icon: Icon(Icons.theater_comedy), label: "Three"),
        ],
      ),
    );
  }
}
