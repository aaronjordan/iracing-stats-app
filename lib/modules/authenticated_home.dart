import 'package:flutter/material.dart';

import '../services/data_service.dart';
import 'recent_races/recent_races_list.dart';

class AuthenticatedHome extends StatefulWidget {
  const AuthenticatedHome({Key? key}) : super(key: key);

  @override
  State<AuthenticatedHome> createState() => _AuthenticatedHomeState();
}

class _AuthenticatedHomeState extends State<AuthenticatedHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Recent Races"),
      ),
      body: RecentRacesList(),
    );
  }
}
