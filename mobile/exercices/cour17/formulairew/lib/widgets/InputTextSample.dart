/// widgets/inputTextsample.dart
import 'package:flutter/material.dart';
import 'package:formulairew/provider/providerTransact.dart';
import 'package:provider/provider.dart';

import '../models/transaction.dart';

class InputTextSample extends StatefulWidget {
  const InputTextSample({Key? key}) : super(key: key);

  @override
  State<InputTextSample> createState() => _InputTextSampleState();
}

class _InputTextSampleState extends State<InputTextSample> with ChangeNotifier {
  final descriptionController = TextEditingController();
  final montantController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    descriptionController.dispose();
    montantController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final descriptionController = TextEditingController();
    final montantController = TextEditingController();
    final mesTransactions = Provider.of<MesTransacts>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Card(
          margin: EdgeInsets.all(10),
          child: Column(children: [
            TextField(
              decoration: InputDecoration(labelText: 'Description'),
              controller: descriptionController,
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Couts'),
              controller: montantController,
            ),
          ]),
        ),
        ElevatedButton(
            onPressed: () {
              mesTransactions.addTransact(descriptionController.text,
                  double.parse(montantController.text));
              descriptionController.clear();
              montantController.clear();
            },
            child: Text("Ajouter")),
        Expanded(
          child: ListView.builder(
            itemCount: mesTransactions.length,
            itemBuilder: (context, index) {
              return ListTile(
                leading: CircleAvatar(
                  child: FittedBox(
                      child: Text(
                          "\$${mesTransactions.mesTransactions[index].cout.toStringAsFixed(2)}")),
                ),
                title: Text(
                    "${mesTransactions.mesTransactions[index].description}"),
                subtitle:
                    Text("${mesTransactions.mesTransactions[index].date}"),
              );
            },
          ),
        ),
      ],
    );
  }

  bool checkIfEmpty() {
    if (descriptionController.text.isNotEmpty ||
        montantController.text.isNotEmpty) {
      return false;
    } else {
      return true;
    }
  }
}
