import 'package:flutter/material.dart';
import 'package:mellow/Resources/Colors.dart' as colors;

class AllItems extends StatefulWidget {
  AllItems({Key key}) : super(key: key);

  @override
  _AllItemsState createState() => _AllItemsState();
}

class _AllItemsState extends State<AllItems> {
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
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Flower',
          style: TextStyle(fontWeight: FontWeight.w900, fontSize: 16),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: Container(
        height: height,
        padding: EdgeInsets.only(left: 20, right: 20),
        child: Column(children: <Widget>[
          Expanded(
            // height: height,
            child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 20,
                    crossAxisSpacing: 20),
                itemCount: 32,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    height: 190,
                    constraints: BoxConstraints(maxHeight: 220),
                    width: 130,
                    // margin: EdgeInsets.only(right: 10),
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
                        Container(
                            // height: 50,
                            child:
                                Text('Circle', style: TextStyle(fontSize: 9))),
                      ],
                    ),
                  );
                }),
          ),
        ]),
      ),
    );
  }
}
