import 'package:blogapplication/bloc/User/user_bloc.dart';
import 'package:blogapplication/bloc/confessions/confessions_bloc.dart';
import 'package:blogapplication/bloc/funny/funny_bloc.dart';
import 'package:blogapplication/bloc/lovestories/lovestories_bloc.dart';
import 'package:blogapplication/bloc/motivation/motivation_bloc.dart';
import 'package:blogapplication/bloc/random_thoughts/randomtoughts_bloc.dart';
import 'package:blogapplication/bloc/school/school_bloc.dart';
import 'package:blogapplication/domain/entities/confession_entity.dart';
import 'package:blogapplication/screens/stories/stories_detail.dart';
import 'package:blogapplication/utils/themes/app_colors.dart';
import 'package:blogapplication/widgets/story_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Stories extends StatefulWidget {
  final List<ConfessionEntity> confessions;

  const Stories({
    Key key,
    @required this.confessions,
  }) : super(key: key);

  @override
  _StoriesState createState() => _StoriesState();
}

class _StoriesState extends State<Stories> {
  @override
  Widget build(BuildContext context) {
    var refreshKey = GlobalKey<RefreshIndicatorState>();
    return RefreshIndicator(
      backgroundColor: AppColors.secondaryColor,
      color: AppColors.vulcan,
      key: refreshKey,
      onRefresh: () async {
        await new Future.delayed(new Duration(seconds: 1));
        BlocProvider.of<LovestoriesBloc>(context).add(LovStoriesLoaded());
        BlocProvider.of<FunnyBloc>(context).add(FunnyStoryLoaded());
        BlocProvider.of<ConfessionsBloc>(context).add(ConfessionLadedEvent());
        BlocProvider.of<RandomtoughtsBloc>(context)
            .add(RandomThoughtsLoadedEvent());
        BlocProvider.of<SchoolBloc>(context).add(SchoolLoadedEvent());
        BlocProvider.of<MotivationBloc>(context).add(MotivationLoadedEvent());
        BlocProvider.of<UserBloc>(context).add(UserLoadedEvent());
      },
      child: ListView.builder(
        itemCount: widget.confessions.length,
        itemBuilder: (context, index) {
          return StoryContainer(
            title: widget.confessions[index].confessionTitle,
            body: widget.confessions[index].confessionBody,
            storyby: widget.confessions[index].confessionBy,
            date: widget.confessions[index].date,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => StoryDetail(
                    title: widget.confessions[index].confessionTitle,
                    body: widget.confessions[index].confessionBody,
                    date: widget.confessions[index].date,
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
