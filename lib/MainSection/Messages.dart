import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mellow/OutScreens/ChatScreen.dart';
import 'package:mellow/Resources/Colors.dart' as colors;
import 'package:mellow/Resources/Navigation.dart' as navigate;

class Messages extends StatefulWidget {
  Messages({Key key}) : super(key: key);

  @override
  _MessagesState createState() => _MessagesState();
}

class _MessagesState extends State<Messages> {
  List<Map<String, dynamic>> list = [
    {
      'name': 'Rohan Raj',
      'sub': 'Lorem Ipsum is simply text of the printing ...',
      'image':
          'https://images.unsplash.com/photo-1541647376583-8934aaf3448a?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&w=1000&q=80',
      'date': '9 mins ago',
      'read': true
    },
    {
      'name': 'Neha Sharma',
      'sub': 'Lorem Ipsum is simply text of the printing ...',
      'image':
          'https://images.unsplash.com/photo-1541647376583-8934aaf3448a?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&w=1000&q=80',
      'date': '9 mins ago',
      'read': true
    },
    {
      'name': 'Tanweer',
      'sub': 'Lorem Ipsum is simply text of the printing ...',
      'image':
          'https://images.unsplash.com/photo-1541647376583-8934aaf3448a?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&w=1000&q=80',
      'date': '9 mins ago',
      'read': false
    },
    {
      'name': 'Monica Gupta',
      'sub': 'Lorem Ipsum is simply text of the printing ...',
      'image':
          'https://images.unsplash.com/photo-1541647376583-8934aaf3448a?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&w=1000&q=80',
      'date': '9 mins ago',
      'read': false
    },
    {
      'name': 'Rohit Sharma',
      'sub': 'Lorem Ipsum is simply text of the printing ...',
      'image':
          'https://images.unsplash.com/photo-1541647376583-8934aaf3448a?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&w=1000&q=80',
      'date': '9 mins ago',
      'read': false
    },
  ];
  List<bool> _selected = List.generate(20, (i) => false);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        bottom: PreferredSize(
            child: Container(
              child: Container(
                alignment: Alignment.center,
                padding: EdgeInsets.only(left: 5, right: 5, bottom: 5),
                margin: EdgeInsets.only(bottom: 15, left: 25, right: 25),
                decoration: BoxDecoration(
                  color: colors.searchGrey,
                  borderRadius: BorderRadius.circular(20),
                ),
                height: 40,
                child: TextField(
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      prefixIcon: Icon(
                        Icons.search,
                        color: colors.black,
                      ),
                      hintText: 'Search messages',
                      hintStyle: TextStyle(fontSize: 12, color: colors.black)),
                ),
              ),
            ),
            preferredSize: Size(width, 60)),
        title: Text(
          'Messages',
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.w900),
        ),
        actions: [
          IconButton(icon: Icon(FontAwesomeIcons.slidersH), onPressed: () {})
        ],
      ),
      body: Container(
        child: ListView.separated(
          itemCount: list.length,
          separatorBuilder: (BuildContext context, int index) {
            return Divider(
              height: 1,
            );
          },
          itemBuilder: (BuildContext context, int index) {
            return Container(
              padding: EdgeInsets.only(top: 10),
              height: 80,
              color: list[index]['read'] == true
                  ? colors.selectedMsg
                  : _selected[index] ? colors.selectedMsg : null,
              child: ListTile(
                onLongPress: () =>
                    setState(() => _selected[index] = !_selected[index]),
                onTap: () => navigate.push(
                    context,
                    ChatScreen(
                      name: list[index]['name'],
                    )),
                leading: Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      height: 58,
                      width: 58,
                      decoration: BoxDecoration(
                          color: colors.white,
                          borderRadius: BorderRadius.circular(30),
                          border:
                              Border.all(color: colors.lightGrey, width: 1)),
                    ),
                    Container(
                      height: 50,
                      width: 50,
                      child: CircleAvatar(
                        backgroundImage:
                            NetworkImage("${list[index]['image']}"),
                      ),
                    ),
                    Positioned(
                      top: 40,
                      left: 43,
                      right: 2,
                      child: Container(
                        height: 13,
                        width: 13,
                        decoration: BoxDecoration(
                            color: colors.green,
                            shape: BoxShape.circle,
                            border: Border.all(color: colors.white, width: 2)),
                      ),
                    )
                  ],
                ),
                title: Text("${list[index]['name']}"),
                subtitle: Text("${list[index]['sub']}"),
                trailing: Text("${list[index]['date']}"),
              ),
            );
          },
        ),
      ),
    );
  }
}
