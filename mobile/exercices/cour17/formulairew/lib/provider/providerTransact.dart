import 'package:flutter/material.dart';

import '../models/transaction.dart';

class MesTransacts with ChangeNotifier {
  final List<Transaction> mesTransactions = [];

  void addTransact(String desc, double cout) {
    mesTransactions.add(Transaction(desc, cout));
    notifyListeners();
  }

  int get length => mesTransactions.length;
}
