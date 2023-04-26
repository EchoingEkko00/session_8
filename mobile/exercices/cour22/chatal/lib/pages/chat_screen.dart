///pages/chat_screen.dart
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../widgets/chat_messages.dart';
import '../widgets/new_message.dart';
import 'firebase101.dart';

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
                DropdownMenuItem(
                  value: "rules101",
                  child: Row(
                    children: const [
                      Icon(
                        Icons.exit_to_app,
                        color: Colors.black,
                      ),
                      SizedBox(width: 8),
                      Text("Rules101"),
                    ],
                  ),
                ),
              ],
              onChanged: (item) {
                if (item == "logout") {
                  FirebaseAuth.instance.signOut();
                }
                if (item == "rules101") {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => DemoFirebase(),
                    ),
                  );
                }
              })
        ],
      ),
      body: Container(
          child: Column(
        children: [
          Expanded(
            child: Messages(),
          ),
          NewMessage(),
        ],
      )),
    );
  }
}
