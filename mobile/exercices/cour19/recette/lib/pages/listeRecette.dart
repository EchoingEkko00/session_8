import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recette/pages/add_recettes.dart';

import '../provider/recetteProvider.dart';
import '../widget/listeRecette.dart';

class ListeRecettePage extends StatelessWidget {
  static const routeName = "home";

  const ListeRecettePage({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future:
            Provider.of<recetteProvider>(context, listen: false).loadRecettes(),
        builder: (context, snapshot) {
          if (snapshot.connectionState != ConnectionState.done)
            return const Scaffold(body: Center(child: CircularProgressIndicator()));
            return Scaffold(
              appBar: AppBar(
                title: Consumer<recetteProvider>(
                    builder: (context, recetteProvider, child) {
                  return Text(
                      'Recette de CAL : ${recetteProvider.recette.length} recettes');
                }),
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
    );
  }
}
