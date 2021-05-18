import 'package:blogapplication/domain/entities/confession_entity.dart';
import 'package:json_annotation/json_annotation.dart';
part 'confessions.g.dart';

@JsonSerializable()
class Confessions extends ConfessionEntity {
  @JsonKey(name: '_id')
  final String id;
  final String userName;
  final String confessionBy;
  final String confessionCatagory;
  final String confessionTitle;
  final String confessionBody;
  final String date;

  Confessions({
    this.id,
    this.userName,
    this.confessionBy,
    this.confessionCatagory,
    this.confessionTitle,
    this.confessionBody,
    this.date,
  }) : super(
          id: id,
          userName: userName,
          confessionBy: confessionBy,
          confessionCatagory: confessionCatagory,
          confessionTitle: confessionTitle,
          confessionBody: confessionBody,
          date: date,
        );

  factory Confessions.fromJson(Map<String, dynamic> json) =>
      _$ConfessionsFromJson(json);

  Map<String, dynamic> toJson() => _$ConfessionsToJson(this);
}
