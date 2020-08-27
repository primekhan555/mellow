import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mellow/Auth/SignUpInOptions.dart';
import 'package:mellow/Resources/Colors.dart' as colors;
import 'package:firebase_core/firebase_core.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  initFire() async => await Firebase.initializeApp();

  @override
  void initState() {
    initFire();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.dark,
        statusBarColor: colors.transparent));
    return MaterialApp(
      title: 'Mellow',
      theme: ThemeData(
        // brightness: Brightness.dark,
        // primarySwatch: Colors.white,
        primaryColor: Colors.white,
        fontFamily: 'Montserrat',
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: SignUpInOptions(),
    );
  }
}
