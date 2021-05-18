part of 'lovestories_bloc.dart';

abstract class LovestoriesState extends Equatable {
  const LovestoriesState();

  @override
  List<Object> get props => [];
}

class LovestoriesInitial extends LovestoriesState {}

class LovestoriesLoaded extends LovestoriesState {
  final List<ConfessionEntity> love;

  LovestoriesLoaded({
    this.love,
  });

  @override
  List<Object> get props => [love];
}

class LovestoriesError extends LovestoriesState {
  final String error;

  LovestoriesError({this.error});

  @override
  List<Object> get props => [error];
}
