import 'package:flutter/material.dart';

class TopNavigationBar extends StatefulWidget {
  TopNavigationBar(this.fonction, {Key? key}) : super(key: key);
  static String routeName = 'topTabExample';
  Function fonction;
  @override
  _TopNavigationBarState createState() => _TopNavigationBarState();
}

class _TopNavigationBarState extends State<TopNavigationBar> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Top navigation Tabs'),
          bottom: TabBar(
            tabs: [
              Tab(
                icon: Icon(Icons.alarm_add),
                text: 'premier',
              ),
              Tab(
                icon: Icon(Icons.backpack),
                text: 'Deuxieme',
              ),
              Tab(
                icon: Icon(Icons.table_chart_outlined),
                text: 'Troisiem',
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Center(
                child: Column(
              children: [
                ElevatedButton(
                    onPressed: () {
                      widget.fonction();
                    },
                    child: Text("Route"))
              ],
            )),
            Center(
              child: Text("Deuxieme Tab"),
            ),
            Center(
              child: Text("Troisieme Tab"),
            ),
          ],
        ),
      ),
    );
  }
}
