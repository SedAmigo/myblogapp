import 'package:blogapplication/utils/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:blogapplication/utils/extensions/size_extension.dart';
import 'package:blogapplication/utils/extensions/string_extension.dart';
import 'package:google_fonts/google_fonts.dart';

class StoryContainer extends StatelessWidget {
  final String title;
  final String body;
  final String storyby;
  final String date;
  final Function onPressed;
  final double padirght;

  const StoryContainer({
    Key key,
    this.padirght,
    @required this.title,
    @required this.body,
    @required this.storyby,
    @required this.date,
    @required this.onPressed,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        // left: 4.0,
        // right: 4.0,
        bottom: 4.0,
        // top: 2.0,
      ),
      child: GestureDetector(
        child: Container(
          child: Column(
            children: [
              Container(
                height: 100.flexibleHeight,
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
                      padding: const EdgeInsets.only(
                        top: 9.0,
                        bottom: 9.0,
                        left: 9.0,
                        right: 31.0,
                      ),
                      child: Text(
                        title.intrlliTrim(90),
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
              Container(
                height: 200.flexibleHeight,
                width: 475.flexibleWidth,
                decoration: BoxDecoration(
                  color: AppColors.productMain,
                  border: Border.all(
                    color: AppColors.vulcan,
                    width: 1.0,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(9.0),
                      child: Text(
                        body.intrlliTrim(380),
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 14.flexibleFontSize,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: 50.flexibleHeight,
                width: 475.flexibleWidth,
                decoration: BoxDecoration(
                  color: AppColors.selectedTabTextColor,
                  border: Border.all(
                    color: AppColors.vulcan,
                    width: 1.0,
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(9.0),
                      child: Text(
                        'Story by: ' + storyby.intrlliTrim(10),
                        style: GoogleFonts.workSans(
                          color: AppColors.productMain,
                          fontSize: 13.flexibleFontSize,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(9.0),
                      child: Text(
                        date,
                        style: GoogleFonts.workSans(
                          color: AppColors.productMain,
                          fontSize: 13.flexibleFontSize,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        onTap: onPressed,
      ),
    );
  }
}
