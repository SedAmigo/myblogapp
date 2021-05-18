import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:blogapplication/utils/extensions/size_extension.dart';

class ErrorDisWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Developer is writing a sad story!!!',
              style: GoogleFonts.philosopher(
                fontSize: 20.flexibleFontSize,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
