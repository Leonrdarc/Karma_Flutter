import 'package:Karma_flutter/model/chat.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_bubble/bubble_type.dart';
import 'package:flutter_chat_bubble/chat_bubble.dart';
import 'package:flutter_chat_bubble/clippers/chat_bubble_clipper_4.dart';
import 'package:logger/logger.dart';

class Chat extends StatefulWidget {
  @override
  _ChatState createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  Logger _logger = Logger();
  List<String> entries = <String>["Hola"];
  String msgtext = "";

  TextEditingController _controller;

  void initState() {
    super.initState();
    _controller = TextEditingController();
    _db.collection("chat").snapshots().listen((event) {
      entries.clear();
      event.docs.forEach((element) {
        var msg = element.get('message');
        _logger.v(msg);
        entries.add(msg);
      });
    });
  }

  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Chat'),
        ),
        body: Container(
            color: Colors.white,
            child: SafeArea(
                child: Column(children: [
              Expanded(
                  child: ListView.builder(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 15),
                      itemCount: entries.length,
                      itemBuilder: (BuildContext context, int index) {
                        return ChatBubble(
                          clipper:
                              ChatBubbleClipper4(type: BubbleType.sendBubble),
                          alignment: Alignment.topRight,
                          margin: EdgeInsets.only(top: 10),
                          backGroundColor: Colors.blue,
                          child: Container(
                            constraints: BoxConstraints(
                              maxWidth: MediaQuery.of(context).size.width * 0.7,
                            ),
                            child: Text(
                              entries[index],
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        );
                      })),
              Container(
                margin: EdgeInsets.all(15.0),
                height: 61,
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(35.0),
                          boxShadow: [
                            BoxShadow(
                                offset: Offset(0, 3),
                                blurRadius: 7,
                                color: Theme.of(context).primaryColorLight)
                          ],
                        ),
                        child: Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.all(15),
                              child: Icon(Icons.face,
                                  color: Theme.of(context).primaryColor),
                            ),
                            Expanded(
                              child: TextField(
                                onChanged: (text) {
                                  setState(() {
                                    msgtext = text;
                                  });
                                },
                                controller: _controller,
                                decoration: InputDecoration(
                                    hintText: "Escribe un mensaje...",
                                    hintStyle: TextStyle(
                                        color: Theme.of(context).primaryColor),
                                    border: InputBorder.none),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(width: 15),
                    Container(
                        width: 57,
                        height: 57,
                        decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                          borderRadius: BorderRadius.circular(70),
                          boxShadow: [
                            BoxShadow(
                                offset: Offset(0, 2),
                                blurRadius: 5,
                                color: Theme.of(context).primaryColorLight)
                          ],
                        ),
                        child: FlatButton(
                            padding: EdgeInsets.all(10),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50),
                            ),
                            onPressed: () async {
                              await _db.collection("chat").add(
                                  ChatModel(message: msgtext, sentBy: "me")
                                      .toMap());
                              if (msgtext != "") {
                                _controller.clear();
                                //entries.add(msgtext);
                                print(msgtext);
                                setState(() {
                                  msgtext = "";
                                });
                              }
                            },
                            child: Padding(
                                padding: EdgeInsets.only(left: 3.2),
                                child: Icon(Icons.send_rounded,
                                    color: Colors.white))))
                  ],
                ),
              )
            ]))));
  }
}
