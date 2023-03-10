import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import './models/tableauPeriodic.dart';
import './data/PeriodicTableJSON.json.dart';

const kRowCount = 8;
const kGutterInset = EdgeInsets.all(kGutterWidth);
const kContentSize = 64.0;
const kGutterWidth = 2.0;
const xposTotal = 18;
const yposTotal = 8;
var listeDesYvides = [
  {0},
  {0}, //1
  {1, 8},
  {1, 2, 3, 6, 7, 8},
  {1, 2, 3, 8}, //4
  {1, 2, 3, 8},
  {1, 2, 3, 8},
  {1, 2, 3, 8},
  {1, 2, 3, 8},
  {1, 2, 3, 8},
  {1, 2, 3, 8},
  {1, 2, 3, 8},
  {1, 2, 3, 8},
  {1, 8},
  {1, 8},
  {1, 8},
  {1, 8},
  {1, 8},
  {8}
];
final elements = jsonDecode(jsonTablePer)['elements'] as List;

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  // Than we setup preferred orientations,
  // and only after it finished we run our app
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((value) => runApp(MyApp()));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tableau periodic',
      debugShowCheckedModeBanner: false,
      home: AppElements(),
    );
  }
}

class DetailElement extends StatelessWidget {
  DetailElement(this.element, {Key? key}) : super(key: key);

  final Elements element;

  @override
  Widget build(BuildContext context) {
    final item = Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: [element.getColor(), Colors.grey])),
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

class TilesZoom extends StatelessWidget {
  TilesZoom(this.element, {Key? key}) : super(key: key);

  final Elements element;

  @override
  Widget build(BuildContext context) {
    final item = Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: [element.getColor(), Colors.grey])),
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

class ElementTile extends StatelessWidget implements PreferredSizeWidget {
  const ElementTile(this.element);
  final Elements element;

  Size get preferredSize => Size.fromHeight(kContentSize);

  @override
  Widget build(BuildContext context) {
    final tile = Container(
      width: kGutterWidth,
      height: kContentSize,
      margin: kGutterInset,
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: [element.getColor(), Colors.grey])),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        verticalDirection: VerticalDirection.down,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
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
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                element.symbol,
                overflow: TextOverflow.ellipsis,
              )
            ],
          ),
          Flexible(
              child: MaterialButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => TilesZoom(element)));
            },
            child: Text(
              element.name,
              overflow: TextOverflow.ellipsis,
            ),
          ))
        ],
      ),
    );

    return Hero(
      tag: 'hero-${element.symbol}',
      flightShuttleBuilder: (_, anim, __, ___, ____) => ScaleTransition(
          scale: anim.drive(Tween(begin: 1, end: 1.75)), child: tile),
      child: Transform.scale(scale: 1, child: tile),
    );
  }
}

class AppElements extends StatelessWidget {
  final tab = elements.map((e) => Elements(e)).toList();
  List<Widget> widgets = List.empty(growable: true);
  var ligneDesY = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Tableau Periodic')),
        body: Align(
            alignment: Alignment.center,
            child: GridView.count(
              crossAxisCount: kRowCount,
              crossAxisSpacing: kGutterWidth,
              mainAxisSpacing: kGutterWidth,
              scrollDirection: Axis.horizontal,
              children: categoriser(),
            )));
  }

  List<Widget> categoriser() {
    for (var ligneDesX = 1; ligneDesX <= xposTotal; ligneDesX++) {
      ligneDesY = 1;
      ajoutElement(
        ligneDesX,
      );
    }
    return widgets;
  }

  void ajoutVides(int ligneX) {
    for (var i = 0; i < listeDesYvides[ligneX].length; i++) {
      int y = listeDesYvides[ligneX].elementAt(i);
      if (y == ligneDesY) {
        widgets.add(Container(color: Colors.black38, margin: kGutterInset));
        if (ligneDesY == yposTotal) {
          ligneDesY = 1;
          break;
        } else {
          ligneDesY++;
        }
      }
    }
  }

  void ajoutElement(int ligneX) {
    for (var item in tab) {
      if (ligneDesY == 1 && item.number != 1 && ligneX != 18) {
        ligneDesY = 1;
        break;
      }
      if ((item.xpos == ligneX && item.ypos == ligneDesY) &&
          widgets.contains(ElementTile(item)) == false) {
        widgets.add(ElementTile(item));
        if (ligneDesY == yposTotal) {
          ligneDesY = 1;
          break;
        } else {
          ligneDesY++;
        }
      }
      ajoutVides(ligneX);
    }
  }
}
