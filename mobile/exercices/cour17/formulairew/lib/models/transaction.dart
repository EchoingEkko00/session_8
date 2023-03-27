import 'package:flutter/material.dart';

class Transaction {
  final String description;
  final double cout;
  late final DateTime date;

  Transaction(this.description, this.cout) {
    // Sauvegarde la date de transaction.
    date = DateTime.now();
  }
}
