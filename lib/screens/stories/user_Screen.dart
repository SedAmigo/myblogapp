import 'package:blogapplication/domain/entities/confession_entity.dart';
import 'package:blogapplication/screens/stories/stories_detail.dart';
import 'package:blogapplication/utils/themes/app_colors.dart';
import 'package:blogapplication/widgets/story_container.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class UserStories extends StatelessWidget {
  final List<ConfessionEntity> confessions;

  const UserStories({Key key, @required this.confessions}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.vulcan,
        elevation: 0.0,
        centerTitle: true,
        title: Text(
          'My Stories',
          style: GoogleFonts.workSans(),
        ),
      ),
      body: ListView.builder(
        itemCount: confessions.length,
        itemBuilder: (context, index) {
          return Stack(
            children: [
              StoryContainer(
                title: confessions[index].confessionTitle,
                body: confessions[index].confessionBody,
                storyby: confessions[index].confessionBy,
                date: confessions[index].date,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => StoryDetail(
                        title: confessions[index].confessionTitle,
                        body: confessions[index].confessionBody,
                        date: confessions[index].date,
                      ),
                    ),
                  );
                },
              ),
            ],
          );
        },
      ),
    );
  }
}
