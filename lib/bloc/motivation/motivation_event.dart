part of 'motivation_bloc.dart';

abstract class MotivationEvent extends Equatable {
  const MotivationEvent();

  @override
  List<Object> get props => [];
}

class MotivationLoadedEvent extends MotivationEvent {}