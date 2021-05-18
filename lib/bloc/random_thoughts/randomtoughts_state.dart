part of 'randomtoughts_bloc.dart';

abstract class RandomtoughtsState extends Equatable {
  const RandomtoughtsState();
  
  @override
  List<Object> get props => [];
}

class RandomtoughtsInitial extends RandomtoughtsState {}

class RandomtoriesLoaded extends RandomtoughtsState {
  final List<ConfessionEntity> random;

  RandomtoriesLoaded({
    this.random,
  });

  @override
  List<Object> get props => [random];
}

class RandomtoriesError extends RandomtoughtsState {
  final String error;

  RandomtoriesError({this.error});

  @override
  List<Object> get props => [error];
}