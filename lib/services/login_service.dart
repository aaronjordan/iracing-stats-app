import '../models/forwarded_response.dart';
import '../models/login_form_entry.dart';
import '../settings/core.dart';
import './session.dart';

final authEndpoint = Uri.parse('${Core.backendHost}auth');

Future<ForwardResponse?> postAuthentication(LoginFormEntry userInfo) async {
  try {
    var response = await Session().post(
      authEndpoint,
      headers: {"Content-Type": "application/json"},
      body: userInfo.toHttpBody(),
    );
    return ForwardResponse.from(response);
  } catch (e) {
    return null;
  }
}
