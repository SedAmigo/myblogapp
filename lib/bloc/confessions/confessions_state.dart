part of 'confessions_bloc.dart';

abstract class ConfessionsState extends Equatable {
  const ConfessionsState();
  
  @override
  List<Object> get props => [];
}

class ConfessionsInitial extends ConfessionsState {}

class ConfessiontoriesLoaded extends ConfessionsState {
  final List<ConfessionEntity> confession;

  ConfessiontoriesLoaded({
    this.confession,
  });

  @override
  List<Object> get props => [confession];
}

class ConfessiontoriesError extends ConfessionsState {
  final String error;

  ConfessiontoriesError({this.error});

  @override
  List<Object> get props => [error];
}