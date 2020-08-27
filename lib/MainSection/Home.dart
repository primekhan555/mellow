import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mellow/OutScreens/SearchScreen.dart';
import 'package:mellow/Resources/Colors.dart' as colors;
import 'package:mellow/Resources/Navigation.dart' as navigate;
import 'package:image_picker/image_picker.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final picker = ImagePicker();

  List<Map<String, dynamic>> posts = [
    {
      'name': 'Dilay Tenzin',
      'postTime': 'December 4, 2019',
      'postLikes': '1,050',
      'postComments': '102',
      'userImage':
          'https://www.digitalphotomentor.com/photography/2016/08/people-photography-mistake-8-750px-04.jpg',
      'postImage':
          'https://www.digitalphotomentor.com/photography/2016/08/people-photography-mistake-8-750px-04.jpg'
    },
    {
      'name': 'Dilay Tenzin',
      'postTime': 'December 4, 2019',
      'postLikes': '1,050',
      'postComments': '102',
      'userImage':
          'https://www.digitalphotomentor.com/photography/2016/08/people-photography-mistake-8-750px-04.jpg',
      'postImage':
          'https://www.digitalphotomentor.com/photography/2016/08/people-photography-mistake-8-750px-04.jpg'
    },
  ];

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: colors.selectedMsg,
      appBar: AppBar(
        elevation: 0,
        title: Text(
          'mellow',
          style: TextStyle(
              color: colors.green, fontSize: 22, fontWeight: FontWeight.w900),
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.camera_alt,
              color: colors.greyTextColor,
            ),
            onPressed: () async {
              final image = await picker.getImage(source: ImageSource.camera);
            },
          ),
          IconButton(
            icon: Icon(
              Icons.search,
              color: colors.greyTextColor,
            ),
            onPressed: () {
              navigate.push(context, SearchScreen());
            },
          )
        ],
      ),
      body: Container(
        padding: EdgeInsets.only(left: 5, right: 5),
        child: Container(
            child: Column(
          children: <Widget>[
            Container(
              alignment: Alignment.topLeft,
              margin: EdgeInsets.only(top: 20, left: 10),
              child: Text(
                'Featured Stories',
                style: TextStyle(fontWeight: FontWeight.w900),
              ),
            ),
            Container(
              width: width,
              margin: EdgeInsets.only(top: 25, bottom: 10),
              height: 70,
              child: ListView.builder(
                itemCount: 10,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    child: Row(
                      children: <Widget>[
                        index == 0
                            ? DottedBorder(
                                borderType: BorderType.Circle,
                                color: colors.green,
                                dashPattern: [7],
                                strokeWidth: 2,
                                child: Container(
                                  margin: EdgeInsets.only(left: 10, right: 10),
                                  height: 55,
                                  width: 55,
                                  child: IconButton(
                                      icon: Icon(
                                        Icons.add,
                                        color: colors.green,
                                      ),
                                      onPressed: () async {
                                        final image = await picker.getImage(
                                            source: ImageSource.camera);
                                      }),
                                ),
                              )
                            : Container(width: 0),
                        Container(
                          margin: EdgeInsets.only(left: 10, right: 10),
                          height: 60,
                          width: 60,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  image: NetworkImage(
                                      'https://www.digitalphotomentor.com/photography/2016/08/people-photography-mistake-8-750px-04.jpg'),
                                  fit: BoxFit.cover)),
                        )
                      ],
                    ),
                  );
                },
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.only(left: 8, right: 8),
                child: ListView.builder(
                  itemCount: posts.length,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      margin: EdgeInsets.only(bottom: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: colors.white,
                      ),
                      height: 400,
                      width: width,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Container(
                            height: 60,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Container(
                                  child: Row(
                                    children: <Widget>[
                                      Container(
                                        margin: EdgeInsets.only(left: 20),
                                        child: CircleAvatar(
                                          backgroundImage: NetworkImage(
                                              "${posts[index]['userImage']}"),
                                        ),
                                      ),
                                      Container(
                                        margin:
                                            EdgeInsets.only(left: 15, top: 10),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Text("${posts[index]['name']}"),
                                            Text("${posts[index]['postTime']}")
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Container(
                                  child: IconButton(
                                      icon: Icon(
                                        FontAwesomeIcons.ellipsisH,
                                        size: 13,
                                      ),
                                      onPressed: () {}),
                                )
                              ],
                            ),
                          ),
                          Container(
                              height: 280,
                              width: width,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: NetworkImage(
                                          "${posts[index]['userImage']}"),
                                      fit: BoxFit.cover))),
                          Container(
                              height: 60,
                              width: width,
                              padding: EdgeInsets.only(left: 20),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Container(
                                    child: Row(
                                      children: <Widget>[
                                        Image.asset(
                                            'assets/notificationHeart.png'),
                                        Container(
                                          margin: EdgeInsets.only(
                                              left: 5, right: 10),
                                          child: Text(
                                              "${posts[index]['postLikes']}"),
                                        ),
                                        Image.asset(
                                          'assets/notificationComment.png',
                                          color: colors.black,
                                          width: 15,
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(
                                              left: 5, right: 10),
                                          child: Text(
                                              "${posts[index]['postComments']}"),
                                        ),
                                        IconButton(
                                            icon: Icon(FontAwesomeIcons
                                                .solidPaperPlane),
                                            onPressed: () {}),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    child: IconButton(
                                        icon: Icon(Icons.bookmark_border),
                                        onPressed: () {}),
                                  )
                                ],
                              ))
                        ],
                      ),
                    );
                  },
                ),
              ),
            )
          ],
        )),
      ),
    );
  }
}
