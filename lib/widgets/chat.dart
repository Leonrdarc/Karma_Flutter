import 'package:flutter/material.dart';
import 'package:flutter_chat_bubble/bubble_type.dart';
import 'package:flutter_chat_bubble/chat_bubble.dart';
import 'package:flutter_chat_bubble/clippers/chat_bubble_clipper_1.dart';
import 'package:flutter_chat_bubble/clippers/chat_bubble_clipper_4.dart';

class Chat extends StatefulWidget {
  Chat({Key key}) : super(key: key);

  @override
  _ChatState createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  List<String> entries = <String>["Hola"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chat'),
      ),
      body: Container(
        color: Colors.white,
        child: SafeArea(child: Column(children: [
          Expanded(child: ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal:8),
            itemCount: entries.length,
            itemBuilder: (BuildContext context, int index) {
              return ChatBubble(
                clipper: ChatBubbleClipper4(type: BubbleType.sendBubble),
                alignment: Alignment.topRight,
                margin: EdgeInsets.only(top: 20),
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
            }
          )),
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
                          child: Icon(Icons.face , color: Theme.of(context).primaryColor),
                        ),
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                                hintText: "Escribe un mensaje...",
                                hintStyle: TextStyle( color: Theme.of(context).primaryColor),
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
                    onPressed: () {
                      print("Pressed!");
                    },
                    child: Padding(padding: EdgeInsets.only(left:3.2), child: Icon(Icons.send_rounded, color: Colors.white))
                  )
                )
              ],
            ),
          )
        ]))
      )
    );
      
  }
}