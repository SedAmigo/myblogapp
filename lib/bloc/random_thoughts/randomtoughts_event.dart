part of 'randomtoughts_bloc.dart';

abstract class RandomtoughtsEvent extends Equatable {
  const RandomtoughtsEvent();

  @override
  List<Object> get props => [];
}

class RandomThoughtsLoadedEvent extends RandomtoughtsEvent {}