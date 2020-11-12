import 'package:Karma_flutter/widgets/drawer.dart';
import 'package:flutter/material.dart';

class TasksLists extends StatefulWidget {
  TasksLists({Key key}) : super(key: key);

  @override
  _TasksListsState createState() => _TasksListsState();
}

class _TasksListsState extends State<TasksLists> {
  String dropdownValue = 'Todos';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tareas'),
      ),
      drawer: MainDrawer(),
      body: Container(
        padding: EdgeInsets.all(50),
        child: 
        SafeArea(child: 
          Container(
            width: double.infinity,
            height: double.infinity,
            child: 
              Column(children: [
                Text("Pedidos Pendientes", 
                  style: 
                    TextStyle(
                      color: Theme.of(context).primaryColor, 
                      fontWeight: FontWeight.bold,
                      fontSize: 26,
                    ), 
                  textAlign: TextAlign.center
                ),
                Container(
                  margin: EdgeInsets.only(top: 20),
                  child: Row(children: [
                    Text("Tipo de favor: ", style: TextStyle(color: Theme.of(context).primaryColor, fontSize: 14, fontWeight: FontWeight.bold)),
                    DropdownButton<String>(
                      value: dropdownValue,
                      onChanged: (String newValue) {
                        setState(() {
                          dropdownValue = newValue;
                        });
                      },
                      items: <String>['Todos', 'Fotocopia', 'Comida'].map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    )
                  ]),
                )
              ],
            )
          ),
        )
      )
    );
  }
}