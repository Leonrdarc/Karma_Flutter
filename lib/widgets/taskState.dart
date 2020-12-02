import 'package:Karma_flutter/model/order.dart';
import 'package:Karma_flutter/services/auth.dart';
import 'package:Karma_flutter/services/database/order.dart';
import 'package:Karma_flutter/widgets/chat.dart';
import 'package:Karma_flutter/widgets/drawer.dart';
import 'package:flutter/material.dart';

class TaskStateApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Karma',
        home: Scaffold(
          // resizeToAvoidBottomInset: false,
          appBar: AppBar(
            title: Text('Karma'),
          ),
          drawer: Drawer(child: MainDrawer()),
          body: Center(
            child: TaskState(),
          ),
        ),
        theme: ThemeData(
          brightness: Brightness.light,
          primaryColor: Color(0xffF04A75),
          primaryColorLight: Color(0xFFF76D98),
          accentColor: Color(0xFF1EDD28),
          primarySwatch: Colors.pink,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ));
  }
}

class TaskState extends StatefulWidget {
  @override
  _TaskStateFul createState() => _TaskStateFul();
}

class _TaskStateFul extends State<TaskState> {
  Order _data = Order(
    uid: 'Cargando...',
    extraData: 'Cargando...',
    location: 'Cargando...',
    messengerId: 'Cargando...',
    ownerId: 'Cargando...',
    state: 0,
  );
  final OrderService _order = OrderService();
  final AuthService _auth = AuthService();

  Future<void> getData() async {
    Order orders = await _order.getActualAsMessenger(_auth.getUser().email);
    print("newOrder: ${orders.toMap()}");
    setState(() {
      _data = orders;
    });
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(50),
        child: Column(children: [
          Container(
              child: Text(
            'Estado de tu favor',
            style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontWeight: FontWeight.bold,
                fontSize: 26),
            textAlign: TextAlign.center,
          )),
          Container(
              padding: EdgeInsets.symmetric(vertical: 20),
              child: Icon(
                Icons.check_circle_outline,
                color: Colors.grey[400],
                size: 200,
              )),
          Container(
              child: Text(
            _data.state == 3
                ? 'Tu favor ha sido entregado y verificado correctamente'
                : 'Tu favor está en proceso',
            style: TextStyle(color: Colors.grey, fontSize: 14),
            textAlign: TextAlign.center,
          )),
          Container(
              padding: EdgeInsets.only(top: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.work_outline,
                    color: Theme.of(context).primaryColor,
                  ),
                  Text(
                    _data.type,
                    style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontSize: 14,
                        fontWeight: FontWeight.bold),
                  )
                ],
              )),
          Container(
              padding: EdgeInsets.only(top: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.place_outlined, color: primary),
                  Text(
                    _data.location,
                    style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontSize: 14,
                        fontWeight: FontWeight.bold),
                  )
                ],
              )),
          Container(
              padding: EdgeInsets.fromLTRB(0, 24, 0, 0),
              alignment: Alignment.center,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                      child: Text(
                    'Descripción',
                    style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontSize: 14,
                        fontWeight: FontWeight.bold),
                  )),
                  Container(
                      padding: EdgeInsets.only(top: 12),
                      child: Text(
                        _data.description,
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 14,
                        ),
                      )),
                  Container(
                      padding: EdgeInsets.only(top: 12),
                      child: Text(
                        'Comentarios',
                        style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontSize: 14,
                            fontWeight: FontWeight.bold),
                      )),
                  Container(
                      padding: EdgeInsets.only(top: 12),
                      child: Text(
                        _data.extraData,
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 14,
                        ),
                      ))
                ],
              )),
          Expanded(
              child: Container(
                  alignment: Alignment.bottomRight,
                  child: FloatingActionButton(
                    backgroundColor: Theme.of(context).primaryColor,
                    child: Icon(
                      Icons.chat,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Chat()),
                      );
                    },
                  )))
        ]));
  }
}
