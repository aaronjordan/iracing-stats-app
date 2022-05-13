import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../modules/authenticated_home.dart';
import '../providers/authentication.dart';
import '../modules/unauthenticated_home.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authState = context.watch<AuthenticationProvider>();
    return authState.loginStatus ? AuthenticatedHome() : UnauthenticatedHome();
  }
}
