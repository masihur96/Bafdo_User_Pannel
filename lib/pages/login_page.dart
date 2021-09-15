import 'dart:ui';
import 'package:bafdo/colors.dart';
import 'package:bafdo/home.dart';
import 'package:bafdo/pages/login_with_number.dart';
import 'package:bafdo/pages/register_page.dart';
import 'package:bafdo/widgets/form_decoration.dart';
import 'package:bafdo/widgets/gradient_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LogInPage extends StatefulWidget {
  @override
  _LogInPageState createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  bool _obscure = true;
  bool _checked = true;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xffEFF9F9),
      body: _bodyUI(size),
    );
  }

  Widget _bodyUI(Size size) => SingleChildScrollView(
        child: Container(
          width: size.width,
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            //crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: size.width * .2),

              Text(
                'Welcome Back',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontFamily: 'taviraj',
                    fontWeight: FontWeight.w600,
                    color: ColorsVariables.textColor,
                    fontSize: size.width * .052),
              ),
              SizedBox(height: size.width * .03),

              Text(
                'Quick Sign in with mobile number \nor continue with social media',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontFamily: 'taviraj',
                    fontWeight: FontWeight.normal,
                    color: ColorsVariables.textColor,
                    fontSize: size.width * .04),
              ),
              SizedBox(height: size.width * .07),

              ///Email Field
              Container(
                width: size.width,
                padding: EdgeInsets.symmetric(horizontal: 12),
                child: Text(
                  'Email',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      fontFamily: 'taviraj',
                      fontWeight: FontWeight.normal,
                      color: ColorsVariables.textColor,
                      fontSize: size.width * .04),
                ),
              ),
              SizedBox(height: size.width * .02),

              TextFormField(
                decoration: formDecoration(size).copyWith(
                  hintText: 'example@gmail.com',
                  hintStyle: TextStyle(
                      fontFamily: 'taviraj',
                      fontWeight: FontWeight.normal,
                      color: ColorsVariables.dividerColor,
                      fontSize: size.width * .04),
                ),
                style: TextStyle(
                    fontFamily: 'taviraj',
                    fontWeight: FontWeight.normal,
                    color: ColorsVariables.textColor,
                    fontSize: size.width * .04),
              ),

              SizedBox(height: size.width * .04),

              ///Password Field
              Container(
                width: size.width,
                padding: EdgeInsets.symmetric(horizontal: 12),
                child: Text(
                  'Password',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      fontFamily: 'taviraj',
                      fontWeight: FontWeight.normal,
                      color: ColorsVariables.textColor,
                      fontSize: size.width * .04),
                ),
              ),
              SizedBox(height: size.width * .02),
              TextFormField(
                obscureText: _obscure,
                decoration: formDecoration(size).copyWith(
                  hintText:
                      '\u2022 \u2022 \u2022 \u2022 \u2022 \u2022 \u2022 8',
                  hintStyle: TextStyle(
                      fontFamily: 'taviraj',
                      fontWeight: FontWeight.bold,
                      color: ColorsVariables.dividerColor,
                      fontSize: size.width * .04),
                  suffix: InkWell(
                      onTap: () => setState(() => _obscure = !_obscure),
                      child: Image.asset(
                          _obscure
                              ? 'assets/app_icon/text_field_icon/eye_hide.png'
                              : 'assets/app_icon/text_field_icon/eye.png',
                          height: 18)),
                ),
                style: TextStyle(
                    fontFamily: 'taviraj',
                    fontWeight: FontWeight.normal,
                    color: ColorsVariables.textColor,
                    fontSize: size.width * .04),
              ),
              SizedBox(height: size.width * .04),

              ///CheckBox
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  //Forgot password
                  InkWell(
                    onTap: () {},
                    child: Text(
                      'Forgot password',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          fontFamily: 'taviraj',
                          fontWeight: FontWeight.normal,
                          color: ColorsVariables.textColor,
                          fontSize: size.width * .035),
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    splashColor: Colors.pink.shade100,
                  ),

                  //Remember me
                  InkWell(
                    onTap: () => setState(() => _checked = !_checked),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(
                            _checked
                                ? 'assets/app_icon/body_icon/checked.png'
                                : 'assets/app_icon/body_icon/unchecked.png',
                            height: 30),
                        Text(
                          ' Remember me',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontFamily: 'taviraj',
                              fontWeight: FontWeight.normal,
                              color: ColorsVariables.textColor,
                              fontSize: size.width * .035),
                        ),
                      ],
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    splashColor: Colors.pink.shade100,
                  ),
                ],
              ),
              SizedBox(height: size.width * .05),

              ///Continue Button
              GradientButton(
                onPressed: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => Home()));
                },
                child: Text(
                  'Sign In',
                  style: TextStyle(
                      fontFamily: 'taviraj',
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: size.width * .045),
                ),
                borderRadius: 6.97,
                height: size.width * .13,
                width: size.width,
                gradientColors: [Colors.pink.shade600, Colors.pink.shade400],
              ),
              SizedBox(height: size.width * .05),

              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => LoginWithNumber()));
                },
                child: Container(
                  width: size.width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(6.97)),
                      border: Border.all(
                        color: Colors.pink.shade600,
                      )),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: size.width * .10,
                        vertical: size.width * .03),
                    child: Center(
                      child: Text(
                        'Sign in with Mobile Number',
                        style: TextStyle(
                            fontFamily: 'taviraj',
                            fontWeight: FontWeight.bold,
                            color: Colors.pink.shade600,
                            fontSize: size.width * .04),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: size.width * .05),

              ///Social Icon
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  _socialButtonBuilder(
                      size, 'assets/app_icon/body_icon/google.png'),
                  SizedBox(width: size.width * .02),
                  _socialButtonBuilder(
                      size, 'assets/app_icon/body_icon/facebook.png'),
                  SizedBox(width: size.width * .02),
                  _socialButtonBuilder(
                      size, 'assets/app_icon/body_icon/twitter.png'),
                ],
              ),
              SizedBox(height: size.width * .08),

              ///SignUp Button
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Don\'t have an account? ',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontFamily: 'taviraj',
                        fontWeight: FontWeight.w500,
                        color: ColorsVariables.dividerColor,
                        fontSize: size.width * .045),
                  ),
                  InkWell(
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => RegisterPage())),
                    child: Text(
                      'Sign Up',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          fontFamily: 'taviraj',
                          fontWeight: FontWeight.w600,
                          color: Colors.pink.shade500,
                          fontSize: size.width * .045),
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    splashColor: Colors.pink.shade100,
                  ),
                ],
              )
            ],
          ),
        ),
      );

  Widget _socialButtonBuilder(Size size, String assetImage) {
    return InkWell(
      onTap: () {},
      child: Image.asset(assetImage, height: size.width * .12),
      borderRadius: BorderRadius.all(Radius.circular(5)),
      splashColor: Colors.pink.shade100,
    );
  }
}
