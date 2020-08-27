import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mellow/Resources/Colors.dart' as colors;

class Notifications extends StatefulWidget {
  Notifications({Key key}) : super(key: key);

  @override
  _NotificationsState createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  List<Map<String, dynamic>> list = [
    {
      'name': 'Rohan Raj',
      'sub': 'Lorem Ipsum is simply text of the printing ...',
      'image': '0',
      'date': '9 mins ago',
      'read': false
    },
    {
      'name': 'Neha Sharma',
      'sub': 'Lorem Ipsum is simply text of the printing ...',
      'image': '0',
      'date': '9 mins ago',
      'read': false
    },
    {
      'name': 'Tanweer',
      'sub': 'Lorem Ipsum is simply text of the printing ...',
      'image': '1',
      'date': '9 mins ago',
      'read': true
    },
    {
      'name': 'Monica Gupta',
      'sub': 'Lorem Ipsum is simply text of the printing ...',
      'image': '2',
      'date': '9 mins ago',
      'read': true
    },
    {
      'name': 'Rohit Sharma',
      'sub': 'Lorem Ipsum is simply text of the printing ...',
      'image': '2',
      'date': '9 mins ago',
      'read': true
    },
  ];
  List<bool> _selected = List.generate(20, (i) => false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          'Notifications',
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
              // padding: EdgeInsets.only(left: 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  index == 0
                      ? Container(
                          margin: EdgeInsets.only(left: 10),
                          child: Text('Today'),
                        )
                      : Container(),
                  index == 2
                      ? Container(
                          margin: EdgeInsets.only(left: 10),
                          child: Text('Yesterday'),
                        )
                      : Container(),
                  Container(
                    padding: EdgeInsets.only(top: 10),
                    height: 80,
                    color: list[index]['read'] == true
                        ? colors.selectedMsg
                        : _selected[index] ? colors.selectedMsg : null,
                    child: ListTile(
                      onLongPress: () =>
                          setState(() => _selected[index] = !_selected[index]),
                      // selected: list[index]['read'],
                      leading: Stack(
                        alignment: Alignment.center,
                        children: [
                          Container(
                            height: 58,
                            width: 58,
                            child: CircleAvatar(
                              backgroundColor: colors.white,
                              child: Image.asset(
                                list[index]['image'] == '0'
                                    ? 'assets/notificationComment.png'
                                    : list[index]['image'] == '1'
                                        ? 'assets/notificationHeart.png'
                                        : 'assets/notifiationCheck.png',
                                color: list[index]['image'] == '1'
                                    ? Colors.red
                                    : colors.green,
                              ),
                            ),
                          ),
                          list[index]['read']
                              ? Positioned(
                                  top: 0,
                                  left: 3,
                                  right: 42,
                                  child: Container(
                                    height: 16,
                                    width: 16,
                                    decoration: BoxDecoration(
                                      color: Colors.red,
                                      shape: BoxShape.circle,
                                    ),
                                  ),
                                )
                              : Container(width: 0)
                        ],
                      ),
                      title: Text("${list[index]['name']}"),
                      subtitle: Text("${list[index]['sub']}"),
                      trailing: IconButton(
                          icon: Icon(
                            FontAwesomeIcons.ellipsisV,
                            size: 13,
                          ),
                          onPressed: null),
                    ),
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
