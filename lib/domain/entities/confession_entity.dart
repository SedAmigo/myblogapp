import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

class ConfessionEntity extends Equatable {
  final String id;
  final String userName;
  final String confessionBy;
  final String confessionCatagory;
  final String confessionTitle;
  final String confessionBody;
  final String date;

  ConfessionEntity({
    @required this.id,
    @required this.userName,
    @required this.confessionBy,
    @required this.confessionCatagory,
    @required this.confessionTitle,
    @required this.confessionBody,
    @required this.date,
  });

  @override
  List<Object> get props => [id, confessionCatagory];

  @override
  bool get stringify => true;
}
