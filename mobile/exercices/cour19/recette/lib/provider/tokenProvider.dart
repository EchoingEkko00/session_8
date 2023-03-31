import 'dart:convert';
import 'dart:math';

import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';

class TokenProvider with ChangeNotifier {
  String? _token;

  Future<void> RecupereToken({username, password}) {
    return Future<void>(
      () {},
    );
  }
}
