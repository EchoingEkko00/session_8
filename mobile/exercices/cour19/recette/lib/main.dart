import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recette/models/recette.dart';
import 'package:recette/pages/add_recettes.dart';
import 'package:recette/pages/detail_recettes.dart';
import 'package:recette/pages/exampleToken.dart';
import 'package:recette/pages/listeRecette.dart';
import 'package:recette/provider/recetteProvider.dart';
import 'package:recette/provider/tokenProvider.dart';
import 'package:recette/widget/fiveStarsRating.dart';
import 'package:recette/widget/listeRecette.dart';

void main() {
  runApp(const MainApp());
}

class RouteGenerator {
  // Juste un classe pour eviter de mettre une fonction global
  static Route<dynamic> generatedRoute(RouteSettings settings) {
    switch (settings.name) {
      case DetailDeRecettePages.routeName:
        return MaterialPageRoute(
            builder: (context) =>
                DetailDeRecettePages(settings.arguments as Recette));
      case AddRecettes.routeName:
        return MaterialPageRoute(builder: (context) => const AddRecettes());
      case ListeRecettePage.routeName:
        return MaterialPageRoute(
            builder: (context) => const ListeRecettePage());
      default:
        throw FormatException("Route Inconnue");
    }
  }
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider(create: (context) => recetteProvider()),
      ChangeNotifierProvider(create: (context) => TokenProvider()),
    ], child: const MonApplication());
  }
}

class MonApplication extends StatelessWidget {
  const MonApplication({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      onGenerateRoute: RouteGenerator.generatedRoute,
      title: 'Les recettes',
      home: ExampleTokenPage(),
    );
  }
}