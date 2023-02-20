void main() {
  Set<String> mesChoix = Set();

  mesChoix.add("musique");
  mesChoix.add("programmation");
  mesChoix.add("danse");
  mesChoix.add("dungeon");
  mesChoix.add("musique");
  mesChoix.add("mathematique");

  print(mesChoix);

  Set<String> mesPassions = Set();

  mesPassions.add("dungeon");
  mesPassions.add('programmation');
  print(mesPassions);
  print(
      "Mes passions sont parmis mes choix? ${mesChoix.containsAll(mesPassions)}");
  print("Ce qui me reste est ${mesChoix.difference(mesPassions)}");
}
