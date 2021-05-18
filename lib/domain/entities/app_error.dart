import 'package:equatable/equatable.dart';

class AppError extends Equatable {
  final AppErrprType appErrprType;

  const AppError(this.appErrprType);

  @override
  List<Object> get props => [appErrprType];
}

enum AppErrprType  {api , network}