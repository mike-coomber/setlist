import 'package:json_annotation/json_annotation.dart';
import 'package:setlist/features/setlist_editor/data/models/setlist_event_model.dart';
import 'package:setlist/features/setlist_editor/domain/entities/setlist.dart';

part 'setlist_model.g.dart';

@JsonSerializable(explicitToJson: true)
class SetlistModel implements Setlist {
  @override
  final String id;

  @override
  final String name;

  @override
  final List<SetlistEventModel> events;

  SetlistModel({
    required this.id,
    required this.name,
    required this.events,
  });

  factory SetlistModel.fromJson(Map<String, dynamic> json) => _$SetlistModelFromJson(json);

  Map<String, dynamic> toJson() => _$SetlistModelToJson(this);
}
