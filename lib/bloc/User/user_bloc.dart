import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:blogapplication/domain/entities/confession_entity.dart';
import 'package:blogapplication/domain/entities/no_params.dart';
import 'package:blogapplication/domain/usercases/get_user.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final GetUserStory getUserStory;
  UserBloc({@required this.getUserStory}) : super(UserInitial());

  @override
  Stream<UserState> mapEventToState(
    UserEvent event,
  ) async* {
    if(event is UserLoadedEvent){
      final schoolEither = await getUserStory(NoParams());
      yield schoolEither.fold(
        (l) => UsertoriesError(),
        (random) => UsertoriesLoaded(user: random),
      );
    }
  }
}
