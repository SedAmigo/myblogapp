import 'package:blogapplication/data/core/post_clint.dart';
import 'package:blogapplication/data/core/urls.dart';
import 'package:blogapplication/screens/authenticatonscreen/login.dart';
import 'package:blogapplication/utils/themes/app_colors.dart';
import 'package:blogapplication/widgets/custom_button.dart';
import 'package:blogapplication/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:blogapplication/utils/extensions/size_extension.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    final userNameController = TextEditingController();
    final emailController = TextEditingController();
    final passwordController = TextEditingController();
    final confirmPasswordController = TextEditingController();

    PostClient client = PostClient();
    final _formKey = GlobalKey<FormState>();

    return Scaffold(
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
              100.verticalSpace,
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
                  RequiredValidator(
                    errorText: 'UserName is required.',
                  ),
                  MinLengthValidator(
                    8,
                    errorText: 'UserName should be at least 8 characters',
                  ),
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
                  EmailValidator(errorText: 'Enter valid email')
                ]),
                hintText: 'Email',
                textInputType: TextInputType.emailAddress,
              ),
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
                  RequiredValidator(errorText: 'password is required.'),
                  MinLengthValidator(
                    8,
                    errorText: 'Password should be at least 8 characters',
                  ),
                ]),
                hintText: 'Password',
                obsercure: true,
              ),
              20.verticalSpace,
              Text(
                'Confirm Password',
                style: textStyle,
                textAlign: TextAlign.left,
              ),
              10.verticalSpace,
              CustTextField(
                maxLine: 1,
                controller: confirmPasswordController,
                validator: MultiValidator([
                  RequiredValidator(errorText: 'password is required.'),
                  MinLengthValidator(
                    8,
                    errorText: 'Password should be at least 8 characters',
                  ),
                ]),
                hintText: 'Confirm Password',
                obsercure: true,
              ),
              50.verticalSpace,
              Builder(
                builder: (context) => CustomButton(
                  buttonName: 'Register',
                  onTap: () async {
                    if (_formKey.currentState.validate()) {
                      if (passwordController.text !=
                          confirmPasswordController.text) {
                        Scaffold.of(context).showSnackBar(
                          SnackBar(
                            backgroundColor: Colors.red,
                            content: Text('Password didn\'t match'),
                          ),
                        );
                      } else {
                        Map<String, String> user = {
                          "userName": userNameController.text,
                          "email": emailController.text,
                          "password": passwordController.text,
                          "confirmPassword": confirmPasswordController.text,
                        };
                        try {
                          await client.post(userRegisterEndPoint, user);
                          Navigator.pop(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LoginScreen(),
                            ),
                          );
                          Scaffold.of(context).showSnackBar(
                            SnackBar(
                              backgroundColor: Colors.green,
                              content: Text('User Registered'),
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
              20.verticalSpace,
              20.verticalSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Already a user..?',
                    style: GoogleFonts.workSans(
                      color: Colors.white,
                      fontSize: 20.flexibleFontSize,
                    ),
                  ),
                  OutlineButton(
                    // shape: StadiumBorder(),
                    textColor: Colors.white,
                    child: Text(
                      'Login',
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
                      Navigator.pop(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LoginScreen(),
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
