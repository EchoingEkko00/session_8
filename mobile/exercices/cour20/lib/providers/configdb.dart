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
    );

    return _newdatabase;
  }

  get database {
    return _database;
  }
}
