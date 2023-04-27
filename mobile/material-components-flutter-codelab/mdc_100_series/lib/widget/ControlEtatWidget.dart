import 'package:flutter/material.dart';

class ControlEtatWidget extends StatelessWidget {
  final List<bool> _boutons;
  ControlEtatWidget(this._boutons, {Key? key}) : super(key: key);

  var monEtat = true;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(color: Colors.blue),
            child: Container(
              width: double.infinity,
              child: Text(
                "États",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                ),
              ),
            ),
          ),
          for (var i = 0; i < _boutons.length; i++)
            Switch(
              value: _boutons[i],
              onChanged: (etat) => print("Click avec $etat"),
            ),
        ],
      ),
    );
  }
}
