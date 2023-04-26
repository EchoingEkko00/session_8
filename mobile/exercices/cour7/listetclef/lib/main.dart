import 'package:flutter/material.dart';

import './pages/listDismissbleDemo.dart';

void main() {
  runApp(MonApplication());
}

class MonApplication extends StatefulWidget {
  MonApplication({Key? key}) : super(key: key);

  @override
  State<MonApplication> createState() => _MonApplicationState();
}

class _MonApplicationState extends State<MonApplication> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Mon application",
      home: NewHome(),
    );
  }
}

class NewHome extends StatelessWidget {
  const NewHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Navigation"),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.airplane_ticket,
              color: Colors.white,
            ),
            onPressed: () => print('click!'),
          ),
        ],
      ),
      body: ListWithDismissible(),
    );
  }
}
