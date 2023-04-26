import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:recette/models/recette.dart';

class DetailDeRecettePages extends StatelessWidget {
  static const routeName = 'details';
  final Recette arg;
  const DetailDeRecettePages(this.arg, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail de : ' + arg.title),
        backgroundColor: Colors.brown,
      ),
      body: Center(
        child: Text(arg.description),
      ),
    );
  }
}
