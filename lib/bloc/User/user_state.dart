part of 'user_bloc.dart';

abstract class UserState extends Equatable {
  const UserState();

  @override
  List<Object> get props => [];
}

class UserInitial extends UserState {}

class UsertoriesLoaded extends UserState {
  final List<ConfessionEntity> user;

  UsertoriesLoaded({
    this.user,
  });

  @override
  List<Object> get props => [user];
}

class UsertoriesError extends UserState {
  final String error;

  UsertoriesError({this.error});

  @override
  List<Object> get props => [error];
}
