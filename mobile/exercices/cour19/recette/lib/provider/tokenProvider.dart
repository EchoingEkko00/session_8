import 'dart:convert';
import 'dart:math';

import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';

class TokenProvider with ChangeNotifier {
  String? _token;
  final url = Uri.parse('https://cegep.fdtt.space/v1/token');

  Future<void> RecupereToken({username, password}) async {
    final response = await http.post(
      url,
      body: json.encode({
        'username': username,
        'password': password,
      }),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        // 'debugme': 'true',
      },
    );

    var jsonPayload = json.decode(utf8.decode(response.bodyBytes));

    if (jsonPayload['data'] != null) {
      _token = jsonPayload['data'];
      notifyListeners();
      print("Token: $_token");
    } else {
      _token = null;
      notifyListeners();
      print("Error: ${jsonPayload['error']}");
    }
  }

  bool tokenExiste() {
    return _token != null;
  }
}
