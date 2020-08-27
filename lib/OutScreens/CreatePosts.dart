import 'package:flutter/material.dart';
import 'package:mellow/Resources/Colors.dart' as colors;
import 'package:dotted_border/dotted_border.dart';

class CreatePosts extends StatefulWidget {
  CreatePosts({Key key}) : super(key: key);

  @override
  _CreatePostsState createState() => _CreatePostsState();
}

class _CreatePostsState extends State<CreatePosts> {
  List<String> tags = [
    'UI / UX',
    'DESIGN',
    'MEUIUXDESIGNER',
    'PHOTOGRAPHY',
    'UI / UX DESIGN'
  ];
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Create a Post',
          style: TextStyle(fontWeight: FontWeight.w900, fontSize: 16),
        ),
        centerTitle: true,
        elevation: 0,
        actions: [
          InkWell(
            child: Container(
                margin: EdgeInsets.only(top: 20, right: 10),
                child: Text('Save Draft')),
          )
        ],
      ),
      body: Container(
        padding: EdgeInsets.only(
          left: 23,
          right: 23,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              // padding: EdgeInsets.only(left: 23),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Add a Title'),
                  Text(
                    'ME UI UX DESIGNER',
                    style: TextStyle(fontSize: 18),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 30),
              child: DottedBorder(
                color: colors.green,
                strokeWidth: 2,
                dashPattern: [10],
                child: Container(
                  decoration: BoxDecoration(
                      color: colors.lightgreen,
                      // border: Border.all(color: colors.green, width: 2),
                      borderRadius: BorderRadius.circular(5)),
                  height: 179,
                  width: width,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [Image.asset('assets/uploadPhoto.png')],
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 23),
              child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      mainAxisSpacing: 7,
                      crossAxisSpacing: 7),
                  itemCount: 2,
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      height: 100,
                      width: 120,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20)),
                      child: Stack(
                        alignment: Alignment.topRight,
                        children: [
                          Container(
                            height: 100,
                            width: 120,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(7),
                                image: DecorationImage(
                                    image: NetworkImage(
                                        'https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__340.jpg'),
                                    fit: BoxFit.cover)),
                          ),
                          Positioned(
                            right: 33,
                            bottom: 107,
                            height: 0,
                            width: 0,
                            child: IconButton(
                                icon: Icon(
                                  Icons.close,
                                  color: colors.white,
                                ),
                                onPressed: () {}),
                          )
                        ],
                      ),
                    );
                  }),
            ),
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'HashTags',
                    style: TextStyle(),
                  ),
                  Wrap(
                      spacing: 5,
                      children: tags
                          .map((e) => Container(
                              padding: EdgeInsets.all(7),
                              margin: EdgeInsets.only(top: 10),
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: colors.green, width: 1.2),
                                  borderRadius: BorderRadius.circular(20)),
                              child: Text(
                                '$e',
                                style: TextStyle(color: colors.green),
                              )))
                          .toList())
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20),
              alignment: Alignment.center,
              width: width,
              height: 50,
              decoration: BoxDecoration(
                  color: colors.green, borderRadius: BorderRadius.circular(25)),
              child: Text(
                'PUBLISH YOUR POST',
                style: TextStyle(color: colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }
}
