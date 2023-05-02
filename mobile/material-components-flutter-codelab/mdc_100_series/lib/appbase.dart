import 'package:flutter/material.dart';

void main() {
  runApp(const MonApplication());
}

class MonApplication extends StatelessWidget {
  const MonApplication({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Mon application",
        theme: ThemeData(),
        home: Scaffold(
          appBar: AppBar(
            title: Text('Flexible Test'),
          ),
          body: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              LayoutBuilder(builder: (ctx, constraint) {
                // Include in a Layout builder to get a info on the site
                print(constraint);
                return Container(
                  height: 100,
                  //width: 50,
                  child: Column(
                    children: [
                      Text('Texte qui est long'),
                      Text(
                          'B says : ${constraint.maxHeight.toStringAsFixed(2)}'),
                      Text(
                          'B says : ${constraint.maxWidth.toStringAsFixed(2)}'),
                    ],
                  ),
                  //child: Text('Texte 1'),
                  color: Colors.red,
                );
              }),
              Flexible(
                //fit: FlexFit.tight, // Take max space
                //fit: FlexFit.loose, // Default
                //flex: 2,
                child: Container(
                  width: 50,
                  // Ignore if in flex tight
                  //width: 300,
                  height: 100,
                  child: Text('Texte 2'),
                  color: Colors.blue,
                ),
              ),
              Flexible(
                //fit: FlexFit.tight,
                //flex: 2,
                child: Container(
                  //width: 100,
                  height: 300,
                  child: Text('Texte 3'),
                  color: Colors.yellow,
                ),
              ),
            ],
          ),
        ));
  }
}
