import 'package:flutter/material.dart';

import '../../models/recent_race_entry.dart';
import '../../services/data_service.dart';
import 'race_summary_tile.dart';

class RecentRacesList extends StatefulWidget {
  const RecentRacesList({Key? key}) : super(key: key);

  @override
  State<RecentRacesList> createState() => _RecentRacesListState();
}

class _RecentRacesListState extends State<RecentRacesList> {
  List<dynamic>? recentRaces;
  bool hasError = false;

  @override
  void initState() {
    getRecentRaces().then((res) {
      if (res.data != null && mounted) {
        setState(() {
          recentRaces = res.data['races'];
        });
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (recentRaces == null) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    return ListView.builder(
      // scrollDirection: Axis.vertical,
      itemBuilder: (context, index) {
        return RaceSummaryTile(
          race: RecentRaceEntry.fromResponseEntry(recentRaces![index]),
        );
      },
      itemCount: recentRaces!.length,
    );
  }
}
