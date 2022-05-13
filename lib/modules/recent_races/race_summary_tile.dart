import 'package:flutter/material.dart';

import '../../models/recent_race_entry.dart';
import '../../settings/theme.dart';

class RaceSummaryTile extends StatelessWidget {
  final RecentRaceEntry race;

  const RaceSummaryTile({
    Key? key,
    required this.race,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          // Container(child: Text("Top content")),
          Padding(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  race.seriesName,
                  style: TextStyle(
                    fontSize: AppStyles.subtitleFontSize,
                    fontWeight: AppStyles.subtitleFontWeight,
                    color: AppStyles.primaryTextColor,
                  ),
                ),
                Divider(
                  height: 48.0,
                  color: AppStyles.primarySwatch[700],
                ),
                Center(
                  child: Text(
                    race.trackName,
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: AppStyles.subtitleFontSize * 0.65,
                      color: AppStyles.primarySwatch[400],
                    ),
                  ),
                ),
                StandardSpacer(multiplier: 0.5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Start: P${race.startPos}"),
                    Text("${race.iratingDiff} iRating"),
                  ],
                ),
                StandardSpacer(multiplier: 0.5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("Finish: P${race.finishPos}"),
                    Text("${race.incidentCount}x incs."),
                  ],
                ),
              ],
            ),
            padding: EdgeInsets.all(32.0),
          ),
        ],
      ),
      margin: EdgeInsets.symmetric(
        horizontal: 16.0,
        vertical: 8.0,
      ),
    );
  }
}
