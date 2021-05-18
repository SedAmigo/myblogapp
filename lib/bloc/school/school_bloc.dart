import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:blogapplication/domain/entities/confession_entity.dart';
import 'package:blogapplication/domain/entities/no_params.dart';
import 'package:blogapplication/domain/usercases/get_school.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

part 'school_event.dart';
part 'school_state.dart';

class SchoolBloc extends Bloc<SchoolEvent, SchoolState> {
  final GetSchoolStory schoolStory;
  SchoolBloc({@required this.schoolStory}) : super(SchoolInitial());

  @override
  Stream<SchoolState> mapEventToState(
    SchoolEvent event,
  ) async* {
    if (event is SchoolLoadedEvent) {
      final schoolEither = await schoolStory(NoParams());
      yield schoolEither.fold(
        (l) => SchooltoriesError(),
        (random) => SchooltoriesLoaded(school: random),
      );
    }
  }
}
