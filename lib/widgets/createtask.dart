import 'package:Karma_flutter/services/auth.dart';
import 'package:Karma_flutter/services/database/order.dart';
import 'package:Karma_flutter/widgets/taskstatedelivery.dart';
import 'package:flutter/material.dart';

class CreateTask extends StatefulWidget {
  @override
  _CreateTaskState createState() => _CreateTaskState();
}

class _CreateTaskState extends State<CreateTask> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Favores'),
        ),
        body: Container(
            padding: EdgeInsets.all(50),
            child: SafeArea(
                child: Container(
                    width: double.infinity,
                    height: double.infinity,
                    child: Column(children: [
                      Text("Pedir un Favor",
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
                        child: Image(image: AssetImage("assets/avatar.png")),
                      ),
                      Text("Datos",
                          style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 19)),
                      Container(
                          margin: EdgeInsets.only(top: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(Icons.work_outline,
                                  color: Theme.of(context).primaryColor,
                                  size: 25),
                              Text(" Sacar Fotocopias")
                            ],
                          )),
                      Container(
                          margin: EdgeInsets.only(bottom: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(Icons.place_outlined,
                                  color: Theme.of(context).primaryColor,
                                  size: 25),
                              Text(" Bambú 2")
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
                          child: Text("Descripcion de favor aqui")),
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
                          child: Text("Cualquier comentario extra aqui")),
                      FlatButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                              side: BorderSide(
                                  color: Theme.of(context).primaryColor,
                                  width: 4)),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => TaskStateDelivery()),
                            );
                          },
                          child: Text("Atender Favor",
                              style: TextStyle(
                                  fontSize: 17,
                                  color: Theme.of(context).primaryColor,
                                  fontWeight: FontWeight.bold))),
                    ])))));
  }
}
