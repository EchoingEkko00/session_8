import 'package:flutter/material.dart';

import '../widgets/itemdemaliste.dart';

class ListWithDismissible extends StatefulWidget {
  const ListWithDismissible({Key? key}) : super(key: key);

  @override
  _ListWithDismissibleState createState() => _ListWithDismissibleState();
}

class _ListWithDismissibleState extends State<ListWithDismissible> {
  final _myListOfEvents = [
    {
      "message": "Premier",
      "compte": 1,
    },
    {
      "message": "Premier",
      "compte": 2,
    }
  ];
  var _ItemCountID = 2;

  void _addItem() {
    setState(() {
      _myListOfEvents.add(
        {
          "message": "New ${DateTime.now()}",
          "compte": _ItemCountID++,
        },
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: _addItem,
          child: Text(
            "Ajoute un element",
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: _myListOfEvents.length,
            itemBuilder: ((context, index) {
              return Dismissible(
                direction: DismissDirection.endToStart,
                background: Container(
                  alignment: Alignment.centerRight,
                  padding: EdgeInsets.only(right: 20),
                  color: Colors.red,
                  child: Icon(
                    Icons.delete,
                    size: 40,
                    color: Colors.white,
                  ),
                ),
                onDismissed: (direction) {
                  setState(() {
                    _myListOfEvents.remove(_myListOfEvents[index]);
                  });
                },
                //key: ValueKey(_myListOfEvents[index]["compte"]),
                key: UniqueKey(),
                child: ItemDeMaListe(
                  _myListOfEvents[index]["message"] as String,
                  _myListOfEvents[index]["compte"] as int,
                ),
              );
            }),
          ),
        )
      ],
    );
  }
}
