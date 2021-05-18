import 'package:blogapplication/bloc/User/user_bloc.dart';
import 'package:blogapplication/bloc/confessions/confessions_bloc.dart';
import 'package:blogapplication/bloc/funny/funny_bloc.dart';
import 'package:blogapplication/bloc/lovestories/lovestories_bloc.dart';
import 'package:blogapplication/bloc/motivation/motivation_bloc.dart';
import 'package:blogapplication/bloc/random_thoughts/randomtoughts_bloc.dart';
import 'package:blogapplication/bloc/school/school_bloc.dart';
import 'package:blogapplication/screens/authenticatonscreen/login.dart';
import 'package:blogapplication/screens/stories/post_stories.dart';
import 'package:blogapplication/screens/stories/stories.dart';
import 'package:blogapplication/screens/stories/user_Screen.dart';
import 'package:blogapplication/utils/themes/app_colors.dart';
import 'package:blogapplication/widgets/circular_button.dart';
import 'package:blogapplication/widgets/errorWIdget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:blogapplication/utils/extensions/size_extension.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  AnimationController animationController;
  Animation degOneTranslationAnimation,
      degTwoTranslationAnimation,
      degThreeTranslationAnimation;
  Animation rotationAnimation;

  double getRadiansFromDegree(double degree) {
    double unitRadian = 57.295779513;
    return degree / unitRadian;
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 250));
    degOneTranslationAnimation = TweenSequence([
      TweenSequenceItem<double>(
          tween: Tween<double>(begin: 0.0, end: 1.2), weight: 75.0),
      TweenSequenceItem<double>(
          tween: Tween<double>(begin: 1.2, end: 1.0), weight: 25.0),
    ]).animate(animationController);
    degTwoTranslationAnimation = TweenSequence([
      TweenSequenceItem<double>(
          tween: Tween<double>(begin: 0.0, end: 1.4), weight: 55.0),
      TweenSequenceItem<double>(
          tween: Tween<double>(begin: 1.4, end: 1.0), weight: 45.0),
    ]).animate(animationController);
    degThreeTranslationAnimation = TweenSequence([
      TweenSequenceItem<double>(
          tween: Tween<double>(begin: 0.0, end: 1.75), weight: 35.0),
      TweenSequenceItem<double>(
          tween: Tween<double>(begin: 1.75, end: 1.0), weight: 65.0),
    ]).animate(animationController);
    rotationAnimation = Tween<double>(begin: 180.0, end: 0.0).animate(
        CurvedAnimation(parent: animationController, curve: Curves.easeOut));
    super.initState();
    animationController.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return DefaultTabController(
      length: 6,
      child: Scaffold(
          backgroundColor: AppColors.pricecrossed,
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(kToolbarHeight),
            child: Container(
              color: AppColors.vulcan,
              child: SafeArea(
                child: Column(
                  children: <Widget>[
                    Expanded(child: Container()),
                    TabBar(
                      indicatorColor: AppColors.secondaryColor,
                      isScrollable: true,
                      labelPadding: EdgeInsets.all(8.0),
                      tabs: [
                        Text("Love Stories", style: textStyle),
                        Text("Funny Stories", style: textStyle),
                        Text("Confessions", style: textStyle),
                        Text("Random Thoughts", style: textStyle),
                        Text("School/College Stories", style: textStyle),
                        Text("Motivational", style: textStyle),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          body: Stack(
            children: [
              TabBarView(
                physics: NeverScrollableScrollPhysics(),
                children: <Widget>[
                  BlocBuilder<LovestoriesBloc, LovestoriesState>(
                    builder: (context, state) {
                      if (state is LovestoriesInitial) {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      } else if (state is LovestoriesLoaded) {
                        return Stories(
                          confessions: state.love,
                        );
                      }
                      return ErrorDisWidget();
                    },
                  ),
                  BlocBuilder<FunnyBloc, FunnyState>(
                    builder: (context, state) {
                      if (state is FunnyInitial) {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      } else if (state is FunnytoriesLoaded) {
                        return Stories(
                          confessions: state.funny,
                        );
                      }
                      return ErrorDisWidget();
                    },
                  ),
                  BlocBuilder<ConfessionsBloc, ConfessionsState>(
                    builder: (context, state) {
                      if (state is ConfessionsInitial) {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      } else if (state is ConfessiontoriesLoaded) {
                        return Stories(
                          confessions: state.confession,
                        );
                      }
                      return ErrorDisWidget();
                    },
                  ),
                  BlocBuilder<RandomtoughtsBloc, RandomtoughtsState>(
                    builder: (context, state) {
                      if (state is RandomtoughtsInitial) {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      } else if (state is RandomtoriesLoaded) {
                        return Stories(
                          confessions: state.random,
                        );
                      }
                      return ErrorDisWidget();
                    },
                  ),
                  BlocBuilder<SchoolBloc, SchoolState>(
                    builder: (context, state) {
                      if (state is SchoolInitial) {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      } else if (state is SchooltoriesLoaded) {
                        return Stories(
                          confessions: state.school,
                        );
                      }
                      return ErrorDisWidget();
                    },
                  ),
                  BlocBuilder<MotivationBloc, MotivationState>(
                    builder: (context, state) {
                      if (state is MotivationInitial) {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      } else if (state is MotivationtoriesLoaded) {
                        return Stories(
                          confessions: state.motivation,
                        );
                      }
                      return ErrorDisWidget();
                    },
                  ),
                ],
              ),
              Container(
                width: size.width,
                height: size.height,
                child: Stack(
                  children: <Widget>[
                    Positioned(
                        right: 30,
                        bottom: 30,
                        child: Stack(
                          alignment: Alignment.bottomRight,
                          children: <Widget>[
                            IgnorePointer(
                              child: Container(
                                color: Colors.transparent,
                                height: 150.0,
                                width: 150.0,
                              ),
                            ),
                            Transform.translate(
                              offset: Offset.fromDirection(
                                  getRadiansFromDegree(270),
                                  degOneTranslationAnimation.value * 100),
                              child: Transform(
                                transform: Matrix4.rotationZ(
                                    getRadiansFromDegree(
                                        rotationAnimation.value))
                                  ..scale(degOneTranslationAnimation.value),
                                alignment: Alignment.center,
                                child: CircularButton(
                                  color: Colors.blue,
                                  width: 50,
                                  height: 50,
                                  icon: Icon(
                                    Icons.add,
                                    color: Colors.white,
                                  ),
                                  onClick: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => PostStories(),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                            Transform.translate(
                              offset: Offset.fromDirection(
                                  getRadiansFromDegree(225),
                                  degTwoTranslationAnimation.value * 100),
                              child: Transform(
                                transform: Matrix4.rotationZ(
                                    getRadiansFromDegree(
                                        rotationAnimation.value))
                                  ..scale(degTwoTranslationAnimation.value),
                                alignment: Alignment.center,
                                child: BlocBuilder<UserBloc, UserState>(
                                  builder: (context, state) {
                                    if (state is UserInitial) {
                                      return Center(
                                        child: CircularProgressIndicator(),
                                      );
                                    } else if (state is UsertoriesLoaded) {
                                      return CircularButton(
                                        color: AppColors.secondaryColor,
                                        width: 50,
                                        height: 50,
                                        icon: Icon(
                                          Icons.person,
                                          color: Colors.white,
                                        ),
                                        onClick: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) => UserStories(
                                                confessions: state.user,
                                              ),
                                            ),
                                          );
                                        },
                                      );
                                    }
                                    return ErrorDisWidget();
                                  },
                                ),
                              ),
                            ),
                            Transform.translate(
                              offset: Offset.fromDirection(
                                  getRadiansFromDegree(180),
                                  degThreeTranslationAnimation.value * 100),
                              child: Transform(
                                transform: Matrix4.rotationZ(
                                    getRadiansFromDegree(
                                        rotationAnimation.value))
                                  ..scale(degThreeTranslationAnimation.value),
                                alignment: Alignment.center,
                                child: CircularButton(
                                  color: Colors.black,
                                  width: 50,
                                  height: 50,
                                  icon: Icon(
                                    Icons.logout,
                                    color: Colors.white,
                                  ),
                                  onClick: () async {
                                    SharedPreferences pref =
                                        await SharedPreferences.getInstance();
                                    await pref.clear();
                                    Navigator.pushAndRemoveUntil(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => LoginScreen()),
                                      (route) => false,
                                    );
                                  },
                                ),
                              ),
                            ),
                            Transform(
                              transform: Matrix4.rotationZ(getRadiansFromDegree(
                                  rotationAnimation.value)),
                              alignment: Alignment.center,
                              child: CircularButton(
                                color: AppColors.vulcan,
                                width: 60,
                                height: 60,
                                icon: Icon(
                                  Icons.menu,
                                  color: Colors.white,
                                ),
                                onClick: () {
                                  if (animationController.isCompleted) {
                                    animationController.reverse();
                                  } else {
                                    animationController.forward();
                                  }
                                },
                              ),
                            )
                          ],
                        ))
                  ],
                ),
              ),
            ],
          )),
    );
  }
}

final TextStyle textStyle = GoogleFonts.workSans(
  fontSize: 18.flexibleFontSize,
  fontWeight: FontWeight.bold,
);
