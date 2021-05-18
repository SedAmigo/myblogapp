part of 'funny_bloc.dart';

abstract class FunnyState extends Equatable {
  const FunnyState();
  
  @override
  List<Object> get props => [];
}

class FunnyInitial extends FunnyState {}

class FunnytoriesLoaded extends FunnyState {
  final List<ConfessionEntity> funny;

  FunnytoriesLoaded({
    this.funny,
  });

  @override
  List<Object> get props => [funny];
}

class FunnytoriesError extends FunnyState {
  final String error;

  FunnytoriesError({this.error});

  @override
  List<Object> get props => [error];
}