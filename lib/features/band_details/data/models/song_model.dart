import 'package:json_annotation/json_annotation.dart';
import 'package:setlist/features/band_details/domain/entities/song.dart';

part 'song_model.g.dart';

@JsonSerializable()
class SongModel implements Song {
  SongModel({
    required this.id,
    required this.name,
    required this.artist,
    this.duration,
  });

  @override
  final String id;

  @override
  final String name;

  @override
  final String artist;

  @override
  final int? duration;

  factory SongModel.fromEntity(Song entity) {
    return SongModel(
      id: entity.id,
      name: entity.name,
      artist: entity.artist,
      duration: entity.duration,
    );
  }

  factory SongModel.fromJson(Map<String, dynamic> json) => _$SongModelFromJson(json);

  Map<String, dynamic> toJson() => _$SongModelToJson(this);
}
