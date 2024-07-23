// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'setlist_event_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SetlistEventModel _$SetlistEventModelFromJson(Map<String, dynamic> json) =>
    SetlistEventModel(
      name: json['name'] as String,
      length: (json['length'] as num).toInt(),
      notes: json['notes'] as String,
      songId: json['songId'] as String?,
    );

Map<String, dynamic> _$SetlistEventModelToJson(SetlistEventModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'length': instance.length,
      'notes': instance.notes,
      'songId': instance.songId,
    };
