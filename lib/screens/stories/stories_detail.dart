import 'package:blogapplication/utils/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:blogapplication/utils/extensions/size_extension.dart';

class StoryDetail extends StatelessWidget {
  final String title;
  final String body;
  final String date;

  const StoryDetail({
    Key key,
    @required this.title,
    @required this.body,
    @required this.date,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Reading'),
        leading: IconButton(
          icon: Icon(
            FontAwesomeIcons.times,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        backgroundColor: AppColors.selectedTabColor,
        elevation: 0.0,
      ),
      backgroundColor: AppColors.productMain,
      body: ListView(
        children: [
          Container(
            height: 110.flexibleHeight,
            width: 475.flexibleWidth,
            decoration: BoxDecoration(
              color: AppColors.selectedTabColor,
              border: Border.all(
                color: AppColors.vulcan,
                width: 1.0.flexibleWidth,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(9.0),
                  child: Text(
                    title,
                    textAlign: TextAlign.left,
                    style: GoogleFonts.workSans(
                      color: AppColors.productMain,
                      fontSize: 19.flexibleFontSize,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              body,
              style: GoogleFonts.aBeeZee(
                fontSize: 16.flexibleFontSize,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
