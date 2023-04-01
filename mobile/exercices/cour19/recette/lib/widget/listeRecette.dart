import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../pages/detail_recettes.dart';
import '../provider/recetteProvider.dart';
import 'fiveStarsRating.dart';

class ListeRecette extends StatelessWidget {
  const ListeRecette({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<recetteProvider>(builder: (context, recetteProvider, child) {
      return LayoutBuilder(builder: (context, BoxConstraints constraints) {
        return ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: recetteProvider.recette.length,
            itemBuilder: ((context, index) {
              return Dismissible(
                  background: Container(
                    alignment: Alignment.centerRight,
                    color: Colors.red,
                    child: const Icon(Icons.delete, color: Colors.white),
                  ),
                  key: UniqueKey(),
                  onDismissed: (direction) {
                    recetteProvider.removeAt(index);
                  },
                  child: Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(10.0),
                        width: constraints.maxWidth / 3,
                        child: TextButton(
                          child: Text(
                            recetteProvider.recette[index].title,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          onPressed: () {
                            Navigator.pushNamed(
                                context, DetailDeRecettePages.routeName,
                                arguments: recetteProvider.recette[index]);
                          },
                        ),
                      ),
                      fiveStarsRating(constraints.maxWidth / 1.5),
                    ],
                  ));
            }));
      });
    });
  }
}
