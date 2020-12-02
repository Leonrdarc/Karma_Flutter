import 'package:Karma_flutter/services/database/order.dart';
import 'package:Karma_flutter/widgets/taskdetail.dart';
import 'package:Karma_flutter/widgets/drawer.dart';
import 'package:Karma_flutter/model/order.dart';
import 'package:flutter/material.dart';

class TasksLists extends StatefulWidget {
  @override
  _TasksListsState createState() => _TasksListsState();
}

class _TasksListsState extends State<TasksLists> {
  String dropdownValue = 'Todos';
  List<Order> _data = [
    Order(
      uid: 'Cargando...',
      extraData: 'Cargando...',
      location: 'Cargando...',
      messengerId: 'Cargando...',
      ownerId: 'Cargando...',
      state: 0,
    )
  ];
  final OrderService _order = OrderService();

  Future<void> getData() async {
    List<Order> orders = await _order.getUnassigned();
    print("newOrder: ${orders[0].toMap()}");
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
                  child: Column(
                    children: [
                      Text("Pedidos Pendientes",
                          style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 26,
                          ),
                          textAlign: TextAlign.center),
                      Container(
                        margin: EdgeInsets.only(top: 20),
                        child: Row(children: [
                          Text("Tipo de favor: ",
                              style: TextStyle(
                                  color: Theme.of(context).primaryColor,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold)),
                          DropdownButton<String>(
                            value: dropdownValue,
                            onChanged: (String newValue) {
                              setState(() {
                                dropdownValue = newValue;
                              });
                            },
                            items: <String>['Todos', 'Fotocopia', 'Comida']
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                          )
                        ]),
                      ),
                      Expanded(
                          child: ListView(
                        padding: const EdgeInsets.all(8),
                        children: renderList(),
                      ))
                    ],
                  )),
            )));
  }

  List<Widget> renderList() {
    List<Widget> widgets = [];
    for (var i = 0; i < _data.length; i++) {
      widgets.add(Padding(
        padding: EdgeInsets.only(top: 10),
        child: Container(
          height: 65,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              border:
                  Border.all(color: Theme.of(context).primaryColor, width: 3),
              borderRadius: BorderRadius.all(Radius.circular(10))),
          child: Row(
            children: [
              Padding(
                padding: EdgeInsets.all(10),
                child: Image(
                  color: Theme.of(context).primaryColorLight,
                  image: AssetImage("assets/ic_karma.png"),
                ),
              ),
              Expanded(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                    Text(_data[i].type,
                        style: TextStyle(
                            color: Color(0xFF6E6E6E),
                            fontWeight: FontWeight.bold)),
                    Row(children: [
                      Icon(
                        Icons.place_outlined,
                        color: Theme.of(context).primaryColor,
                        size: 18,
                      ),
                      Text(_data[i].location, style: TextStyle(fontSize: 12))
                    ])
                  ])),
              Padding(
                padding: EdgeInsets.only(right: 10),
                child: ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            Theme.of(context).primaryColor),
                        padding: MaterialStateProperty.all<EdgeInsets>(
                            EdgeInsets.all(10)),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                              side: BorderSide(
                                  color: Theme.of(context).primaryColorLight)),
                        )),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => TaskDetail(
                                  order: _data[i],
                                )),
                      );
                    },
                    child: Text("Detalles",
                        style: TextStyle(
                            fontSize: 14,
                            color: Colors.white,
                            fontWeight: FontWeight.bold))),
              ),
            ],
          ),
        ),
      ));
    }
    return widgets;
  }
}
