class SetlistEvent {
  final String name;
  int order;
  final int length;
  String notes;
  final String? songId;

  SetlistEvent({
    required this.name,
    required this.order,
    required this.length,
    required this.notes,
    required this.songId,
  });
}
