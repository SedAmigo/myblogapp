// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'confession_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ConfessionResponse _$ConfessionResponseFromJson(Map<String, dynamic> json) {
  return ConfessionResponse(
    confessions: (json['confessions'] as List)
        ?.map((e) =>
            e == null ? null : Confessions.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$ConfessionResponseToJson(ConfessionResponse instance) =>
    <String, dynamic>{
      'confessions': instance.confessions,
    };
