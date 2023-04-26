import 'package:chatal/firebase_options.dart';
import 'package:chatal/pages/chat_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'pages/auth_screen.dart';

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
              elevatedButtonTheme: ElevatedButtonThemeData(
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.yellow,
                  backgroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
              colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.green)
                  .copyWith(background: Colors.green),
            ),
            //home: ChatScreen(),
            home: StreamBuilder(
              stream: FirebaseAuth.instance.authStateChanges(),
              builder: (context, snapshot) {
                // Si le stream a des données nous avons une session
                if (snapshot.hasData) return ChatScreen();

                // Sinon pas de session valide
                return AuthScreen();
              },
            ));
      },
    );
  }
}
