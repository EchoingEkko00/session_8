import 'package:flutter/material.dart';
import 'package:recette/main.dart';
import 'package:recette/pages/listeRecette.dart';

class ExampleTokenPage extends StatefulWidget {
  const ExampleTokenPage({Key? key}) : super(key: key);

  static const String roueteName = "Demotoken";

  @override
  State<ExampleTokenPage> createState() => _ExampleTokenPageState();
}

class _ExampleTokenPageState extends State<ExampleTokenPage> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  var _token = "";

  @override
  void dispose() {
    super.dispose();
    _usernameController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
                onPressed: () {
                  Navigator.pushNamed(context, ListeRecettePage.routeName);
                },
                child: Text("Get Token")),
          ),
        ],
      ),
    );
  }
}
