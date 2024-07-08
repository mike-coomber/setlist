// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'band_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BandModel _$BandModelFromJson(Map<String, dynamic> json) => BandModel(
      id: json['id'] as String,
      name: json['name'] as String,
      memberships: (json['memberships'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$BandModelToJson(BandModel instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'memberships': instance.memberships,
    };
