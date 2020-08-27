import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mellow/Auth/Login.dart';
import 'package:mellow/Resources/Colors.dart' as colors;
import 'package:mellow/Resources/Navigation.dart' as navigator;

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key key}) : super(key: key);

  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/authbg.png"),
                alignment: Alignment.topCenter,
                fit: BoxFit.fitWidth)),
        child: SingleChildScrollView(
          padding: EdgeInsets.only(top: 60),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  // height: 250,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                    Container(
                      height: 100,
                      width: width,
                      margin: EdgeInsets.only(left: 60),
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage("assets/umbrella.png"),
                              alignment: Alignment.topLeft)),
                    ),
                    Container(
                        height: 70,
                        width: width,
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                height: 70,
                                width: 80,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage("assets/logo.png"))),
                              ),
                              Container(
                                height: 70,
                                width: 120,
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  'mellow',
                                  style: TextStyle(
                                      fontSize: 31,
                                      color: colors.green,
                                      fontWeight: FontWeight.w900),
                                ),
                              )
                            ])),
                    Container(
                      margin: EdgeInsets.only(top: 30, bottom: 10),
                      child: Text(
                        'FORGOT PASSWORD',
                        style:
                            TextStyle(fontSize: 18, color: colors.signUpbutton),
                      ),
                    ),
                    Text(
                      'Enter your email address associated with your',
                      style: textStyle(),
                    ),
                    Text(
                      'account we will send you a link to',
                      style: textStyle(),
                    ),
                    Text(
                      'reset your password',
                      style: textStyle(),
                    ),
                  ])),
              inputFieldCont(
                'email',
                'blogger41915@gmail.com',
                FontAwesomeIcons.envelope,
              ),
              Container(
                margin: EdgeInsets.only(top: 40),
                child: Column(
                  children: [
                    buttonCont(180, 50, 'Submit', colors.green, 18),
                    InkWell(
                      onTap: () => navigator.push(context, Login()),
                      child: Container(
                        margin: EdgeInsets.only(top: 30),
                        child: RichText(
                            text: TextSpan(children: [
                          TextSpan(
                              text: "Back to  ",
                              style: TextStyle(
                                  fontSize: 13, color: colors.signUpbutton)),
                          TextSpan(
                              text: 'Login',
                              style:
                                  TextStyle(fontSize: 13, color: colors.green)),
                        ])),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  textStyle() => TextStyle(fontSize: 11, color: colors.signUpbutton);

  inputFieldCont(String type, String hint, IconData icon) => Container(
        height: 60,
        margin: EdgeInsets.only(left: 25, right: 25, top: 25),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: colors.white,
            border: Border.all(width: 1, color: colors.green),
            borderRadius: BorderRadius.circular(35)),
        child: TextFormField(
          decoration: InputDecoration(
              prefixIcon: Icon(
                icon,
                color: colors.green,
                size: 17,
              ),
              hintText: '$hint',
              hintStyle: TextStyle(fontSize: 9, color: colors.green),
              border: InputBorder.none),
        ),
      );
  buttonCont(
    double width,
    double height,
    String text,
    Color color,
    double fontSize,
  ) =>
      Container(
          width: width,
          height: height,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: color, borderRadius: BorderRadius.circular(30)),
          child: Text(
            '$text',
            style: TextStyle(fontSize: fontSize, color: colors.white),
          ));
}
