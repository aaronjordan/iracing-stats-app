import 'dart:convert';

class LoginFormEntry {
  final String _username;
  final String _password;

  String toHttpBody() {
    return jsonEncode({
      "email": _username,
      "password": _password,
    });
  }

  const LoginFormEntry(
    this._username,
    this._password,
  );
}
