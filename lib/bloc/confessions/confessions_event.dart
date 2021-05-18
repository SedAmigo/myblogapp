part of 'confessions_bloc.dart';

abstract class ConfessionsEvent extends Equatable {
  const ConfessionsEvent();

  @override
  List<Object> get props => [];
}

class ConfessionLadedEvent extends ConfessionsEvent {}
