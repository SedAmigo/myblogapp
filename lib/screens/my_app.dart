import 'package:blogapplication/bloc/User/user_bloc.dart';
import 'package:blogapplication/bloc/confessions/confessions_bloc.dart';
import 'package:blogapplication/bloc/funny/funny_bloc.dart';
import 'package:blogapplication/bloc/lovestories/lovestories_bloc.dart';
import 'package:blogapplication/bloc/motivation/motivation_bloc.dart';
import 'package:blogapplication/bloc/random_thoughts/randomtoughts_bloc.dart';
import 'package:blogapplication/bloc/school/school_bloc.dart';
import 'package:blogapplication/di/get_it.dart';
import 'package:blogapplication/screens/authenticatonscreen/login.dart';
import 'package:blogapplication/screens/home/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/screenutil_init.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Widget page = Center(
    child: CircularProgressIndicator(),
  );
  LovestoriesBloc loveStoryBloc;
  FunnyBloc funnyBloc;
  ConfessionsBloc confessionsBloc;
  RandomtoughtsBloc randomtoughtsBloc;
  SchoolBloc schoolBloc;
  MotivationBloc motivationBloc;
  UserBloc userBloc;

  // @override
  void initState() {
    super.initState();
    loveStoryBloc = inject<LovestoriesBloc>();
    loveStoryBloc.add(LovStoriesLoaded());
    funnyBloc = inject<FunnyBloc>();
    funnyBloc.add(FunnyStoryLoaded());
    confessionsBloc = inject<ConfessionsBloc>();
    confessionsBloc.add(ConfessionLadedEvent());
    randomtoughtsBloc = inject<RandomtoughtsBloc>();
    randomtoughtsBloc.add(RandomThoughtsLoadedEvent());
    schoolBloc = inject<SchoolBloc>();
    schoolBloc.add(SchoolLoadedEvent());
    motivationBloc = inject<MotivationBloc>();
    motivationBloc.add(MotivationLoadedEvent());
    userBloc = inject<UserBloc>();
    userBloc.add(UserLoadedEvent());
    checkAuth();
  }

  void checkAuth() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('token');
    if (token != null) {
      setState(() {
        page = MyHomePage();
      });
    } else {
      setState(() {
        page = LoginScreen();
      });
    }
  }

  @override
  void dispose() {
    loveStoryBloc?.close();
    funnyBloc?.close();
    confessionsBloc?.close();
    randomtoughtsBloc?.close();
    schoolBloc?.close();
    motivationBloc?.close();
    userBloc?.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(414, 896),
      allowFontScaling: false,
      builder: () => MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => loveStoryBloc,
          ),
          BlocProvider(
            create: (context) => funnyBloc,
          ),
          BlocProvider(
            create: (context) => confessionsBloc,
          ),
          BlocProvider(
            create: (context) => randomtoughtsBloc,
          ),
          BlocProvider(
            create: (context) => schoolBloc,
          ),
          BlocProvider(
            create: (context) => motivationBloc,
          ),
          BlocProvider(
            create: (context) => userBloc,
          ),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: page,
        ),
      ),
    );
  }
}
