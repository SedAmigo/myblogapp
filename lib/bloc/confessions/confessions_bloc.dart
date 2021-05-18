import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:blogapplication/domain/entities/confession_entity.dart';
import 'package:blogapplication/domain/entities/no_params.dart';
import 'package:blogapplication/domain/usercases/get_confessions.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

part 'confessions_event.dart';
part 'confessions_state.dart';

class ConfessionsBloc extends Bloc<ConfessionsEvent, ConfessionsState> {
  GetConfessionStory getConfessionStory;
  ConfessionsBloc({@required this.getConfessionStory})
      : super(ConfessionsInitial());

  @override
  Stream<ConfessionsState> mapEventToState(
    ConfessionsEvent event,
  ) async* {
    if (event is ConfessionLadedEvent) {
      final confessionEither = await getConfessionStory(NoParams());
      yield confessionEither.fold(
        (l) => ConfessiontoriesError(),
        (confession) => ConfessiontoriesLoaded(confession: confession),
      );
    }
  }
}
