/// pages/firebase101.dart
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class DemoFirebase extends StatefulWidget {
  const DemoFirebase({Key? key}) : super(key: key);

  @override
  State<DemoFirebase> createState() => _DemoFirebaseState();
}

class _DemoFirebaseState extends State<DemoFirebase> {
  // TODO: Creer une document
  // Ajouter dans un document existant
  // Modifier un document existant
  // Trouver un document dans une collection de document
  // Effacer un document

  void _createAEntry() async {
    var _document = {
      "id": 1,
      "title": "Banana Bread",
      "description":
          "This is my favourite banana bread recipe! My mother taught me how to make this one warm summer afternoon.",
      "feeds_this_many": 4,
      "preparation_time": 60,
      "ingredients": [
        {"ingredient": "plain flour", "measure": "285g"},
        {
          "ingredient": "butter, softened",
          "measure": "110g + a bit extra for tin"
        },
        {"ingredient": "eggs, large", "measure": "2"},
        {"ingredient": "caster sugar", "measure": "225g"},
        {"ingredient": "chocolate chips", "measure": "1/2 cup"},
        {"ingredient": "salt", "measure": "1/2 tsp"},
        {"ingredient": "sugar", "measure": "1/2 cup"},
        {"ingredient": "bicarbonate of soda", "measure": "1 tsp"},
        {"ingredient": "ripe bananas, mashed", "measure": "4"},
        {"ingredient": "vanilla extract", "measure": "1 tsp"}
      ],
      "instructions": [
        {"instruction": "Preheat the oven to 180C/350F/Gas 4", "photo": null},
        {
          "instruction":
              "Sift the flour, bicarbonate of soda and salt into a large mixing bowl",
          "photo": null
        },
        {
          "instruction":
              "In a separate bowl, cream the butter and sugar together until light and fluffy",
          "photo": null
        },
        {
          "instruction":
              "Add the eggs, mashed bananas, buttermilk, and vanilla extract to the butter and sugar mixture and mix well. Fold in the flour mixture.",
          "photo": null
        },
        {
          "instruction":
              "Grease a 20cm x 12.5cm/8in x 5in loaf tin and pour the cake mixture into the tin.",
          "photo": null
        },
        {
          "instruction":
              "Transfer to the oven and bake for about an hour, or until well-risen and golden-brown.",
          "photo": null
        },
        {
          "instruction":
              "Remove from the oven and cool in the tin for a few minutes, then turn out onto a wire rack to cool completely before serving.",
          "photo": null
        }
      ],
      "cover_photo": null,
      "keywords": [
        "banana",
        "bread",
        "cake",
        "dessert",
        "sweet",
        "chocolate",
        "chip"
      ]
    };
    await FirebaseFirestore.instance.collection("base101").add(_document);

    _document = {
      "id": 2,
      "title": "Farmstead Tofu",
      "description":
          "This is a dish from rural Hunan province in China and has tofu, some flavouring, and lots of chili peppers.",
      "feeds_this_many": 2,
      "preparation_time": 45,
      "ingredients": [
        {"ingredient": "garlic", "measure": "1/2 bulb, slice"},
        {"ingredient": "ginger", "measure": "10g, sliced"},
        {"ingredient": "thai red chillis", "measure": "10, finely chopped"},
        {"ingredient": "large red chillis", "measure": "3, chopped"},
        {"ingredient": "Guilin hot pepper sauce", "measure": "1 tbsp"},
        {"ingredient": "bacon", "measure": "2-3 strips, chopped up"},
        {
          "ingredient": "green onions",
          "measure": "green parts of one bunch, coarsely chopped"
        },
        {"ingredient": "tofu", "measure": "1 500g pack, sliced"},
        {"ingredient": "salt", "measure": "1/4 tsp"},
        {"ingredient": "生抽", "measure": "1 tsp"}
      ],
      "instructions": [
        {"instruction": "Deep fry the tofu slices in hot oil", "photo": null},
        {"instruction": "Remove tofu from pot, put aside oil", "photo": null},
        {"instruction": "Add 2 tbsp oil on high heat.", "photo": null},
        {
          "instruction":
              "Add garlic, ginger, chillis, guilin hot papper sauce, bacon.",
          "photo": null
        },
        {
          "instruction": "Cook until garlic a bit soft, maybe 1 mninute.",
          "photo": null
        },
        {
          "instruction": "Add tofu and green onions. Fry 2 minutes",
          "photo": null
        },
        {"instruction": "Add salt, stir", "photo": null},
        {"instruction": "Add 生抽, stir", "photo": null},
        {"instruction": "Add 125ml of water, str", "photo": null},
        {
          "instruction":
              "Fry for another minute or two, serve over steamed rice.",
          "photo": null
        }
      ],
      "cover_photo": null,
      "keywords": ["农家豆腐", "tofu", "hunan", "spicy", "chinese"],
      "deleted": true
    };
    await FirebaseFirestore.instance.collection("base101").add(_document);

    _document = {
      "id": 3,
      "title": "Yangzhou Fried Rice",
      "description":
          "This is a popular fried rice from Fujian province with eggs, pork, and onions. It's quick and delicious.",
      "feeds_this_many": 2,
      "preparation_time": 20,
      "ingredients": [
        {"ingredient": "peanut oil", "measure": "2 tbsp"},
        {"ingredient": "ginger", "measure": "1 tbsp, peeled and grated"},
        {"ingredient": "eggs", "measure": "3, lightly beaten"},
        {"ingredient": "carrot", "measure": "1 medium, diced 1/4in cubes"},
        {
          "ingredient": "char siu pork (or ham or sausage)",
          "measure": "125g, diced"
        },
        {"ingredient": "shiitake mushrooms", "measure": "3, diced"},
        {"ingredient": "frozen peas", "measure": "1 cup"},
        {"ingredient": "day-old rice", "measure": "3 cups"},
        {"ingredient": "soy sauce", "measure": "2 tbsp"},
        {"ingredient": "salt + pepper", "measure": "to taste"},
        {"ingredient": "green onions", "measure": "2, sliced diagonally"}
      ],
      "instructions": [
        {
          "instruction": "Heat wok over high heat, add 1 tbsp oil",
          "photo": null
        },
        {
          "instruction": "Add eggs, scramble, then remove to plate",
          "photo": null
        },
        {
          "instruction": "Add 1 tbsp oi, add ginger, stir fry 1 minute.",
          "photo": null
        },
        {
          "instruction": "Add the carrots, stir fry 1 minute more",
          "photo": null
        },
        {
          "instruction": "Add the pork, mushrooms, cook 2 minutes",
          "photo": null
        },
        {
          "instruction":
              "Add the peas and cooked rice and toss it all together",
          "photo": null
        },
        {"instruction": "Add cooked egg back", "photo": null},
        {"instruction": "Add soy sauce, salt and pepper", "photo": null},
        {"instruction": "Garnish with green onions and serve", "photo": null}
      ],
      "cover_photo": null,
      "keywords": ["yangzhou", "fried rice", "char siu", "chaofan", "chinese"]
    };
    await FirebaseFirestore.instance
        .collection("base101")
        .doc(_document["id"].toString())
        .set(_document);
  }

  void _displayAllDocument() async {
    final _documents =
        await FirebaseFirestore.instance.collection("base101").get();

    print("Affichage de tous les documents");
    for (final doc in _documents.docs) {
      print(doc.data());
    }
  }

  void OverwriteDocument() async {
    await FirebaseFirestore.instance.collection("base101").doc("3").set(
      {"message": "Bonjour!"},
    );
  }

  void _modifyADocument() async {
    await FirebaseFirestore.instance.collection("base101").doc("3").update(
      {"source": "Modification d'une document de nouveau"},
    );
  }

  void _modifyADocumentFronQuery() async {
    final _documents = await FirebaseFirestore.instance
        .collection("base101")
        .where(
          "feeds_this_many",
          isEqualTo: 4,
        )
        .get();
    _documents.docs[0].reference.update(
      {"Trace": "Ce document fut modifie par query"},
    );
  }

  void _modifyADocumentFronQuery2() async {
    final _documents = await FirebaseFirestore.instance
        .collection("base101")
        .where(
          "feeds_this_many",
          isEqualTo: 4,
        )
        .get();
    _documents.docs[0].reference.update(
      {"Trace": "Ce document fut modifie par une autre query"},
    );
  }

  void _findADocument() async {
    final _documents = await FirebaseFirestore.instance
        .collection("base101")
        .where(
          "preparation_time",
          isEqualTo: 45,
        )
        .get();

    print("Affichage de document specifique:");
    for (final doc in _documents.docs) {
      print(doc.data());
    }
  }

  void _eraseADocument() async {
    await FirebaseFirestore.instance.collection("base101").doc("3").delete();
  }

  void _protectedADocument() async {
    var _document = {
      "Intro": "Ceci est protégé",
      "Secret": 42,
    };
    await FirebaseFirestore.instance
        .collection("protected")
        .doc()
        .set(_document);
  }

  void _protectedADocumentAdmin() async {
    var _document = {
      "Intro": "Ceci est protégé",
      "Secret": 42,
    };
    await FirebaseFirestore.instance
        .collection("protectedtoadmin")
        .doc()
        .set(_document);
  }

  void _partOfEpicerie() async {
    var _document = {
      "Intro": "fait partie du group",
      "Secret": 42,
    };
    await FirebaseFirestore.instance
        .collection("epiceries")
        .doc("tremblay")
        .set(_document);
  }

  _callAndCaptureError(Function callBack) {
    // Force l'appel de la fonction et capture l'erreur
    () async {
      try {
        await callBack();
      } on FirebaseException catch (e) {
        var message = "Un erreur s'est produite.";

        if (e.message != null) {
          message = e.message!;
        }

        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(message)));
      } catch (e) {
        print("Error: $e");
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("Error: $e"),
        ));
      }
    }();
  }

  @override
  Widget build(BuildContext context) {
    print("Current UID IS : ${FirebaseAuth.instance.currentUser!.uid}");
    return Scaffold(
      appBar: AppBar(
        title: const Text("Firestore 101"),
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () => _callAndCaptureError(_createAEntry),
              child: const Text("Create a document"),
            ),
            ElevatedButton(
              onPressed: () => _callAndCaptureError(_displayAllDocument),
              child: const Text("Display all document"),
            ),
            ElevatedButton(
              onPressed: () => _callAndCaptureError(OverwriteDocument),
              child: const Text("Ecrase un document avec ID"),
            ),
            ElevatedButton(
              onPressed: () => _callAndCaptureError(_modifyADocument),
              child: const Text("Modifier document avec ID"),
            ),
            ElevatedButton(
              onPressed: () => _callAndCaptureError(_modifyADocumentFronQuery),
              child: const Text("Modify a document Query"),
            ),
            ElevatedButton(
              onPressed: () => _callAndCaptureError(_modifyADocumentFronQuery2),
              child: const Text("Modify a document Query 2"),
            ),
            ElevatedButton(
              onPressed: () => _callAndCaptureError(_findADocument),
              child: const Text("Find a document"),
            ),
            ElevatedButton(
              onPressed: () => _callAndCaptureError(_eraseADocument),
              child: const Text("Erase a document"),
            ),
            ElevatedButton(
              onPressed: () => _callAndCaptureError(_protectedADocument),
              child: const Text("Create a  protected document"),
            ),
            ElevatedButton(
              onPressed: () => _callAndCaptureError(_protectedADocumentAdmin),
              child: const Text("Create a  protected to admin document"),
            ),
            ElevatedButton(
              onPressed: () => _callAndCaptureError(_partOfEpicerie),
              child: const Text("Create a doc for a group"),
            ),
          ],
        ),
      ),
    );
  }
}
