import 'package:bafdo/colors.dart';
import 'package:bafdo/custom_widget/custom_appbar.dart';
import 'package:bafdo/pages/login_page.dart';
import 'package:bafdo/pages/login_with_number.dart';
import 'package:bafdo/widgets/form_decoration.dart';
import 'package:bafdo/widgets/gradient_button.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool _obscure = true;
  bool _checked = true;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorsVariables.backgrowndColor,
        elevation: 0,
        leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Image.asset('assets/app_icon/app_bar_icon/arrow_left.png')),
        actions: [
          InkWell(
              onTap: () {},
              child: Image.asset('assets/app_icon/app_bar_icon/close.png')),
        ],
      ),
      backgroundColor: ColorsVariables.backgrowndColor,
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
              SizedBox(height: size.width * .05),

              Text(
                'Register Account',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontFamily: 'taviraj',
                    fontWeight: FontWeight.w600,
                    color: ColorsVariables.textColor,
                    fontStyle: FontStyle.normal,
                    fontSize: size.width * .06),
              ),
              SizedBox(height: size.width * .03),

              Text(
                'Complete Your Details Or \nContinue with Social Media',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontFamily: 'taviraj',
                    color: ColorsVariables.textColor,
                    fontStyle: FontStyle.normal,
                    fontSize: size.width * .04),
              ),
              SizedBox(height: size.width * .07),

              _textFieldBuilder(size, 'Full Name', 'Your Full name',
                  suffixImage: ''),
              SizedBox(height: size.width * .04),
              _textFieldBuilder(size, 'Email', 'example@gmail.com',
                  suffixImage: 'assets/app_icon/body_icon/message.png'),
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
                      fontWeight: FontWeight.w500,
                      color: ColorsVariables.textColor,
                      fontStyle: FontStyle.normal,
                      fontSize: size.width * .04),
                ),
              ),
              SizedBox(height: size.width * .02),
              TextFormField(
                obscureText: _obscure,
                decoration: formDecoration(size).copyWith(
                  hintText:
                      '\u2022 \u2022 \u2022 \u2022 \u2022 \u2022 \u2022 8',
                  suffix: InkWell(
                      onTap: () => setState(() => _obscure = !_obscure),
                      child: Image.asset(
                          _obscure
                              ? 'assets/app_icon/text_field_icon/eye_hide.png'
                              : 'assets/app_icon/text_field_icon/eye.png',
                          height: 18)),
                ),
                style: TextStyle(
                  fontSize: size.width * .04,
                  color: ColorsVariables.dividerColor,
                  fontFamily: 'mulish',
                  //fontWeight: FontWeight.bold
                ),
              ),

              SizedBox(height: size.width * .02),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: () => setState(() => _checked = !_checked),
                    child: Image.asset(
                        _checked
                            ? 'assets/app_icon/body_icon/checked.png'
                            : 'assets/app_icon/body_icon/unchecked.png',
                        height: 30),
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                            left: size.width * .02, top: size.width * .01),
                        child: Text(
                          'By Continuing Your Confirm That You Agree With',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontFamily: 'taviraj',
                              color: ColorsVariables.textColor,
                              fontStyle: FontStyle.normal,
                              fontSize: size.width * .035),
                        ),
                      ),
                      InkWell(
                        onTap: () {},
                        child: Padding(
                          padding: EdgeInsets.only(
                            left: size.width * .02,
                          ),
                          child: Text(
                            'Our Term & Condition',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontFamily: 'taviraj',
                                fontWeight: FontWeight.w500,
                                color: ColorsVariables.pinkColor,
                                fontStyle: FontStyle.normal,
                                fontSize: size.width * .035),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: size.width * .08),

              ///Continue Button
              GradientButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => LoginWithNumber()));
                },
                child: Text(
                  'Sign Up',
                  style: TextStyle(
                      fontFamily: 'taviraj',
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontStyle: FontStyle.normal,
                      fontSize: size.width * .045),
                ),
                borderRadius: 15.0,
                height: size.width * .13,
                width: size.width,
                gradientColors: [Colors.pink.shade600, Colors.pink.shade400],
              ),
              SizedBox(height: size.width * .08),

              ///Social Icon
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  _socialButtonBuilder(
                      size, 'assets/app_icon/body_icon/facebook.png'),
                  SizedBox(width: size.width * .02),
                  _socialButtonBuilder(
                      size, 'assets/app_icon/body_icon/google.png'),
                  SizedBox(width: size.width * .02),
                  _socialButtonBuilder(
                      size, 'assets/app_icon/body_icon/twitter.png'),
                ],
              ),
              SizedBox(height: size.width * .08),

              ///Last Message
              ///SignUp Button
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Already have an account? ',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontFamily: 'taviraj',
                        fontWeight: FontWeight.w500,
                        color: ColorsVariables.textColor,
                        fontStyle: FontStyle.normal,
                        fontSize: size.width * .045),
                  ),
                  InkWell(
                    onTap: () => Navigator.push(context,
                        MaterialPageRoute(builder: (context) => LogInPage())),
                    child: Text(
                      'Login',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          fontFamily: 'taviraj',
                          fontWeight: FontWeight.w700,
                          color: ColorsVariables.pinkColor,
                          fontStyle: FontStyle.normal,
                          fontSize: size.width * .045),
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                  ),
                ],
              ),

              SizedBox(height: size.width * .1),
            ],
          ),
        ),
      );

  Widget _textFieldBuilder(Size size, String title, String hint,
          {String? suffixImage}) =>
      Column(
        children: [
          Container(
            width: size.width,
            padding: EdgeInsets.symmetric(horizontal: 12),
            child: Text(
              title,
              textAlign: TextAlign.left,
              style: TextStyle(
                  fontFamily: 'taviraj',
                  color: ColorsVariables.textColor,
                  fontStyle: FontStyle.normal,
                  fontSize: size.width * .04),
            ),
          ),
          SizedBox(height: size.width * .02),
          TextFormField(
            decoration: formDecoration(size).copyWith(
              hintText: hint,
              suffix: suffixImage != ''
                  ? Image.asset(suffixImage!, height: 18)
                  : null,
            ),
            style: TextStyle(
                fontFamily: 'taviraj',
                color: ColorsVariables.textColor,
                fontStyle: FontStyle.normal,
                fontSize: size.width * .04),
          ),
        ],
      );

  Widget _socialButtonBuilder(Size size, String assetImage) {
    return InkWell(
      onTap: () {},
      child: Image.asset(assetImage, height: size.width * .12),
      borderRadius: BorderRadius.all(Radius.circular(5)),
    );
  }
}
