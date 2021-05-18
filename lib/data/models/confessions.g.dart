// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'confessions.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Confessions _$ConfessionsFromJson(Map<String, dynamic> json) {
  return Confessions(
    id: json['_id'] as String,
    userName: json['userName'] as String,
    confessionBy: json['confessionBy'] as String,
    confessionCatagory: json['confessionCatagory'] as String,
    confessionTitle: json['confessionTitle'] as String,
    confessionBody: json['confessionBody'] as String,
    date: json['date'] as String,
  );
}

Map<String, dynamic> _$ConfessionsToJson(Confessions instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'userName': instance.userName,
      'confessionBy': instance.confessionBy,
      'confessionCatagory': instance.confessionCatagory,
      'confessionTitle': instance.confessionTitle,
      'confessionBody': instance.confessionBody,
      'date': instance.date,
    };
