import 'dart:convert';
// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:mellow/MainSection/MainScreen.dart';
// import 'package:pluginCG/Mainsection/MainScreen.dart';
// import 'package:pluginCG/Screens/UserInformation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:toast/toast.dart';
import 'package:mellow/Globals/Globals.dart' as globals;
import 'package:http/http.dart' as http;
import 'package:mellow/Resources/Navigation.dart' as navigator;

final FirebaseAuth _auth = FirebaseAuth.instance;
var provider = FacebookAuthProvider();
FacebookLogin facebookLogin = FacebookLogin();

Future handleFBSignIn(context) async {
  FacebookLoginResult facebookLoginResult =
      await facebookLogin.logIn(['email']);
  switch (facebookLoginResult.status) {
    case FacebookLoginStatus.cancelledByUser:
      break;
    case FacebookLoginStatus.error:
      Toast.show("an error occured While login through facebook", context,
          gravity: Toast.BOTTOM, duration: Toast.LENGTH_SHORT);
      break;
    case FacebookLoginStatus.loggedIn:
      final accessToken = facebookLoginResult.accessToken.token;
      final facebookAuthCred = FacebookAuthProvider.credential(accessToken);
      final user = await _auth.signInWithCredential(facebookAuthCred);
      var graph = await http.get(
          "https://graph.facebook.com/v6.0/me?fields=name,first_name,last_name,email,picture.height(320).width(320)&access_token=$accessToken");
      var profile = json.decode(graph.body);
      globals.name = profile['name'];
      globals.email = profile['email'];
      globals.uid = user.user.uid;
      globals.photo = profile['picture']['data']['url'];
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString("uid", "${user.user.uid}");
      prefs.setString('method', 'fb');

      DocumentReference ref = FirebaseFirestore.instance
          .collection("users")
          .doc("${user.user.uid}");
      ref.get().then((snap) {
        if (snap.exists) {
          ref.update({
            'name': globals.name,
            'email': globals.email,
            'photo': globals.photo
          }).whenComplete(() {
            prefs.setBool('loggedIn', true);
            navigator.pushAndRemove(context, MainScreen());
          });
        } else {
          ref.set({
            'name': globals.name,
            'email': globals.email,
            'photo': globals.photo,
            'uid': user.user.uid,
            'post': 0,
            'followers': 0,
            'following': 0,
            'onlineState': DateTime.now().toString(),
          }).whenComplete(() {
            prefs.setBool('loggedIn', true);
            navigator.pushAndRemove(context, MainScreen());
          });
        }
      });
      break;
  }
  // return facebookLoginResult;
}

Future handleSignOut() => facebookLogin.logOut();
