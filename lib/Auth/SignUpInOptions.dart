import 'package:flutter/material.dart';
import 'package:mellow/Auth/Login.dart';
import 'package:mellow/Auth/SignUpFG.dart';
import 'package:mellow/Resources/Colors.dart' as colors;
import 'package:mellow/Resources/Navigation.dart' as navigator;
import 'package:shared_preferences/shared_preferences.dart';

class SignUpInOptions extends StatefulWidget {
  const SignUpInOptions({Key key}) : super(key: key);

  @override
  _SignUpInOptionsState createState() => _SignUpInOptionsState();
}

class _SignUpInOptionsState extends State<SignUpInOptions> {
  setData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('loggedIn', false);
  }

  @override
  void initState() {
    setData();
    super.initState();
  }

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
                                // fontFamily: 'Montserrat',
                                color: colors.green,
                                fontWeight: FontWeight.w900),
                          ),
                        )
                      ]))
            ])),
            Container(
                height: 100,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () => navigator.push(context, Login()),
                        child: buttonCont(width, 'LOGIN', colors.green),
                      ),
                      InkWell(
                        onTap: () => navigator.push(context, SignUpFG()),
                        child:
                            buttonCont(width, 'SIGN UP', colors.signUpbutton),
                      ),
                    ])),
            container(),
            container(),
          ],
        ),
      ),
    );
  }

  buttonCont(double width, String text, Color color) => Container(
        width: width,
        height: 43,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: color, borderRadius: BorderRadius.circular(30)),
        margin: EdgeInsets.only(left: 40, right: 40),
        child: Text(
          '$text',
          style: TextStyle(fontSize: 18, color: colors.white),
        ),
      );

  container() => Container();
}
