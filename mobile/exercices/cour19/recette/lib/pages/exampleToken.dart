import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recette/main.dart';
import 'package:recette/pages/listeRecette.dart';

import '../provider/tokenProvider.dart';

class ExampleTokenPage extends StatefulWidget {
  const ExampleTokenPage({Key? key}) : super(key: key);

  static const String roueteName = "Demotoken";

  @override
  State<ExampleTokenPage> createState() => _ExampleTokenPageState();
}

class _ExampleTokenPageState extends State<ExampleTokenPage> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _usernameController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final token = Provider.of<TokenProvider>(context, listen: false);
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextFormField(
            decoration: InputDecoration(hintText: "Username"),
            controller: _usernameController,
          ),
          TextFormField(
            decoration: InputDecoration(hintText: "Password"),
            obscureText: true,
            controller: _passwordController,
          ),
          Container(
            width: double.infinity,
            child: ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.brown)),
                onPressed: () {
                  token.RecupereToken(
                      username: _usernameController.text,
                      password: _passwordController.text);
                  Navigator.pushNamed(context, ListeRecettePage.routeName);
                },
                child: Text("Get Token")),
          ),
        ],
      ),
    );
  }
}
