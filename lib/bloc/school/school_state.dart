part of 'school_bloc.dart';

abstract class SchoolState extends Equatable {
  const SchoolState();
  
  @override
  List<Object> get props => [];
}

class SchoolInitial extends SchoolState {}

class SchooltoriesLoaded extends SchoolState {
  final List<ConfessionEntity> school;

  SchooltoriesLoaded({
    this.school,
  });

  @override
  List<Object> get props => [school];
}

class SchooltoriesError extends SchoolState {
  final String error;

  SchooltoriesError({this.error});

  @override
  List<Object> get props => [error];
}