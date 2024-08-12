// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'setlist_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SetlistModel _$SetlistModelFromJson(Map<String, dynamic> json) => SetlistModel(
      id: json['id'] as String,
      name: json['name'] as String,
      events: (json['events'] as List<dynamic>)
          .map((e) => SetlistEventModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SetlistModelToJson(SetlistModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'events': instance.events.map((e) => e.toJson()).toList(),
    };
