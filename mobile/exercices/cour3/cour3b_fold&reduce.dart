void main(List<String> args) {
  var mesChoses = {
    'premier': 'du texte',
    'deuxieme': 'd\'autre text',
  };

  print(mesChoses.runtimeType);

  var mesChoses2 = {
    'premier': 'du texte',
    'deuxieme': 'd\'autre text',
    'troisieme': 4,
  };

  print(mesChoses2.runtimeType);

  //
  Map<String, String> mesChoses3;

  print(mesChoses2.remove('troisieme')); // A
  print(mesChoses2.runtimeType);

  // mesChoses3 = mesChoses2 as Map<String, String>; // B
  mesChoses3 =
      mesChoses2.map((key, value) => MapEntry(key, value as String)); // C

  print(mesChoses3.runtimeType);
}
