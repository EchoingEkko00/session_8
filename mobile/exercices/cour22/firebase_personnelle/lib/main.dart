import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_personnelle/pages/auth_screen.dart';
import 'package:flutter/material.dart';

import 'firebase_options.dart';
import '../pages/chat_screen.dart';

void main() async {
  // Pour permettre l'initialisation
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Firebase.initializeApp(),
      builder: (context, snapshot) {
        // Nous attendons l'initialisation
        if (snapshot.connectionState == ConnectionState.waiting)
          return CircularProgressIndicator();

        // Houston!!?
        if (snapshot.hasError)
          return MaterialApp(
            title: 'Flutter Demo',
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            home: Center(
              child: Text("PROBLEME!!!"),
            ),
          );

        // L'application peut démarrer
        return MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: AuthScreen(),
        );
      },
    );
  }
}
