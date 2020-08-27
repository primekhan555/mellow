import 'package:flutter/material.dart';
import 'package:mellow/Resources/Colors.dart' as colors;

class Photos extends StatefulWidget {
  Photos({Key key}) : super(key: key);

  @override
  _PhotosState createState() => _PhotosState();
}

class _PhotosState extends State<Photos> {
  bool grid = true;
  bool list = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: Container(
        padding: EdgeInsets.only(left: 20, right: 20),
        child: Column(
          children: <Widget>[
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    child: Text('All Photos'),
                  ),
                  Container(
                    child: Row(
                      children: <Widget>[
                        IconButton(
                            icon: Icon(Icons.grid_on,
                                color: grid ? colors.black : colors.lightGrey),
                            onPressed: () {
                              setState(() {
                                if (!grid) {
                                  grid = true;
                                  list = false;
                                }
                              });
                            }),
                        IconButton(
                            icon: Icon(Icons.list,
                                color: list ? colors.black : colors.lightGrey),
                            onPressed: () {
                              setState(() {
                                if (!list) {
                                  grid = false;
                                  list = true;
                                }
                              });
                            })
                      ],
                    ),
                  )
                ],
              ),
            ),
            grid
                ? Expanded(
                    child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 15,
                          mainAxisSpacing: 10),
                      itemCount: 10,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return GridTile(
                            child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                  image: NetworkImage(
                                      'https://cdn.pixabay.com/photo/2015/02/24/15/41/dog-647528__340.jpg'),
                                  fit: BoxFit.cover)),
                        ));
                      },
                    ),
                  )
                : Expanded(
                    child: ListView.builder(
                      itemCount: 20,
                      itemBuilder: (BuildContext context, int index) {
                        return Text('Photos');
                      },
                    ),
                  )
          ],
        ),
      ),
    );
  }
}
