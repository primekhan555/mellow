import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mellow/MainSection/ProfileTabs/Photos.dart';
import 'package:mellow/MainSection/ProfileTabs/Products.dart';
import 'package:mellow/MainSection/ProfileTabs/Review.dart';
import 'package:mellow/Resources/Colors.dart' as colors;

class Profile extends StatefulWidget {
  Profile({Key key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> with SingleTickerProviderStateMixin {
  TabController _cont;
  bool index = true;
  @override
  void initState() {
    _cont = TabController(length: 3, vsync: this, initialIndex: 0);
    _cont.addListener(_handleTabIndex);
    super.initState();
  }

  void _handleTabIndex() {
    setState(() {});
  }

  void handleMode() {
    setState(() {
      index = !index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // var index = DefaultTabController.of(context).index;
    // print(index ?? 1);
    double width = MediaQuery.of(context).size.width;
    return index
        ? Scaffold(
            appBar: AppBar(
              elevation: 0,
              // backgroundColor: Colors.green[300],
              centerTitle: true,
              bottom: PreferredSize(
                  child: Container(
                    height: 152,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          height: 70,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                height: 60,
                                width: 60,
                                margin: EdgeInsets.only(left: 20),
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: colors.green, width: 2.5),
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                        image: NetworkImage(
                                            'https://feedingtrends.com/images/upload_img/1528548458joker_cover.jpg'),
                                        fit: BoxFit.fill)),
                              ),
                              Container(
                                padding: EdgeInsets.only(left: 10),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      child: Text(
                                        'Dilay Tenzin',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w900),
                                      ),
                                    ),
                                    Container(
                                      child: Text(
                                        'Me UI/UX Designer',
                                        style: TextStyle(
                                            color: colors.greyTextColor),
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(top: 5),
                                      child: Row(
                                        children: [
                                          headerButtons(
                                            FontAwesomeIcons.envelope,
                                            'Message',
                                            colors.green,
                                            colors.white,
                                            rightMargin: 20,
                                          ),
                                          headerButtons(
                                              FontAwesomeIcons.check,
                                              'Following',
                                              colors.white,
                                              colors.green),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 30, right: 30),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              headerBelow('666', 'posts'),
                              headerBelow('1454', 'followers'),
                              headerBelow('5673', 'following'),
                            ],
                          ),
                        ),
                        Container(
                          height: 40,
                          margin: EdgeInsets.only(left: 20),
                          // color: Colors.red,
                          alignment: Alignment.bottomLeft,
                          child: Text('Products'),
                        ),
                        // child: TabBar(
                        //     controller: _cont,
                        //     onTap: (value) {
                        //       print('object');
                        //     },
                        //     unselectedLabelColor: colors.lightGrey,
                        //     tabs: [
                        //   Tab(text: 'All Photos'),
                        //   // Tab(text: 'Reviews'),
                        //   // Tab(text: 'Products')
                        // ])
                      ],
                    ),
                  ),
                  preferredSize: Size(width, 160)),

              title: Text(
                'Profile',
                style: TextStyle(fontWeight: FontWeight.w900, fontSize: 16),
              ),
              actions: [
                IconButton(icon: Icon(Icons.camera_alt), onPressed: () {}),
                PopupMenuButton<String>(
                  onSelected: (String value) => handleMode(),
                  child: Container(
                      margin: EdgeInsets.only(right: 10, left: 10),
                      child: Icon(FontAwesomeIcons.ellipsisV, size: 18)),
                  itemBuilder: (BuildContext context) =>
                      <PopupMenuEntry<String>>[
                    const PopupMenuItem<String>(
                      value: 'a',
                      child: Text('Business Mode'),
                    ),
                  ],
                ),
              ],
            ),
            body: Products(),
          )
        : DefaultTabController(
            length: 3,
            initialIndex: 0,
            child: Scaffold(
              appBar: AppBar(
                elevation: 0,
                // backgroundColor: Colors.green[300],
                centerTitle: true,
                bottom: PreferredSize(
                    child: Container(
                      height: 152,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            height: 70,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  height: 60,
                                  width: 60,
                                  margin: EdgeInsets.only(left: 20),
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: colors.green, width: 2.5),
                                      shape: BoxShape.circle,
                                      image: DecorationImage(
                                          image: NetworkImage(
                                              'https://feedingtrends.com/images/upload_img/1528548458joker_cover.jpg'),
                                          fit: BoxFit.fill)),
                                ),
                                Container(
                                  padding: EdgeInsets.only(left: 10),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        child: Text(
                                          'Dilay Tenzin',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w900),
                                        ),
                                      ),
                                      Container(
                                        child: Text(
                                          'Me UI/UX Designer',
                                          style: TextStyle(
                                              color: colors.greyTextColor),
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(top: 5),
                                        child: Row(
                                          children: [
                                            headerButtons(
                                              FontAwesomeIcons.envelope,
                                              'Message',
                                              colors.green,
                                              colors.white,
                                              rightMargin: 20,
                                            ),
                                            headerButtons(
                                                FontAwesomeIcons.check,
                                                'Following',
                                                colors.white,
                                                colors.green),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 30, right: 30),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                headerBelow('666', 'posts'),
                                headerBelow('1454', 'followers'),
                                headerBelow('5673', 'following'),
                              ],
                            ),
                          ),
                          Container(
                              child: TabBar(
                                  controller: _cont,
                                  onTap: (value) {
                                    print('object');
                                  },
                                  unselectedLabelColor: colors.lightGrey,
                                  tabs: [
                                Tab(text: 'All Photos'),
                                Tab(text: 'Reviews'),
                                Tab(text: 'Products')
                              ]))
                        ],
                      ),
                    ),
                    preferredSize: Size(width, 160)),
                title: Text(
                  'Profile',
                  style: TextStyle(fontWeight: FontWeight.w900, fontSize: 16),
                ),
                actions: [
                  IconButton(icon: Icon(Icons.camera_alt), onPressed: () {}),
                  PopupMenuButton<String>(
                    onSelected: (String value) => handleMode(),
                    child: Container(
                        margin: EdgeInsets.only(right: 10, left: 10),
                        child: Icon(FontAwesomeIcons.ellipsisV, size: 18)),
                    itemBuilder: (BuildContext context) =>
                        <PopupMenuEntry<String>>[
                      const PopupMenuItem<String>(
                        value: 'a',
                        child: Text('User Mode'),
                      ),
                    ],
                  ),
                ],
              ),
              body: TabBarView(
                controller: _cont,
                children: [
                  Photos(),
                  Review(),
                  Products(),
                ],
              ),
              floatingActionButton: _cont.index == 1
                  ? FloatingActionButton(
                      heroTag: "btn1",
                      backgroundColor: colors.floatingP,
                      onPressed: () {},
                      child: Icon(Icons.add),
                    )
                  : null,
            ),
          );
  }

  headerButtons(IconData icon, String text, Color textColor, Color bgColor,
          {double rightMargin}) =>
      Container(
        height: 25,
        width: 110,
        margin: EdgeInsets.only(right: rightMargin ?? 0),
        decoration: BoxDecoration(
            color: bgColor,
            borderRadius: BorderRadius.circular(6),
            border: Border.all(color: colors.green, width: 1)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 15,
              color: textColor,
            ),
            Text(
              '$text',
              style: TextStyle(color: textColor),
            )
          ],
        ),
      );
  headerBelow(String count, String type) => Container(
        child: Column(
          children: [Text('$count'), Text('$type')],
        ),
      );
}
