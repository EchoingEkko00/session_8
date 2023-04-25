/// itemdemaliste.dart
import 'dart:math';

import 'package:flutter/material.dart';

class ItemDeMaListe extends StatefulWidget {
  final String _item;
  final int _itemIndex;
  const ItemDeMaListe(this._item, this._itemIndex, {Key? key})
      : super(key: key);

  @override
  State<ItemDeMaListe> createState() => _ItemDeMaListeState();
}

class _ItemDeMaListeState extends State<ItemDeMaListe> {
  late final Color _itemColor;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    const _couleurs = const [
      Colors.red,
      Colors.blue,
      Colors.orange,
      Colors.black,
      Colors.green,
    ];

    _itemColor = _couleurs[Random().nextInt(_couleurs.length)];
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text("${widget._item}"),
      subtitle: Text("This is a subtitle for ${widget._item}"),
      leading: CircleAvatar(
          backgroundColor: _itemColor,
          child: Text(widget._itemIndex.toString())),
    );
  }
}
