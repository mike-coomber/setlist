// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'song_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SongModel _$SongModelFromJson(Map<String, dynamic> json) => SongModel(
      id: json['id'] as String,
      name: json['name'] as String,
      artist: json['artist'] as String,
      duration: (json['duration'] as num?)?.toInt(),
    );

Map<String, dynamic> _$SongModelToJson(SongModel instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'artist': instance.artist,
      'duration': instance.duration,
    };
