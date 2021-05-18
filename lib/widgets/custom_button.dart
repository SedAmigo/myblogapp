import 'package:blogapplication/utils/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:blogapplication/utils/extensions/size_extension.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomButton extends StatelessWidget {
  final Function onTap;
  final String buttonName;
  final Color buttonColor;
  const CustomButton({
    Key key,
    this.buttonColor,
    @required this.buttonName,
    @required this.onTap,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60.flexibleHeight,
      width: 370.flexibleWidth,
      child: RaisedButton(
        color: buttonColor??AppColors.secondaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(8.0),
        ),
        child: Text(buttonName,
            style: GoogleFonts.workSans(
              color: Colors.white,
              fontSize: 18.flexibleFontSize,
              fontWeight: FontWeight.bold,
            )),
        onPressed: onTap,
      ),
    );
  }
}
