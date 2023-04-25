import 'package:flutter/material.dart';

void main() {
  runApp(MonApplication());
}

class MonApplication extends StatelessWidget {
  MonApplication({Key? key}) : super(key: key);
  final myList = List.generate(
      125,
      (index) => Text("Item $index",
          style: TextStyle(
            color: Colors.red,
            fontSize: 30,
            backgroundColor: Colors.yellow,
          )));

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Mon application",
      home: Scaffold(
        appBar: AppBar(title: Text("My list view")),
        body: Column(
          children: [
            ListView(
              children: myList,
              shrinkWrap: true,
            )
          ],
        ),
      ),
    );
  }
}
