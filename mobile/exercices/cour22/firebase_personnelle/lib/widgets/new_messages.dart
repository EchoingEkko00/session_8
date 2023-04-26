import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class NewMessage extends StatefulWidget {
  const NewMessage({Key? key}) : super(key: key);

  @override
  State<NewMessage> createState() => _NewMessageState();
}

class _NewMessageState extends State<NewMessage> {
  final _messageController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _messageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8),
      padding: EdgeInsets.all(8),
      child: Row(children: [
        Expanded(
          child: TextField(
            controller: _messageController,
            decoration: InputDecoration(labelText: "Message à envoyer"),
          ),
        ),
        IconButton(
          onPressed: _messageController.text.trim().isEmpty
              ? null
              : () {
                  FocusScope.of(context).unfocus();
                  FirebaseFirestore.instance.collection("messages").add({
                    "texte": _messageController.text,
                    // Ici on pourrait ajouter d'autres éléments...
                    "messageDateTime": Timestamp.now(),
                  });
                  _messageController.text = "";
                },
          color: Theme.of(context).primaryColor,
          icon: Icon(Icons.send),
        ),
      ]),
    );
  }
}
