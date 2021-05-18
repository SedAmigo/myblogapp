import 'package:blogapplication/bloc/User/user_bloc.dart';
import 'package:blogapplication/bloc/confessions/confessions_bloc.dart';
import 'package:blogapplication/bloc/funny/funny_bloc.dart';
import 'package:blogapplication/bloc/lovestories/lovestories_bloc.dart';
import 'package:blogapplication/bloc/motivation/motivation_bloc.dart';
import 'package:blogapplication/bloc/random_thoughts/randomtoughts_bloc.dart';
import 'package:blogapplication/bloc/school/school_bloc.dart';
import 'package:blogapplication/data/core/api_client.dart';
import 'package:blogapplication/data/network/services.dart';
import 'package:blogapplication/data/repository/api_repository_imple.dart';
import 'package:blogapplication/domain/repository/api_repository.dart';
import 'package:blogapplication/domain/usercases/get_confessions.dart';
import 'package:blogapplication/domain/usercases/get_funnystories.dart';
import 'package:blogapplication/domain/usercases/get_lovestories.dart';
import 'package:blogapplication/domain/usercases/get_motivaton.dart';
import 'package:blogapplication/domain/usercases/get_random.dart';
import 'package:blogapplication/domain/usercases/get_school.dart';
import 'package:blogapplication/domain/usercases/get_user.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart';

final GetIt inject = GetIt.instance;

Future init() async {
  inject.registerLazySingleton<Client>(() => Client());

  inject.registerLazySingleton<ApiClient>(() => ApiClient(inject()));

  inject.registerLazySingleton<RemoteDataSource>(
      () => RemoteDataSourceImpl(inject()));

  inject.registerLazySingleton<ApiRepository>(
    () => ApiRepositoryImpl(
      inject(),
    ),
  );

  inject.registerLazySingleton<GetLoveStory>(() => GetLoveStory(inject()));

  inject.registerLazySingleton<GetRandomStory>(() => GetRandomStory(inject()));

  inject.registerLazySingleton<GetFunnyStory>(() => GetFunnyStory(inject()));

  inject.registerLazySingleton<GetConfessionStory>(
      () => GetConfessionStory(inject()));

  inject.registerLazySingleton<GetSchoolStory>(() => GetSchoolStory(inject()));

  inject.registerLazySingleton<GetMotivationStory>(
      () => GetMotivationStory(inject()));

  inject.registerLazySingleton<GetUserStory>(() => GetUserStory(inject()));

  inject.registerFactory(() => LovestoriesBloc(getLoveStory: inject()));

  inject.registerFactory(() => FunnyBloc(getFunnyStory: inject()));

  inject.registerFactory(() => ConfessionsBloc(getConfessionStory: inject()));

  inject.registerFactory(() => RandomtoughtsBloc(randomThoughts: inject()));

  inject.registerFactory(() => SchoolBloc(schoolStory: inject()));

  inject.registerFactory(() => MotivationBloc(getMotivationStory: inject()));

  inject.registerFactory(() => UserBloc(getUserStory: inject()));
}
