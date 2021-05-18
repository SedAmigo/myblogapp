import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:blogapplication/domain/entities/confession_entity.dart';
import 'package:blogapplication/domain/entities/no_params.dart';
import 'package:blogapplication/domain/usercases/get_lovestories.dart';

import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

part 'lovestories_event.dart';
part 'lovestories_state.dart';

class LovestoriesBloc extends Bloc<LovestoriesEvent, LovestoriesState> {
  final GetLoveStory getLoveStory;
  LovestoriesBloc({@required this.getLoveStory}) : super(LovestoriesInitial());

  @override
  Stream<LovestoriesState> mapEventToState(
    LovestoriesEvent event,
  ) async* {
    if (event is LovStoriesLoaded) {
      final loveEither = await getLoveStory(NoParams());
      yield loveEither.fold(
        (l) => LovestoriesError(),
        (love) => LovestoriesLoaded(love: love),
      );
    }
  }
}
