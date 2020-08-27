import 'package:flutter/material.dart';
import 'package:mellow/OutScreens/AllItems.dart';
import 'package:mellow/Resources/Colors.dart' as colors;
import 'package:mellow/Resources/Navigation.dart' as navigator;

class Products extends StatefulWidget {
  Products({Key key}) : super(key: key);

  @override
  _ProductsState createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  List<Map<String, String>> flowers = [
    {
      'price': "20",
      "desc": "Sweet Sour Diesel Base Camp",
      "circle": 'Circles',
      'product':
          'https://www.tcelectronic.com/dam/jcr:78a8e97e-1e18-4514-b86e-f56e4b72bc1a/TC%20electronics_RECORDING%20AND%20BROADCAST_Application.png'
    }
  ];

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        width: width,
        // color: Colors.red,
        child: SingleChildScrollView(
          padding: EdgeInsets.only(left: 20),
          child: Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(right: 15, top: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'Flower',
                      style: TextStyle(fontWeight: FontWeight.w900),
                    ),
                    InkWell(
                      onTap: () => navigator.push(context, AllItems()),
                      child: Text("See All (30)",
                          style: TextStyle(
                            color: colors.green,
                          )),
                    )
                  ],
                ),
              ),
              Container(
                height: 170,
                width: width,
                margin: EdgeInsets.only(top: 10),
                child: ListView.builder(
                  itemCount: 5,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      height: 170,
                      width: 130,
                      margin: EdgeInsets.only(right: 10),
                      decoration: BoxDecoration(
                          color: colors.white,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: colors.green, width: 1)),
                      child: Column(
                        children: <Widget>[
                          Container(
                              height: 80,
                              width: 80,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: NetworkImage(
                                        "https://www.tcelectronic.com/dam/jcr:78a8e97e-1e18-4514-b86e-f56e4b72bc1a/TC%20electronics_RECORDING%20AND%20BROADCAST_Application.png")),
                              )),
                          Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Icon(Icons.attach_money),
                                Text("20", style: TextStyle(fontSize: 16))
                              ],
                            ),
                          ),
                          Container(
                            height: 23,
                            margin: EdgeInsets.only(bottom: 10),
                            alignment: Alignment.center,
                            padding: EdgeInsets.only(left: 15, right: 15),
                            child: Text('Sweet Sour Diesel Base Camp',
                                overflow: TextOverflow.clip,
                                style: TextStyle(
                                    fontSize: 9, fontWeight: FontWeight.w900)),
                          ),
                          Text('Circle', style: TextStyle(fontSize: 9))
                        ],
                      ),
                    );
                  },
                ),
              ),
              Container(
                padding: EdgeInsets.only(right: 15, top: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'New Product Alert!',
                      style: TextStyle(fontWeight: FontWeight.w900),
                    ),
                    Text("See All (30)",
                        style: TextStyle(
                          color: colors.green,
                        ))
                  ],
                ),
              ),
              Container(
                height: 170,
                width: width,
                margin: EdgeInsets.only(top: 10),
                child: ListView.builder(
                  itemCount: 5,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      height: 170,
                      width: 130,
                      margin: EdgeInsets.only(right: 10),
                      decoration: BoxDecoration(
                          color: colors.white,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: colors.green, width: 1)),
                      child: Column(
                        children: <Widget>[
                          Container(
                              height: 80,
                              width: 80,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: NetworkImage(
                                        "https://www.tcelectronic.com/dam/jcr:78a8e97e-1e18-4514-b86e-f56e4b72bc1a/TC%20electronics_RECORDING%20AND%20BROADCAST_Application.png")),
                              )),
                          Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Icon(Icons.attach_money),
                                Text("20", style: TextStyle(fontSize: 16))
                              ],
                            ),
                          ),
                          Container(
                            height: 23,
                            margin: EdgeInsets.only(bottom: 10),
                            alignment: Alignment.center,
                            padding: EdgeInsets.only(left: 15, right: 15),
                            child: Text('Sweet Sour Diesel Base Camp',
                                overflow: TextOverflow.clip,
                                style: TextStyle(
                                    fontSize: 9, fontWeight: FontWeight.w900)),
                          ),
                          Text('Circle', style: TextStyle(fontSize: 9))
                        ],
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
