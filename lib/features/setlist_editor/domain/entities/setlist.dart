import 'package:setlist/features/setlist_editor/domain/entities/setlist_event.dart';

class Setlist {
  final String id;
  final String name;
  final List<SetlistEvent> events;

  Setlist({
    required this.id,
    required this.events,
    required this.name,
  });
}
