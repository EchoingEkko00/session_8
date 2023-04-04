import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/configdb.dart';

class MyDBCountPage extends StatelessWidget {
  const MyDBCountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _database = Provider.of<ConfigDBProv>(context);
    print("Got Database as ${_database.database}");
    _database.database.then((_db) {
      _db.query(
        "myconfig",
        columns: ['*'],
      ).then(
        (value) {
          print("Got a response from DB as $value");
        },
      ).catchError((error) {
        print("Got instead an error");
      });
    });

    return Scaffold(
      appBar: AppBar(title: Text("DB Count Page")),
      body: Center(
        child: FutureBuilder(
          builder: (context, snapshot) {
            return (snapshot.connectionState == ConnectionState.waiting)
                ? CircularProgressIndicator()
                : Text("Mon compte est ${snapshot.data}.");
          },
          future: _database.getStartCountFromDB(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.add,
        ),
        onPressed: () {
          _database.incrementCountInDB();
          print("Nothing yet");
        },
      ),
    );
  }
}
