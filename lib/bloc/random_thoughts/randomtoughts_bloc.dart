import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:blogapplication/domain/entities/confession_entity.dart';
import 'package:blogapplication/domain/entities/no_params.dart';
import 'package:blogapplication/domain/usercases/get_random.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

part 'randomtoughts_event.dart';
part 'randomtoughts_state.dart';

class RandomtoughtsBloc extends Bloc<RandomtoughtsEvent, RandomtoughtsState> {
  final GetRandomStory randomThoughts;
  RandomtoughtsBloc({@required this.randomThoughts})
      : super(RandomtoughtsInitial());

  @override
  Stream<RandomtoughtsState> mapEventToState(
    RandomtoughtsEvent event,
  ) async* {
    if (event is RandomThoughtsLoadedEvent) {
      final randomEither = await randomThoughts(NoParams());
      yield randomEither.fold(
        (l) => RandomtoriesError(),
        (random) => RandomtoriesLoaded(random: random),
      );
    }
  }
}
