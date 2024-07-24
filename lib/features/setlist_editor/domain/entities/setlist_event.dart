class SetlistEvent {
  final String name;
  final int order;
  final int length;
  final String notes;
  final String? songId;

  SetlistEvent({
    required this.name,
    required this.order,
    required this.length,
    required this.notes,
    required this.songId,
  });
}
