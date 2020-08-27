import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mellow/Resources/Colors.dart' as colors;

class Review extends StatefulWidget {
  Review({Key key}) : super(key: key);

  @override
  _ReviewState createState() => _ReviewState();
}

class _ReviewState extends State<Review> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      extendBody: true,
      body: Container(
        padding: EdgeInsets.only(left: 20, right: 20),
        child: Container(
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: 11,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(20)),
                margin: EdgeInsets.only(bottom: 5, top: 5),
                width: width,
                child: Column(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.only(left: 30),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20)),
                          color: colors.selectedMsg),
                      width: width,
                      height: 60,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Container(
                            child: Row(
                              children: <Widget>[
                                CircleAvatar(
                                  backgroundImage: NetworkImage(
                                      'https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&w=1000&q=80'),
                                ),
                                Container(
                                  padding: EdgeInsets.only(top: 15, left: 10),
                                  child: Column(
                                    children: <Widget>[
                                      Text('Rohit Sharma'),
                                      Text('June 10, 2019')
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
                                  size: 15,
                                ),
                                onPressed: null),
                          )
                        ],
                      ),
                    ),
                    Container(
                      child: Text(
                          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s,"),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 20, bottom: 10),
                      child: Row(
                        children: <Widget>[
                          Icon(
                            Icons.star,
                            size: 16,
                            color: colors.green,
                          ),
                          Icon(
                            Icons.star,
                            size: 16,
                            color: colors.green,
                          ),
                          Icon(
                            Icons.star,
                            size: 16,
                            color: colors.green,
                          ),
                          Icon(
                            Icons.star,
                            size: 16,
                            color: colors.green,
                          ),
                          Icon(
                            Icons.star,
                            size: 16,
                            color: colors.green,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
