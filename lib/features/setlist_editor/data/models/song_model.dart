import 'package:json_annotation/json_annotation.dart';
import 'package:setlist/features/setlist_editor/domain/entities/song.dart';

part 'song_model.g.dart';

@JsonSerializable()
class SongModel implements Song {
  SongModel({
    required this.name,
    required this.artist,
    required this.duration,
  });

  @override
  final String name;

  @override
  final String artist;

  @override
  final int duration;

  factory SongModel.fromEntity(Song entity) {
    return SongModel(
      name: entity.name,
      artist: entity.artist,
      duration: entity.duration,
    );
  }

  factory SongModel.fromJson(Map<String, dynamic> json) => _$SongModelFromJson(json);

  Map<String, dynamic> toJson() => _$SongModelToJson(this);
}
