import 'package:path/path.dart' as path;

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sqflite/sqflite.dart';

import 'pages/myDBCount.dart';
import 'providers/configdb.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final dbPath = await getDatabasesPath();

  final dbFileName = path.join(dbPath, "myfirst.db");

  final dbName = openDatabase(dbFileName);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ConfigDBProv(),
        ),
      ],
      child: MaterialApp(
        title: "Mon application",
        home: MyDBCountPage(),
      )
    );
  }
}
