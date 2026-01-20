class SongModel {
  final int id;
  final String title;
  final String artist;
  final String uri;
  final int albumId;
  final int duration;

  SongModel({
    required this.id,
    required this.title,
    required this.artist,
    required this.uri,
    required this.albumId,
    required this.duration,
  });
}
