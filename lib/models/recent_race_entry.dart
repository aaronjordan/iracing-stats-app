class RecentRaceEntry {
  late final String seriesName;
  late final DateTime? sessionTime;
  late final int startPos;
  late final int finishPos;
  late final int iratingDiff;
  late final int incidentCount;
  late final String trackName;
  late final int trackId;
  late final int carId;
  late final List<String> liveryColors;

  RecentRaceEntry.fromResponseEntry(res) {
    seriesName = res["series_name"];
    if (res["session_start_time"]?.isNotEmpty) {
      sessionTime = DateTime.parse(res["session_start_time"]);
    }
    startPos = res["start_position"];
    finishPos = res["finish_position"];
    trackName = res["track"]?["track_name"];
    trackId = res["track"]?["track_id"];
    iratingDiff = res["newi_rating"] - res["oldi_rating"];
    incidentCount = res["incidents"];
    carId = res["car_id"];
    liveryColors = [
      res["livery"]?["color1"],
      res["livery"]?["color2"],
      res["livery"]?["color3"],
    ];
  }
}
