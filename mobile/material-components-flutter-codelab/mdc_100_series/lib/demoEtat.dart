import 'package:flutter/material.dart';

import 'widget/stateViewState.dart';
import 'widget/ControlEtatWidget.dart';

void main() {
  runApp(MonApplication());
}

class MonApplication extends StatelessWidget {
  MonApplication({Key? key}) : super(key: key);
  var _boutons = List.generate(5, (_) => false);
  var _compteBouton = List.generate(5, (_) => 0);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "State avec State",
      theme: ThemeData(
        textTheme: TextTheme(
          bodyText2: TextStyle(
            fontSize: 20,
          ),
        ),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("State avec State"),
        ),
        body: StateViewStateWidget(_boutons, _compteBouton),
        drawer: ControlEtatWidget(_boutons),
      ),
    );
  }
}
