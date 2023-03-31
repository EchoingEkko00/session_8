class Ingredient {
  final String ingredient;
  final String measure;

  Ingredient({
    required this.ingredient,
    required this.measure,
  });
}

class Instruction {
  final String instruction;
  final String photoURL;

  Instruction({
    required this.instruction,
    required this.photoURL,
  });
}

// Commentaire

class Recette {
  final String id;
  final String title;
  final String description;
  final int feeds_this_many; // # ppl
  final int preparation_time; // minutes
  final List<Ingredient> ingredients;
  final List<Instruction> instructions;
  final String cover_photo;
  final List<String> keywords;
  final String date_added;

  Recette({
    required this.id,
    required this.title,
    required this.description,
    required this.feeds_this_many,
    required this.preparation_time,
    required this.ingredients,
    required this.instructions,
    required this.cover_photo,
    required this.keywords,
    required this.date_added,
  });
}
