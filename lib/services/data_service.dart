import '../models/forwarded_response.dart';
import '../settings/core.dart';
import 'session.dart';

abstract class _API {
  static const recentRaces =
      "${Core.backendHost}/data/stats/member_recent_races";
}

Future<ForwardResponse> getRecentRaces() async {
  final uri = Uri.parse(_API.recentRaces);
  final response = await Session().get(uri);
  return ForwardResponse.from(response);
}
