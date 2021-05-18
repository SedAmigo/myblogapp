import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:blogapplication/domain/entities/confession_entity.dart';
import 'package:blogapplication/domain/entities/no_params.dart';
import 'package:blogapplication/domain/usercases/get_motivaton.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

part 'motivation_event.dart';
part 'motivation_state.dart';

class MotivationBloc extends Bloc<MotivationEvent, MotivationState> {
  final GetMotivationStory getMotivationStory;
  MotivationBloc({@required this.getMotivationStory})
      : super(MotivationInitial());

  @override
  Stream<MotivationState> mapEventToState(
    MotivationEvent event,
  ) async* {
    if (event is MotivationLoadedEvent) {
      final motivationEither = await getMotivationStory(NoParams());
      yield motivationEither.fold(
        (l) => MotivationtoriesError(),
        (random) => MotivationtoriesLoaded(motivation: random),
      );
    }
  }
}
