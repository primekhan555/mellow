import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:mellow/Auth/Login.dart';
import 'package:mellow/Resources/Colors.dart' as colors;
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mellow/Resources/Navigation.dart' as navigator;
import 'package:mellow/SigninMethods/fbLogin.dart' as fb;
import 'package:mellow/SigninMethods/GoogleLogin.dart' as google;

class SignUpFG extends StatefulWidget {
  const SignUpFG({Key key}) : super(key: key);

  @override
  _SignUpFGState createState() => _SignUpFGState();
}

class _SignUpFGState extends State<SignUpFG> {
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
                // height: 250,
                // color: Colors.red,
                child:
                    Column(mainAxisAlignment: MainAxisAlignment.end, children: [
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
                                fontWeight: FontWeight.w900,
                                color: colors.green),
                          ),
                        )
                      ])),
              Container(
                margin: EdgeInsets.only(top: 10),
                child: Text(
                  'Sign Up in to your account of mellow',
                  style: TextStyle(color: colors.signUpbutton, fontSize: 11),
                ),
              ),
            ])),

            Container(
                height: 160,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        // onTap: () => fb.handleFBSignIn(context),
                        child: buttonCont(width, 'Continue With Facebook',
                            colors.signUpFacebook, FontAwesomeIcons.facebookF),
                      ),
                      InkWell(
                        // onTap: () => google
                        //     .handleSignIn(context)
                        //     .then((value) => log(value.toString())),
                        child: buttonCont(width, 'Continue With Gmail',
                            colors.signUpGoogle, FontAwesomeIcons.google),
                      ),
                      InkWell(
                        onTap: () => navigator.push(context, Login()),
                        child: Container(
                          margin: EdgeInsets.only(top: 20),
                          child: RichText(
                              text: TextSpan(children: [
                            TextSpan(
                                text: 'Already have an account?',
                                style: TextStyle(
                                    fontSize: 13, color: colors.signUpbutton)),
                            TextSpan(
                                text: 'Login',
                                style: TextStyle(
                                    fontSize: 13, color: colors.green)),
                          ])),
                        ),
                      )
                    ])),
            container(),
            // container(),
            // container(),
          ],
        ),
      ),
    );
  }

  buttonCont(double width, String text, Color color, IconData icon) =>
      Container(
          width: width,
          height: 50,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: color, borderRadius: BorderRadius.circular(30)),
          margin: EdgeInsets.only(left: 40, right: 40),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                color: colors.white,
                size: 20,
              ),
              Container(
                margin: EdgeInsets.only(left: 10),
                child: Text(
                  '$text',
                  style: TextStyle(
                      fontSize: 13,
                      color: colors.white,
                      fontFamily: 'Montserrat'),
                ),
              ),
            ],
          ));

  container() => Container();
}
