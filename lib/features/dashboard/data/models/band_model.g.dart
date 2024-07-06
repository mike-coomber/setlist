// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'band_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BandModel _$BandModelFromJson(Map<String, dynamic> json) => BandModel(
      memberships: (json['memberships'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      name: json['name'] as String,
    );

Map<String, dynamic> _$BandModelToJson(BandModel instance) => <String, dynamic>{
      'memberships': instance.memberships,
      'name': instance.name,
    };
