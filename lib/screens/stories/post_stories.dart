import 'package:blogapplication/data/core/post_clint.dart';
import 'package:blogapplication/data/core/urls.dart';
import 'package:blogapplication/utils/themes/app_colors.dart';
import 'package:blogapplication/widgets/custom_button.dart';
import 'package:blogapplication/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:blogapplication/utils/extensions/size_extension.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PostStories extends StatefulWidget {
  @override
  _PostStoriesState createState() => _PostStoriesState();
}

class _PostStoriesState extends State<PostStories> {
  final storyTItkeController = TextEditingController();
  final storyBodyController = TextEditingController();

  PostClient client = PostClient();

  final _formKey = GlobalKey<FormState>();

  String nameValue = 'Anonymous';
  String dropValue = '';
  int _radioValue = 1;
  int _value;

  String formattedDate = DateFormat('yyyy-MM-dd').format(DateTime.now());

  void _handleRadioValueChange(int value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _radioValue = value;

      switch (_radioValue) {
        case 0:
          setState(() {
            nameValue = prefs.getString('userName');
          });
          break;
        case 1:
          setState(() {
            nameValue = 'Anonymous';
          });
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.pricecrossed,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            FontAwesomeIcons.times,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        centerTitle: true,
        backgroundColor: AppColors.vulcan,
        title: Text(
          'Post your story',
          style: GoogleFonts.workSans(),
        ),
        elevation: 0.0,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 10.0, right: 10, top: 4.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              10.verticalSpace,
              Text(
                'Story title',
                style: textStyle,
                textAlign: TextAlign.left,
              ),
              10.verticalSpace,
              TextFormField(
                validator: MultiValidator([
                  RequiredValidator(errorText: 'Title is required.'),
                  MaxLengthValidator(100,
                      errorText: 'Title can only have 100 letters')
                ]),
                maxLength: 100,
                controller: storyTItkeController,
                style: GoogleFonts.workSans(),
                decoration: InputDecoration(
                  hintText: 'Interesting story title',
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
              ),
              10.verticalSpace,
              Text(
                'Story',
                style: textStyle,
                textAlign: TextAlign.left,
              ),
              10.verticalSpace,
              CustTextField(
                controller: storyBodyController,
                textInputType: TextInputType.multiline,
                maxLine: null,
                hintText: "Your Story",
                validator: MultiValidator([
                  RequiredValidator(errorText: 'Story is required.'),
                  MinLengthValidator(250,
                      errorText: 'Story should have at least 250 letters')
                ]),
              ),
              30.verticalSpace,
              Text(
                'Story Category',
                style: textStyle,
                textAlign: TextAlign.left,
              ),
              10.verticalSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  DecoratedBox(
                    decoration: ShapeDecoration(
                      color: AppColors.detailcolor,
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                            width: 1.0,
                            style: BorderStyle.solid,
                            color: AppColors.vulcan),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: DropdownButton(
                        hint: Text(
                          'Story Category',
                          style: textStyle,
                        ),
                        icon: FaIcon(
                          FontAwesomeIcons.arrowDown,
                          color: AppColors.vulcan,
                        ),
                        isExpanded: false,
                        focusColor: AppColors.vulcan,
                        dropdownColor: AppColors.cardColor,
                        elevation: 0,
                        value: _value,
                        items: [
                          DropdownMenuItem(
                            child: Text(
                              "Love Stories",
                              style: textStyle,
                            ),
                            onTap: () {},
                            value: 1,
                          ),
                          DropdownMenuItem(
                            child: Text(
                              "Funny Stories",
                              style: textStyle,
                            ),
                            value: 2,
                          ),
                          DropdownMenuItem(
                            child: Text(
                              "Confessions",
                              style: textStyle,
                            ),
                            value: 3,
                          ),
                          DropdownMenuItem(
                            child: Text(
                              "Random Thoughts",
                              style: textStyle,
                            ),
                            value: 4,
                          ),
                          DropdownMenuItem(
                            child: Text(
                              "School/College Stories",
                              style: textStyle,
                            ),
                            value: 5,
                          ),
                          DropdownMenuItem(
                            child: Text(
                              "Motivational",
                              style: textStyle,
                            ),
                            value: 6,
                          )
                        ],
                        onChanged: (value) {
                          setState(() {
                            _value = value;
                            if (value == 1) {
                              setState(() {
                                dropValue = 'lovestory';
                              });
                            } else if (value == 2) {
                              setState(() {
                                dropValue = 'funnystory';
                              });
                            } else if (value == 3) {
                              setState(() {
                                dropValue = 'confessions';
                              });
                            } else if (value == 4) {
                              setState(() {
                                dropValue = 'randomthoughts';
                              });
                            } else if (value == 5) {
                              setState(() {
                                dropValue = 'school';
                              });
                            } else if (value == 6) {
                              setState(() {
                                dropValue = 'motivation';
                              });
                            }
                          });
                        },
                      ),
                    ),
                  ),
                  Container(),
                ],
              ),
              20.verticalSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,
                children: [
                  Row(
                    children: [
                      Column(
                        children: [
                          Radio(
                            value: 1,
                            groupValue: _radioValue,
                            onChanged: _handleRadioValueChange,
                            activeColor: AppColors.vulcan,
                          ),
                          Text(
                            'Anonymous',
                            style: textStyle,
                          ),
                        ],
                      ),
                      12.horizontalSpace,
                      Column(
                        children: [
                          Radio(
                            value: 0,
                            groupValue: _radioValue,
                            onChanged: _handleRadioValueChange,
                            activeColor: AppColors.vulcan,
                          ),
                          Text(
                            'UserName',
                            style: textStyle,
                          ),
                        ],
                      ),
                      5.horizontalSpace,
                    ],
                  ),
                ],
              ),
              50.verticalSpace,
              Builder(
                builder: (context) => CustomButton(
                  buttonColor: AppColors.vulcan,
                  buttonName: 'Post',
                  onTap: () async {
                    if (_formKey.currentState.validate()) {
                      if (dropValue.isEmpty) {
                        Scaffold.of(context).showSnackBar(
                          SnackBar(
                            backgroundColor: Colors.red,
                            content: Text('please choose story category'),
                          ),
                        );
                      } else {
                        print(formattedDate);
                        print('yoooooo' + dropValue);
                        print(nameValue);
                        SharedPreferences prefs =
                            await SharedPreferences.getInstance();
                        Map<String, String> data = {
                          "userName": prefs.getString('userName'),
                          "confessionBy": nameValue.trim(),
                          "confessionCatagory": dropValue.trim(),
                          "confessionTitle": storyTItkeController.text.trim(),
                          "confessionBody": storyBodyController.text.trim(),
                          "date": formattedDate.trim(),
                        };
                        try {
                          await client.post(confessionUpolad, data);
                          Scaffold.of(context).showSnackBar(
                            SnackBar(
                              backgroundColor: Colors.green,
                              content: Text('Story Uploaded'),
                            ),
                          );
                        } catch (error) {
                          print(error);
                          Scaffold.of(context).showSnackBar(
                            SnackBar(
                              backgroundColor: Colors.red,
                              content: Text(
                                error.toString(),
                              ),
                            ),
                          );
                        }
                      }
                    } else {
                      Scaffold.of(context).showSnackBar(
                        SnackBar(
                          backgroundColor: Colors.red,
                          content: Text('Please enter all fields'),
                        ),
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

final TextStyle textStyle = GoogleFonts.workSans(
  fontSize: 15.flexibleFontSize,
  fontWeight: FontWeight.bold,
);
