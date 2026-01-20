String formatDuration(int milliseconds) {
  final duration = Duration(milliseconds: milliseconds);
  final minutes = duration.inMinutes;
  final seconds = duration.inSeconds % 60;

  return '$minutes:${seconds.toString().padLeft(2, '0')}';
}
