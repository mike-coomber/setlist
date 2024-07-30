class Song {
  final String id;
  final String artist;
  final String name;
  final int? duration;

  Song({
    required this.artist,
    required this.name,
    required this.id,
    this.duration,
  });
}
