import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:blogapplication/utils/extensions/size_extension.dart';

class CustTextField extends StatelessWidget {
  final TextEditingController controller;
  final Function validator;
  final String hintText;
  final bool obsercure;
  final TextInputType textInputType;
  final int length;
  final int maxLine;
  final Function decoration;
  const CustTextField({
    Key key,
    @required this.controller,
    @required this.validator,
    @required this.hintText,
    this.length,
    this.maxLine,
    this.obsercure,
    this.textInputType,
    this.decoration,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: maxLine ?? null,
      controller: controller,
      obscureText: obsercure ?? false,
      keyboardType: textInputType,
      validator: validator,
      style: GoogleFonts.workSans(),
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: GoogleFonts.workSans(
          fontSize: 14.flexibleFontSize,
          fontWeight: FontWeight.bold,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide(),
        ),
        filled: true,
        fillColor: Colors.white,
      ),
    );
  }
}
