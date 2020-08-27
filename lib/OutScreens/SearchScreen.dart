import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mellow/Resources/Colors.dart' as colors;

class SearchScreen extends StatefulWidget {
  SearchScreen({Key key}) : super(key: key);

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  String btnText = 'Cancel';
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.light,
        statusBarColor: colors.black));
    return Scaffold(
      backgroundColor: colors.black,
      appBar: AppBar(
        // backgroundColor: colors.w`,
        elevation: 0,
        flexibleSpace: Container(
          margin: EdgeInsets.only(left: 20, right: 20, bottom: 5),
          width: width,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                height: 35,
                width: width - 100,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: colors.selectedMsg,
                    borderRadius: BorderRadius.circular(20)),
                child: TextField(
                    onChanged: (value) {
                      setState(() {
                        if (value.length > 0) {
                          btnText = 'Search';
                        } else {
                          btnText = 'Cancel';
                        }
                      });
                    },
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Search...',
                        prefixIcon: Icon(Icons.search))),
              ),
              InkWell(
                child: Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(right: 7, top: 43),
                  child: Text('$btnText'),
                ),
              )
            ],
          ),
        ),

        leading: Container(width: 0),
      ),
    );
  }
}
