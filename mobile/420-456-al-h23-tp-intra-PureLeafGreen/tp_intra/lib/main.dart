import 'package:flutter/material.dart';
import './model/tableauPeriodic.dart';
import './data/PeriodicTableJSON.json.dart';
import 'dart:convert';

const kGutterInset = EdgeInsets.all(kGutterWidth);
const kContentSize = 64.0;
const kGutterWidth = 2.0;
const double xposTotal = 18;
const double yposTotal = 8;
final elements = jsonDecode(jsonTablePer)['elements'] as List;
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tableau periodique',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'CAL tableau périodique'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final tab = elements.map((e) => Elements(e)).toList();
  int ligneDesY = 1;
  int ligneDesX = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: LayoutBuilder(builder: (context, BoxConstraints constraints) {
        ligneDesX = 1;
        return createListView(constraints);
      }),
    );
  }

  ListView createListView(BoxConstraints constraints) {
    return ListView(
      scrollDirection: Axis.horizontal,
      children: createColumns(constraints),
    );
  }

  List<Column> createColumns(BoxConstraints constraints) {
    List<Column> columns = List.empty(growable: true);
    for (int x = 1; x <= xposTotal; x++) {
      columns.add(categoriser(constraints));
    }
    return columns;
  }

  Column categoriser(BoxConstraints constraints) {
    List<Widget> column = List.empty(growable: true);
    for (int y = 1; y <= yposTotal; y++) {
      var contain = tab
          .where((element) => element.ypos == y && element.xpos == ligneDesX);
      if (contain.isEmpty) {
        ajoutVides(ligneDesX, column, constraints);
      }
      for (var item in tab) {
        if (item.xpos == ligneDesX && item.ypos == y) {
          column.add(ElementTile(item, constraints));
        }
      }
    }
    ligneDesX++;
    return Column(
      children: column,
    );
  }

  void ajoutVides(int ligneX, List<Widget> column, BoxConstraints constraints) {
    column.add(Container(
        width: constraints.maxHeight / yposTotal - 4,
        height: constraints.maxHeight / yposTotal - 4,
        color: Colors.black38,
        margin: kGutterInset));
  }
}

class ElementTile extends StatelessWidget {
  const ElementTile(this.element, this.constraints);
  final Elements element;
  final BoxConstraints constraints;

  @override
  Widget build(BuildContext context) {
    final tile = MaterialButton(
      padding: EdgeInsets.all(0),
      onPressed: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => TilesZoom(element)));
      },
      child: Container(
        width: this.constraints.maxHeight / yposTotal - 4,
        height: this.constraints.maxHeight / yposTotal - 4,
        margin: kGutterInset,
        decoration: BoxDecoration(gradient: element.getColor()),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          verticalDirection: VerticalDirection.down,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(element.number.toString(),
                    style: TextStyle(fontSize: 10.0),
                    overflow: TextOverflow.ellipsis),
                Text(
                    double.parse(element.atomicMass.toString())
                        .toStringAsPrecision(5),
                    style: TextStyle(fontSize: 10.0),
                    overflow: TextOverflow.ellipsis),
              ],
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  element.symbol,
                  overflow: TextOverflow.ellipsis,
                )
              ],
            ),
            Text(
              element.name,
              overflow: TextOverflow.clip,
            ),
          ],
        ),
      ),
    );
    return tile;
  }
}

class TilesZoom extends StatelessWidget {
  TilesZoom(this.element, {Key? key}) : super(key: key);

  final Elements element;

  @override
  Widget build(BuildContext context) {
    final item = Container(
      decoration: BoxDecoration(gradient: element.getColor()),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        verticalDirection: VerticalDirection.down,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(element.number.toString(), style: TextStyle(fontSize: 50.0)),
              Text(
                  double.parse(element.atomicMass.toString())
                      .toStringAsPrecision(5),
                  style: TextStyle(fontSize: 50.0),
                  overflow: TextOverflow.ellipsis),
            ],
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Text(element.symbol, style: TextStyle(fontSize: 50.0))],
          ),
          Flexible(
              child: MaterialButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => DetailElement(element)));
            },
            child: Text(
              element.name,
              style: TextStyle(fontSize: 50.0),
              overflow: TextOverflow.ellipsis,
            ),
          ))
        ],
      ),
    );

    return Scaffold(
      backgroundColor: Color.lerp(Colors.grey[850], Colors.cyan, 0.07),
      appBar: AppBar(
        backgroundColor: Color.lerp(Colors.grey[850], Colors.cyan, 0.2),
      ),
      body: item,
    );
  }
}

class DetailElement extends StatelessWidget {
  DetailElement(this.element, {Key? key}) : super(key: key);

  final Elements element;

  @override
  Widget build(BuildContext context) {
    final item = Container(
      decoration: BoxDecoration(gradient: element.getColor()),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        verticalDirection: VerticalDirection.down,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Element :", style: TextStyle(fontSize: 35)),
              Text(
                element.name,
                style: TextStyle(fontSize: 35),
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
          element.getDetails()
        ],
      ),
    );

    return Scaffold(
        backgroundColor: Color.lerp(Colors.grey[850], Colors.cyan, 0.07),
        appBar: AppBar(
          backgroundColor: Color.lerp(Colors.grey[850], Colors.cyan, 0.2),
        ),
        body: item);
  }
}
