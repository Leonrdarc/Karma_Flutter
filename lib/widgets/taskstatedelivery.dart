import 'package:Karma_flutter/model/order.dart';
import 'package:Karma_flutter/services/auth.dart';
import 'package:Karma_flutter/services/database/order.dart';
import 'package:Karma_flutter/widgets/chat.dart';
import 'package:Karma_flutter/widgets/drawer.dart';
import 'package:flutter/material.dart';

class TaskStateDelivery extends StatefulWidget {
  @override
  _TaskStateDeliveryState createState() => _TaskStateDeliveryState();
}

class _TaskStateDeliveryState extends State<TaskStateDelivery> {
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
    return Scaffold(
        appBar: AppBar(
          title: const Text('Tareas'),
        ),
        drawer: MainDrawer(),
        body: Container(
            padding: EdgeInsets.all(50),
            child: SafeArea(
                child: Container(
              width: double.infinity,
              height: double.infinity,
              child: Column(children: [
                Text("Estado de tu tarea",
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 26,
                    ),
                    textAlign: TextAlign.center),
                Container(
                  height: 150,
                  width: 150,
                  margin: EdgeInsets.symmetric(vertical: 20),
                  padding: EdgeInsets.all(6),
                  child: Image(
                    image: AssetImage("assets/in_progress.png"),
                    color: Colors.grey,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Has aceptado la tarea de "),
                    Text("Leonardo",
                        style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontWeight: FontWeight.bold))
                  ],
                ),
                Container(
                    margin: EdgeInsets.only(top: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(Icons.work_outline,
                            color: Theme.of(context).primaryColor, size: 25),
                        Text(_data.type)
                      ],
                    )),
                Container(
                    margin: EdgeInsets.only(bottom: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(Icons.place_outlined,
                            color: Theme.of(context).primaryColor, size: 25),
                        Text(_data.location)
                      ],
                    )),
                Container(
                    alignment: Alignment.centerLeft,
                    margin: EdgeInsets.only(bottom: 10),
                    child: Text(
                      "Descripcion",
                      style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 15),
                    )),
                Container(
                    alignment: Alignment.centerLeft,
                    margin: EdgeInsets.only(bottom: 15),
                    child: Text(_data.description)),
                Container(
                    alignment: Alignment.centerLeft,
                    margin: EdgeInsets.only(bottom: 10),
                    child: Text(
                      "Comentarios",
                      style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 15),
                    )),
                Container(
                    alignment: Alignment.centerLeft,
                    margin: EdgeInsets.only(bottom: 20),
                    child: Text(_data.extraData)),
                FlatButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                        side: BorderSide(
                            color: Theme.of(context).primaryColor, width: 4)),
                    onPressed: () async {
                      await _order.completeOrder(_data.uid);
                    },
                    child: Text("Completar Pedido",
                        style: TextStyle(
                            fontSize: 17,
                            color: Theme.of(context).primaryColor,
                            fontWeight: FontWeight.bold))),
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
              ]),
            ))));
  }
}
