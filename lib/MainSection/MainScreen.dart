import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mellow/MainSection/Home.dart';
import 'package:mellow/MainSection/Messages.dart';
import 'package:mellow/MainSection/Notifications.dart';
import 'package:mellow/MainSection/Profile.dart';
import 'package:mellow/OutScreens/CreatePosts.dart';
import 'package:mellow/Resources/Colors.dart' as colors;
import 'package:mellow/Resources/Navigation.dart' as navigate;

class MainScreen extends StatefulWidget {
  MainScreen({Key key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;
  Color homeC = colors.green;
  Color messagesC = colors.greyTextColor;
  Color notificationsC = colors.greyTextColor;
  Color profileC = colors.greyTextColor;
  List<Widget> widgets = [Home(), Messages(), Notifications(), Profile()];
  @override
  Widget build(BuildContext context) {
    // SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    //     statusBarIconBrightness: Brightness.dark,
    //     statusBarColor: colors.green));
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: Colors.grey[100],
        body: widgets.elementAt(_selectedIndex),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
            heroTag: "btn2",
            backgroundColor: Colors.transparent,
            elevation: 0,
            child: Container(
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      image: AssetImage(
                        'assets/logo.png',
                      ),
                      fit: BoxFit.contain)),
            ),
            onPressed: () {
              print('fsff');
              navigate.push(context, CreatePosts());
            }),
        bottomNavigationBar: BottomAppBar(
          shape: CircularNotchedRectangle(),
          child: Container(
            height: 60,
            padding: EdgeInsets.only(left: 20, right: 20),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                    icon: Icon(
                      Icons.home,
                      color: homeC,
                      size: 20,
                    ),
                    onPressed: () => _onItemTapped(0)),
                IconButton(
                    icon: Icon(
                      FontAwesomeIcons.envelope,
                      color: messagesC,
                      size: 20,
                    ),
                    onPressed: () => _onItemTapped(1)),
                IconButton(
                    icon: Icon(Icons.notifications_none,
                        color: notificationsC, size: 20),
                    onPressed: () => _onItemTapped(2)),
                IconButton(
                    icon: Icon(Icons.person_outline, color: profileC, size: 20),
                    onPressed: () => _onItemTapped(3)),
              ],
            ),
          ),
        )
        // BottomNavigationBar(items: [
        //   BottomNavigationBarItem(
        //       icon: Icon(
        //         Icons.access_alarm,
        //         color: colors.greyTextColor,
        //       ),
        //       title: Text('')),
        //   BottomNavigationBarItem(
        //       icon: Icon(Icons.access_alarm, color: colors.greyTextColor),
        //       title: Text('')),
        //   BottomNavigationBarItem(
        //       icon: Icon(Icons.access_alarm, color: colors.greyTextColor),
        //       title: Text('')),
        //   BottomNavigationBarItem(
        //       icon: Icon(Icons.access_alarm, color: colors.greyTextColor),
        //       title: Text('')),
        // ]),
        );
  }

  void _onItemTapped(int index) {
    setState(() {
      index == 0 ? homeC = colors.green : homeC = colors.greyTextColor;
      index == 1 ? messagesC = colors.green : messagesC = colors.greyTextColor;
      index == 2
          ? notificationsC = colors.green
          : notificationsC = colors.greyTextColor;
      index == 3 ? profileC = colors.green : profileC = colors.greyTextColor;
      _selectedIndex = index;
    });
  }
}
