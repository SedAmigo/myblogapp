part of 'lovestories_bloc.dart';

abstract class LovestoriesEvent extends Equatable {
  const LovestoriesEvent();

  @override
  List<Object> get props => [];
}

class LovStoriesLoaded extends LovestoriesEvent {}
