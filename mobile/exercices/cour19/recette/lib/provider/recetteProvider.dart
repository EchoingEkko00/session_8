import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:math';
import 'package:http/http.dart' as http;
import '../models/recette.dart';
import '../widget/fiveStarsRating.dart';

class recetteProvider with ChangeNotifier {
  List<Recette> _recetteList = [];
  List<Recette> _removedRecetteList = [];

  List<Recette> get recette => _recetteList;

  recetteProvider() {
    loadRecettes();
  }

  loadRecettes() async {
    _recetteList.clear();
    final url = Uri.parse('https://cegep.fdtt.space/v1/recipes');
    try {
      var response = await http.get(url, headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'debugme': 'true',
      });
      // Process the response
      var jsonPayload = json.decode(utf8.decode(response.bodyBytes));

      for (num i = 0; i < jsonPayload['data'].length; i++) {
        final item = jsonPayload['data'][i];

        /* Working Expression */
        final List<Ingredient> ingredients = (item['ingredients'] as List)
            .map((e) =>
                Ingredient(ingredient: e['ingredient'], measure: e['measure']))
            .toList();

        final List<Instruction> instructions = (item['instructions'] as List)
            .map((e) => Instruction(
                  instruction: e['instruction'] == null ? '' : e['instruction'],
                  photoURL: e['photo'] == null ? '' : e['photo'],
                ))
            .toList();

        _recetteList.add(Recette(
          id: item['id'].toString(),
          title: item['title'],
          description: item['description'],
          feeds_this_many: item['feeds_this_many'],
          preparation_time: item['preparation_time'],
          ingredients: ingredients,
          instructions: instructions,
          cover_photo: item['cover_photo'] == null ? '' : item['cover_photo'],
          keywords:
              item['keywords'] == null ? [] : item['keywords'].cast<String>(),
          date_added: item['date_added'] == null ? '' : item['date_added'],
        ));
      }
    } on Exception catch (e) {
      print("Got error $e");
    }
    notifyListeners();
  }

  void removeAt(int index) {
    _removedRecetteList.add(_recetteList[index]);
    _recetteList.removeAt(index);
    notifyListeners();
  }

  Recette getRecetteByID(int id) {
    // Retourne la recette avec le ID
    // Si il n'y a pas de recette avec cet ID retourner un exception NoSuchRecipe
    final recette =
        _recetteList.where((element) => element.id == id.toString()).toList();

    if (recette.length == 0) {
      throw NoSuchRecipe;
    }

    return recette[0];
  }

  void addRecette() {
    if (_removedRecetteList.length == 0) {
      return;
    } else {
      _recetteList.add(_removedRecetteList[0]);
      _removedRecetteList.removeAt(0);
      notifyListeners();
    }
  }
}

class NoSuchRecipe implements Exception {}
