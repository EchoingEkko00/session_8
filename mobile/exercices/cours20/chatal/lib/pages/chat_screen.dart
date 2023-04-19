///pages/chat_screen.dart
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Chat AL"),
        actions: [
          DropdownButton<String>(
              icon: Icon(
                Icons.more_vert,
                color: Theme.of(context).primaryIconTheme.color,
              ),
              items: [
                DropdownMenuItem(
                  value: "logout",
                  child: Row(
                    children: [
                      Icon(
                        Icons.exit_to_app,
                        color: Colors.black,
                      ),
                      SizedBox(width: 8),
                      Text("Logout"),
                    ],
                  ),
                ),
              ],
              onChanged: (item) {
                if (item == "logout") {
                  FirebaseAuth.instance.signOut();
                }
              })
        ],
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection("messages").snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) return CircularProgressIndicator();
          return ListView.builder(
            itemCount: (snapshot.data as QuerySnapshot<Map<String,dynamic>>).docs.length,
            itemBuilder: (context, index) {
             final item = (snapshot.data as QuerySnapshot<Map<String,dynamic>>).docs[index];
              if (item.data().containsKey("texte")) {
                return Text(item.data()["texte"]);
              }
              return Text("Pas de texte");
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          FirebaseFirestore.instance.collection("messages").add({
            "texte": "Hello World",
          });
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
