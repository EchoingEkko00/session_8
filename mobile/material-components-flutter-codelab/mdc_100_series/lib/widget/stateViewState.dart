import 'package:flutter/material.dart';

class StateViewStateWidget extends StatelessWidget {
  final List<bool> etatsBoutons;
  final List<int> compteurBoutons;
  const StateViewStateWidget(this.etatsBoutons, this.compteurBoutons,
      {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("Widget stateViewState est reconstruit");
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          for (var i = 0; i < etatsBoutons.length; i++)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  "Switch ${i + 1}",
                ),
                Text(etatsBoutons[i].toString()),
                Text(compteurBoutons[i].toString()),
              ],
            ),
        ],
      ),
    );
  }
}
