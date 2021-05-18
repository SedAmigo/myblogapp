import 'package:blogapplication/bloc/User/user_bloc.dart';
import 'package:blogapplication/bloc/confessions/confessions_bloc.dart';
import 'package:blogapplication/bloc/funny/funny_bloc.dart';
import 'package:blogapplication/bloc/lovestories/lovestories_bloc.dart';
import 'package:blogapplication/bloc/motivation/motivation_bloc.dart';
import 'package:blogapplication/bloc/random_thoughts/randomtoughts_bloc.dart';
import 'package:blogapplication/bloc/school/school_bloc.dart';
import 'package:blogapplication/data/core/post_clint.dart';
import 'package:blogapplication/data/core/urls.dart';
import 'package:blogapplication/screens/authenticatonscreen/register.dart';
import 'package:blogapplication/screens/home/home.dart';
import 'package:blogapplication/utils/themes/app_colors.dart';
import 'package:blogapplication/widgets/custom_button.dart';
import 'package:blogapplication/widgets/custom_textfield.dart';
import 'package:blogapplication/widgets/login_carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:blogapplication/utils/extensions/size_extension.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final userNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  PostClient client = PostClient();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.vulcan,
        elevation: 0.0,
        actions: [
          OutlineButton(
            textColor: Colors.white,
            child: Text('Skip'),
            borderSide: BorderSide(
              color: Colors.white,
              style: BorderStyle.solid,
              width: 1,
            ),
            onPressed: () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => MyHomePage()),
                (route) => false,
              );
            },
          )
        ],
      ),
      backgroundColor: AppColors.vulcan,
      body: Padding(
        padding: const EdgeInsets.only(
          left: 20.0,
          right: 20.0,
        ),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              40.verticalSpace,
              ImageSider(),
              20.verticalSpace,
              Text(
                'UserName',
                style: textStyle,
                textAlign: TextAlign.left,
              ),
              10.verticalSpace,
              CustTextField(
                maxLine: 1,
                controller: userNameController,
                validator: MultiValidator([
                  RequiredValidator(errorText: 'UserName is required.'),
                ]),
                hintText: 'UserName',
              ),
              20.verticalSpace,
              Text(
                'Email',
                style: textStyle,
                textAlign: TextAlign.left,
              ),
              10.verticalSpace,
              CustTextField(
                  maxLine: 1,
                  controller: emailController,
                  validator: MultiValidator([
                    RequiredValidator(errorText: 'Email is required.'),
                    EmailValidator(errorText: 'Please enter valid email')
                  ]),
                  hintText: 'Email',
                  textInputType: TextInputType.emailAddress),
              20.verticalSpace,
              Text(
                'Password',
                style: textStyle,
                textAlign: TextAlign.left,
              ),
              10.verticalSpace,
              CustTextField(
                maxLine: 1,
                controller: passwordController,
                validator: MultiValidator([
                  RequiredValidator(errorText: 'Password is required.'),
                  MinLengthValidator(8,
                      errorText: 'Password must contain at least 8 characters.')
                ]),
                hintText: 'Password',
                obsercure: true,
              ),
              30.verticalSpace,
              Builder(
                builder: (context) => CustomButton(
                  buttonName: 'Login',
                  onTap: () async {
                    if (_formKey.currentState.validate()) {
                      SharedPreferences prefs =
                          await SharedPreferences.getInstance();
                      try {
                        Map<String, String> data = {
                          "userName": userNameController.text,
                          "email": emailController.text,
                          "password": passwordController.text,
                        };
                        prefs.setString('userName', userNameController.text);
                        var response =
                            await client.post(userLoginEndPoint, data);
                        var token = response["token"];
                        prefs.setString('token', token);
                        BlocProvider.of<LovestoriesBloc>(context)
                            .add(LovStoriesLoaded());
                        BlocProvider.of<FunnyBloc>(context)
                            .add(FunnyStoryLoaded());
                        BlocProvider.of<ConfessionsBloc>(context)
                            .add(ConfessionLadedEvent());
                        BlocProvider.of<RandomtoughtsBloc>(context)
                            .add(RandomThoughtsLoadedEvent());
                        BlocProvider.of<SchoolBloc>(context)
                            .add(SchoolLoadedEvent());
                        BlocProvider.of<MotivationBloc>(context)
                            .add(MotivationLoadedEvent());
                        BlocProvider.of<UserBloc>(context)
                            .add(UserLoadedEvent());
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(builder: (context) => MyHomePage()),
                          (route) => false,
                        );
                      } catch (error) {
                        print(error);
                        Scaffold.of(context).showSnackBar(
                          SnackBar(
                            backgroundColor: Colors.red,
                            content: Text(error.toString()),
                          ),
                        );
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
              20.verticalSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Create new account..?',
                    style: GoogleFonts.workSans(
                      color: Colors.white,
                      fontSize: 20.flexibleFontSize,
                    ),
                  ),
                  OutlineButton(
                    textColor: Colors.white,
                    child: Text(
                      'Register',
                      style: GoogleFonts.workSans(
                        color: Colors.white,
                      ),
                    ),
                    borderSide: BorderSide(
                      color: Colors.white,
                      style: BorderStyle.solid,
                      width: 1,
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => RegisterScreen(),
                        ),
                      );
                    },
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

final TextStyle textStyle = GoogleFonts.workSans(
  color: Colors.white,
  // fontStyle: FontStyle.italic,
  fontSize: 14.flexibleFontSize,
  fontWeight: FontWeight.bold,
);
