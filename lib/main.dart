import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'settings/theme.dart';
import 'providers/authentication.dart';
import 'screens/home.dart';
import 'screens/login.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthenticationProvider())
      ],
      child: const App(),
    ),
  );
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'iRacing Stats Viewer',
      theme: appTheme,
      initialRoute: '/',
      routes: {
        '/': (context) => HomeScreen(),
        '/login': (context) => LoginScreen()
      },
    );
  }
}
