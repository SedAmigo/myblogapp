part of 'motivation_bloc.dart';

abstract class MotivationState extends Equatable {
  const MotivationState();
  
  @override
  List<Object> get props => [];
}

class MotivationInitial extends MotivationState {}

class MotivationtoriesLoaded extends MotivationState {
  final List<ConfessionEntity> motivation;

  MotivationtoriesLoaded({
    this.motivation,
  });

  @override
  List<Object> get props => [motivation];
}

class MotivationtoriesError extends MotivationState {
  final String error;

  MotivationtoriesError({this.error});

  @override
  List<Object> get props => [error];
}