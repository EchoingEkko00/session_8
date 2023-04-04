import 'package:path/path.dart' as path;

import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';

class ConfigDBProv with ChangeNotifier {
  late final _dbPath;
  late final _dbName;
  late final Future<Database> _database;

  ConfigDBProv() {
    _database = _init();
  }

  Future<Database> _init() async {
    // Recupere le chemin pour la base de donnee
    _dbPath = await getDatabasesPath();

    // Cree une reference sur notre base de donnee
    _dbName = path.join(_dbPath, "mysettings.db");

    print("Managing DV $_dbName");

    final _newdatabase = openDatabase(
      _dbName,
      version: 1,
      onCreate: (db, version) {
        print("Creating DB");
        print("Got a call for version $version");
        return db.execute(
            "CREATE TABLE myconfig (id INTEGER PRIMARY KEY, element TEXT, value TEXT, desc TEXT)");
      },
    );
    return _newdatabase;
  }

  get database {
    return _database;
  }

  Future<void> incrementCountInDB() async {
    // Aller recuperer notre DB
    final _db = await _database;

    final _result =
        await _db.query("myconfig", columns: ['*'], where: "element = 'start'");
    
    print("Result is  $_result");

    
    if (_result.length == 1) {
      // Nous avons deja un element, incrementons le
      print("Mise a jour de l'element");
      final updatedID = await _db.update(
        "myconfig",
        {'value': (int.parse(_result[0]['value'] as String) + 1).toString()},
        where: 'id= ${_result[0]["id"]}',
      );
    } else {
      print("Creation d'un element");
      final newID = await _db.insert(
        'myconfig',
        {
          'element': 'start',
          'value': '42',
          'desc': 'Mon compteur',
        },
      );
      print("Nouvel element avec ID $newID");
    }
    notifyListeners();
  }

  Future<String> getStartCountFromDB() async {
    // Aller recuperer notre DB
    final _db = await _database;

    final _result =
        await _db.query("myconfig", columns: ['*'], where: "element = 'start'");

    return (_result.length == 1) ? _result[0]['value'] as String : "0";
  }
}
