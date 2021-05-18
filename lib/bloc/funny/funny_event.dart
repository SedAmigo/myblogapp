part of 'funny_bloc.dart';

abstract class FunnyEvent extends Equatable {
  const FunnyEvent();

  @override
  List<Object> get props => [];
}

class FunnyStoryLoaded extends FunnyEvent {}
