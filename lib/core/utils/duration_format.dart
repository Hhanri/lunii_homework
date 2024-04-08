String formatDuration(Duration duration) {
  final hours = duration.inHours;
  final minutes = duration.inMinutes - hours * 60;
  return "${hours}h$minutes";
}