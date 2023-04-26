import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recette/pages/add_recettes.dart';
import 'package:recette/provider/tokenProvider.dart';

import '../provider/recetteProvider.dart';
import '../widget/listeRecette.dart';

class ListeRecettePage extends StatelessWidget {
  static const routeName = "home";

  const ListeRecettePage({super.key});

  @override
  Widget build(BuildContext context) {
    final token = Provider.of<TokenProvider>(context, listen: false);
    return FutureBuilder(
        future:
            Provider.of<recetteProvider>(context, listen: false).loadRecettes(),
        builder: (context, snapshot) {
          if (snapshot.connectionState != ConnectionState.done)
            return Scaffold(
                body: const Center(child: CircularProgressIndicator()),
                bottomNavigationBar: BottomAppBar(
                  child: Consumer<TokenProvider>(
                      builder: (context, tokenProvider, child) {
                    return child = tokenProvider.tokenExiste()
                        ? Container(
                            child: Text(
                              'Token fonctionnelle',
                              textAlign: TextAlign.center,
                            ),
                            color: Colors.green,
                          )
                        : Container(
                            child: Text(
                              'Token non fonctionnelle',
                              textAlign: TextAlign.center,
                            ),
                            color: Colors.red,
                          );
                  }),
                ));
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
        });
  }
}
