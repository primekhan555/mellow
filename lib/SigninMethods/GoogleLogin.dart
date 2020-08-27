import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:mellow/Globals/Globals.dart' as globals;
import 'package:mellow/MainSection/MainScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:mellow/Resources/Navigation.dart' as navigator;

final FirebaseAuth _auth = FirebaseAuth.instance;
final GoogleSignIn _googleSignIn = GoogleSignIn();

// Future<User> handleSignIn() async {
Future<bool> handleSignIn(context) async {
  // hold the instance of the authenticated user
  User user;
  // flag to check whether we're signed in already
  // bool isSignedIn = await _googleSignIn.isSignedIn();
  // if (isSignedIn) {
  //   user = _auth.currentUser;
  //   log(user.displayName.toString());
  //   // globals.name = user.displayName;
  //   // globals.email = user.email;
  //   // globals.photo = user.photoURL;
  //   // globals.uid = user.uid;
  //   return false;
  // } else {
  final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
  final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
  final AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);
  user = (await _auth.signInWithCredential(credential)).user;
  globals.name = user.displayName;
  globals.email = user.email;
  globals.photo = user.photoURL;
  globals.uid = user.uid;
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString("uid", "${user.uid}");
  prefs.setString('method', 'g');

  DocumentReference ref =
      FirebaseFirestore.instance.collection("users").doc("${user.uid}");
  ref.get().then((snap) {
    if (snap.exists) {
      ref.update({
        'name': user.displayName,
        'email': user.email,
        'photo': user.photoURL
      }).whenComplete(() {
        prefs.setBool('loggedIn', true);
        navigator.pushAndRemove(context, MainScreen());
      });
    } else {
      ref.set({
        'name': user.displayName,
        'email': user.email,
        'photo': user.photoURL,
        'uid': user.uid,
        'onlineState': DateTime.now().toString(),
      }).whenComplete(() {
        prefs.setBool('loggedIn', true);
        navigator.pushAndRemove(context, MainScreen());
      });
    }
    // navigate(context, UserInformation(data: [1, 2, 3]));
  });
  return true;
}
// }

Future handleSignOut() => _googleSignIn.signOut();
