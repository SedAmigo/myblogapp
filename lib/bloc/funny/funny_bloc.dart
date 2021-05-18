import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:blogapplication/domain/entities/confession_entity.dart';
import 'package:blogapplication/domain/entities/no_params.dart';
import 'package:blogapplication/domain/usercases/get_funnystories.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

part 'funny_event.dart';
part 'funny_state.dart';

class FunnyBloc extends Bloc<FunnyEvent, FunnyState> {
  final GetFunnyStory getFunnyStory;
  FunnyBloc({@required this.getFunnyStory}) : super(FunnyInitial());

  @override
  Stream<FunnyState> mapEventToState(
    FunnyEvent event,
  ) async* {
    if (event is FunnyStoryLoaded) {
      final funnyEither = await getFunnyStory(NoParams());
      yield funnyEither.fold(
        (l) => FunnytoriesError(),
        (funny) => FunnytoriesLoaded(funny: funny),
      );
    }
  }
}
