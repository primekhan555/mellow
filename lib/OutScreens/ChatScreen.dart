import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mellow/Resources/Colors.dart' as colors;

class ChatScreen extends StatefulWidget {
  final String name;
  ChatScreen({Key key, @required this.name}) : super(key: key);

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final _cont = TextEditingController();
  final _scroll = ScrollController();
  bool enableSend = false;
  String textMsg;
  String image =
      'https://cdn.pixabay.com/photo/2015/12/09/04/27/a-single-person-1084191_960_720.jpg';
  Map<String, dynamic> msg = {};
  List<Map<String, dynamic>> msgs = [
    {
      'user': 2,
      'data':
          'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
      'time': '16:00',
      'image':
          'https://www.digitalphotomentor.com/photography/2016/08/people-photography-mistake-8-750px-04.jpg'
    },
    {
      'user': 1,
      'data':
          'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
      'time': '16:00',
      'image':
          'https://cdn.pixabay.com/photo/2015/12/09/04/27/a-single-person-1084191_960_720.jpg'
    },
    {
      'user': 2,
      'data': 'Lorem Ipsum is simply dummy text',
      'time': '16:00',
      'image':
          'https://www.digitalphotomentor.com/photography/2016/08/people-photography-mistake-8-750px-04.jpg'
    },
    {
      'user': 2,
      'data': 'Lorem Ipsum is dummy',
      'time': '16:00',
      'image':
          'https://www.digitalphotomentor.com/photography/2016/08/people-photography-mistake-8-750px-04.jpg'
    },
    {
      'user': 1,
      'data': 'Lorem Ipsum is simply dummy text of the printing',
      'time': '16:00',
      'image':
          'https://cdn.pixabay.com/photo/2015/12/09/04/27/a-single-person-1084191_960_720.jpg'
    },
  ];

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                height: 10,
                width: 10,
                decoration:
                    BoxDecoration(shape: BoxShape.circle, color: colors.green),
              ),
              Text(
                '${widget.name}',
                style: TextStyle(fontWeight: FontWeight.w900, fontSize: 13),
              ),
            ],
          ),
        ),
        actions: <Widget>[
          IconButton(
              icon: Icon(
                FontAwesomeIcons.ellipsisV,
                size: 15,
              ),
              onPressed: () {})
        ],
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Expanded(
              child: ListView.builder(
                controller: _scroll,
                itemCount: msgs.length,
                itemBuilder: (BuildContext context, int index) {
                  if (msgs[index]['user'] == 1) {
                    return messageCont(width, msgs[index]['image'],
                        msgs[index]['data'], msgs[index]['time'], 'send',
                        index: index);
                  } else {
                    return messageCont(width, msgs[index]['image'],
                        msgs[index]['data'], msgs[index]['time'], 'receive',
                        index: index);
                  }
                },
              ),
            ),
            Container(
                // height: 50,
                padding: EdgeInsets.only(left: 6, bottom: 6),
                margin: EdgeInsets.only(bottom: 3, top: 3, right: 20, left: 20),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: colors.selectedMsg),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: colors.green),
                      child: IconButton(
                          icon: Icon(Icons.add, color: colors.white),
                          onPressed: () {}),
                    ),
                    Container(
                      width: width - 134,
                      child: TextField(
                        controller: _cont,
                        onChanged: (value) {
                          setState(() {
                            if (value.length > 0) {
                              textMsg = value;
                              enableSend = true;
                            } else {
                              enableSend = false;
                            }
                          });
                        },
                        maxLines: null,
                        keyboardType: TextInputType.multiline,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.only(left: 5, right: 5),
                            hintText: 'Type your message..'),
                      ),
                    ),
                    IconButton(
                        icon: Icon(FontAwesomeIcons.solidPaperPlane),
                        onPressed: enableSend
                            ? () {
                                String hour = DateTime.now().hour.toString();
                                String minutes =
                                    DateTime.now().minute.toString();
                                msg = {
                                  'user': 1,
                                  'image': image,
                                  'data': textMsg,
                                  'time': "$hour : $minutes"
                                };
                                setState(() {
                                  msgs.add(msg);
                                });
                                _cont.clear();
                                _scroll
                                    .jumpTo(_scroll.position.maxScrollExtent);
                              }
                            : null)
                  ],
                ))
          ],
        ),
      ),
    );
  }

  messageCont(double width, String image, String text, String time, String user,
      {int index}) {
    print(msgs.elementAt(index)['user'].toString());
    return Container(
      alignment: user == 'send' ? Alignment.centerRight : Alignment.centerLeft,
      margin: EdgeInsets.only(left: 10, right: 10),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          user == 'receive'
              ? index > 0
                  ? msgs.elementAt(index)['user'] !=
                          msgs.elementAt(index - 1)['user']
                      ? avatar(time, image)
                      : Container(width: 50)
                  : avatar(time, image)
              : Container(width: 0),
          Container(
              constraints: BoxConstraints(
                maxWidth: width - 130,
              ),
              padding: EdgeInsets.all(15),
              margin: EdgeInsets.only(
                  top: 10,
                  left: user == 'send' ? 0 : 5,
                  right: user == 'send' ? 5 : 0),
              decoration: BoxDecoration(
                  color: user == 'send' ? colors.selectedMsg : colors.green,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(25),
                      bottomRight: Radius.circular(25),
                      topRight: Radius.circular(user == 'send' ? 7 : 25),
                      topLeft: Radius.circular(user == 'send' ? 25 : 7))),
              child: Text(
                "$text",
                style: TextStyle(
                    color: user == 'send' ? colors.black : colors.white),
              )),
          user == 'send'
              ? index > 0
                  ? msgs.elementAt(index)['user'] !=
                          msgs.elementAt(index - 1)['user']
                      ? avatar(time, image)
                      : Container(width: 50)
                  : avatar(time, image)
              : Container(width: 0),
        ],
      ),
    );
  }

  avatar(String time, String image) {
    return Column(
      children: <Widget>[
        CircleAvatar(
          radius: 24,
          backgroundImage: NetworkImage("$image"),
        ),
        Container(
          child: Text(
            "$time",
            style: TextStyle(fontSize: 10),
          ),
        )
      ],
    );
  }
}
