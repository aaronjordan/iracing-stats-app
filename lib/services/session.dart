import 'dart:io';
import 'package:http/http.dart';
import 'package:path_provider/path_provider.dart';

import '../providers/authentication.dart';

// persists cookies on requests, saves them to device
// so that they are not lost on app restarts
class Session with BaseClient {
  static final Client _client = Client();
  static String _authorization = "";

  Session() : super();

  static void _dropAuthorizationState() async {
    _authorization = "";
    AuthenticationProvider.logoutAll();
  }

  static void _saveAuthenticationToken() async {
    try {
      final documents = await getApplicationDocumentsDirectory();
      final file = File("${documents.path}/authorization.txt");
      await file.writeAsString(_authorization);
    } catch (e) {}
  }

  static void _updateAuthorization(Map<String, String> headers) {
    if (headers.containsKey("set-authorization")) {
      updateAuthorizationWithString(headers["set-authorization"]);
      _saveAuthenticationToken();
    }
  }

  static void updateAuthorizationWithString(String? authToken) {
    _authorization = authToken ?? "";
  }

  @override
  Future<StreamedResponse> send(BaseRequest request) {
    if (_authorization.isNotEmpty) {
      request.headers["authorization"] = _authorization;
    }

    return _client.send(request).then((streamedRes) {
      _updateAuthorization(streamedRes.headers);
      if (streamedRes.statusCode == 401) {
        _dropAuthorizationState();
      }
      return streamedRes;
    });
  }
}
