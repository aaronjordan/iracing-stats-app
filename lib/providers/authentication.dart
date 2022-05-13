import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/material.dart';

import '../services/session.dart';

class AuthenticationProvider with ChangeNotifier {
  static List<Function> _logoutFunctionInstances = [];

  bool _isLoggedIn = true;
  bool get loginStatus => _isLoggedIn;
  String _email = "";
  String get email => _isLoggedIn ? _email : "";

  AuthenticationProvider() {
    _readAuthTokenFromFile();
    _logoutFunctionInstances.add(onLogout);
  }

  void _readAuthTokenFromFile() async {
    try {
      final documents = await getApplicationDocumentsDirectory();
      final file = File("${documents.path}/authorization.txt");
      if (file.existsSync()) {
        final authToken = await file.readAsString();
        Session.updateAuthorizationWithString(authToken);
        _isLoggedIn = true;
      }
    } catch (e) {}
  }

  static void _deleteAuthTokenFile() async {
    try {
      final documents = await getApplicationDocumentsDirectory();
      final file = File("${documents.path}/authorization.txt");
      if (file.existsSync()) {
        await file.delete();
      }
    } catch (e) {}
  }

  void onLoginSuccessful({String? email}) {
    _isLoggedIn = true;
    if (email != null) _email = email;
    notifyListeners();
  }

  void onLogout() {
    _isLoggedIn = false;
    _deleteAuthTokenFile();
    notifyListeners();
  }

  static void logoutAll() {
    for (var logoutFn in _logoutFunctionInstances) {
      logoutFn();
    }
  }
}
