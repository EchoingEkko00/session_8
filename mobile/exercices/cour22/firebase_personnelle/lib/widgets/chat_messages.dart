import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Messages extends StatelessWidget {
  const Messages({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance
          .collection("messages")
          .orderBy("messageDateTime", descending: true)
          .snapshots(),
      builder: (ctx, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        // Didier expliquer comment trouver le casting...
        final myData = snapshot.data as QuerySnapshot<Map<String, dynamic>>;

        return ListView.builder(
          reverse: true,
          itemCount: myData.docs.length,
          itemBuilder: (context, index) {
            if (myData.docs[index].data().containsKey("texte") == false) {
              return const Text("Pas de texte");
            }
            return Text(myData.docs[index]["texte"]);
          },
        );
      },
    );
  }
}
