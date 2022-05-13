import 'package:flutter/material.dart';

import '../services/data_service.dart';
import '../settings/theme.dart';

class UnauthenticatedHome extends StatelessWidget {
  const UnauthenticatedHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("iRacing Mobile Stats"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text("Please log in"),
            const StandardSpacer(),
            OutlinedButton(
              onPressed: () {
                Navigator.pushNamed(context, "/login");
              },
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text("Login"),
              ),
            ),
            StandardSpacer(),
          ],
        ),
      ),
    );
  }
}
