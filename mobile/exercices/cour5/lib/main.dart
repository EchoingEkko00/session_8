import 'package:flutter/material.dart';
import './page.dart';
import 'top.dart';

void main() {
  runApp(MonApplication());
}

class MonApplication extends StatefulWidget {
  MonApplication({Key? key}) : super(key: key);

  static const routeName = 'monApp';

  @override
  State<MonApplication> createState() => _MonApplication();
}

class _MonApplication extends State<MonApplication> {
  bool pages = true;

  void setPage() {
    setState(() {
      (pages) ? pages = false : pages = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Mon application",
      theme: ThemeData(),
      debugShowCheckedModeBanner: false,
      home: (pages) ? BottomNavigatorPage(setPage) : TopNavigationBar(setPage),
      /*Scaffold(
        appBar:
            AppBar(backgroundColor: Colors.amber, title: Text("Cour d'essai")),
        backgroundColor: Colors.red.shade600,
        body: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.adb),
            Center(child: Text("Salut")),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const BottomNavigatorPage()));
                },
                child: Text("Route"))
          ],
        ),
      ),*/
    );
  }
}
