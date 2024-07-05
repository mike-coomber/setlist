import 'package:json_annotation/json_annotation.dart';
import 'package:setlist/features/dashboard/domain/entities/band.dart';

part 'band_model.g.dart';

@JsonSerializable()
class BandModel implements Band {
  @override
  final List<String> membershipIds;

  @override
  final String name;

  BandModel({required this.membershipIds, required this.name});

  factory BandModel.fromJson(Map<String, dynamic> json) => _$BandModelFromJson(json);

  Map<String, dynamic> toJson() => _$BandModelToJson(this);
}
