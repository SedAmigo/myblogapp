import 'package:blogapplication/data/models/confessions.dart';
import 'package:json_annotation/json_annotation.dart';
part 'confession_response.g.dart';

@JsonSerializable()
class ConfessionResponse {
  final List<Confessions> confessions;

  ConfessionResponse({this.confessions});

  factory ConfessionResponse.fromJson(Map<String, dynamic> json) =>
      _$ConfessionResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ConfessionResponseToJson(this);
}
