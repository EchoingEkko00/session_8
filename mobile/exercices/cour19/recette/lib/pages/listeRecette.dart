import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';
import 'package:recette/pages/add_recettes.dart';

import '../provider/recetteProvider.dart';
import '../widget/listeRecette.dart';

class ListeRecettePage extends StatelessWidget {
  static const routeName = "home";

  const ListeRecettePage({super.key});

  @override
  Widget build(BuildContext context) {
    final _recetteProvider = Provider.of<recetteProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
            'Recette de CAL : ${_recetteProvider.recette.length} recettes'),
        backgroundColor: Colors.brown,
      ),
      body: ListeRecette(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, AddRecettes.routeName);
        },
        child: const Icon(Icons.add),
        backgroundColor: Colors.brown,
      ),
    );
  }
}
