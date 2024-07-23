enum SetlistEventType { song, breakEvent }

class SetlistEvent {
  final String name;
  final SetlistEventType type;
  final int length;
  final String notes;
  final String? songId;

  SetlistEvent({
    required this.name,
    required this.type,
    required this.length,
    required this.notes,
    required this.songId,
  });
}
