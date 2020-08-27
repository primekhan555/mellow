import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mellow/Auth/ForgotPassword.dart';
import 'package:mellow/Auth/SignUpFG.dart';
import 'package:mellow/MainSection/MainScreen.dart';
import 'package:mellow/Resources/Colors.dart' as colors;
import 'package:mellow/Resources/Navigation.dart' as navigator;

class Login extends StatefulWidget {
  const Login({Key key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
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
          padding: EdgeInsets.only(top: 50),
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
                                      // fontFamily: 'Montserrat',
                                      color: colors.green,
                                      fontWeight: FontWeight.w900),
                                ),
                              )
                            ])),
                    Text(
                      'Login in to your existing account of mellow',
                      style:
                          TextStyle(fontSize: 11, color: colors.signUpbutton),
                    )
                  ])),
              Container(
                  height: 180,
                  margin: EdgeInsets.only(left: 25, right: 25, top: 30),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        inputFieldCont('email', 'blogger41915@gmail.com',
                            FontAwesomeIcons.user),
                        inputFieldCont(
                            'pass', 'Password', FontAwesomeIcons.lock),
                        Container(
                          alignment: Alignment.bottomRight,
                          child: InkWell(
                            onTap: () =>
                                navigator.push(context, ForgotPassword()),
                            child: Container(
                              width: 100,
                              alignment: Alignment.bottomRight,
                              child: Text(
                                'Forgot Password?',
                                style: TextStyle(
                                    color: colors.green, fontSize: 11),
                              ),
                            ),
                          ),
                        )
                      ])),
              Container(
                margin: EdgeInsets.only(top: 20),
                child: Column(
                  children: [
                    InkWell(
                      onTap: () =>
                          navigator.pushAndRemove(context, MainScreen()),
                      child: buttonCont(180, 50, 'Login', colors.green, 18),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 20),
                      child: Text(
                        'or connect using',
                        style: TextStyle(
                            fontSize: 11, color: colors.greyTextColor),
                      ),
                    ),
                    Container(
                      width: width,
                      height: 40,
                      margin: EdgeInsets.only(top: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          buttonCont(
                              130, 40, 'facebook', colors.signUpFacebook, 10,
                              icon: FontAwesomeIcons.facebookF),
                          buttonCont(130, 40, 'Google', colors.signUpGoogle, 10,
                              icon: FontAwesomeIcons.google)
                        ],
                      ),
                    ),
                    InkWell(
                      onTap: () => navigator.push(context, SignUpFG()),
                      child: Container(
                        margin: EdgeInsets.only(top: 20),
                        child: RichText(
                            text: TextSpan(children: [
                          TextSpan(
                              text: "Don't have an account?  ",
                              style: TextStyle(
                                  fontSize: 13, color: colors.signUpbutton)),
                          TextSpan(
                              text: 'Sign Up',
                              style:
                                  TextStyle(fontSize: 13, color: colors.green)),
                        ])),
                      ),
                    ),
                    Container(
                      height: 25,
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

  inputFieldCont(String type, String hint, IconData icon) => Container(
        height: 60,
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
  buttonCont(double width, double height, String text, Color color,
          double fontSize, {IconData icon}) =>
      Container(
          width: width,
          height: height,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: color, borderRadius: BorderRadius.circular(30)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              icon != null
                  ? Container(
                      margin: EdgeInsets.only(right: 7),
                      child: Icon(
                        icon,
                        color: colors.white,
                        size: 15,
                      ),
                    )
                  : Container(),
              Text(
                '$text',
                style: TextStyle(fontSize: fontSize, color: colors.white),
              ),
            ],
          ));

  container() => Container();
}
