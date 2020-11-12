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

class TaskState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return 
    Container(
      margin: EdgeInsets.all(50),
      child: 
        Column(children: [
          Container(
              child: Text(
                'Estado de tu favor',
                style: TextStyle(color: Theme.of(context).primaryColor, fontWeight: FontWeight.bold, fontSize: 26),
                textAlign: TextAlign.center,
                )
              ),
          Container(
              padding: EdgeInsets.symmetric(vertical: 20),
              child: Icon(
                Icons.check_circle_outline,
                color: Colors.grey[400],
                size: 200,
              )),
          Container(
            child: Text(
              'Tu favor ha sido entregado y verificado correctamente',
              style: TextStyle(color: Colors.grey, fontSize: 14),
              textAlign: TextAlign.center,
            )
          ),
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
                    'Sacar Fotocopias',
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
                    'Bambú 1',
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
                        'Codigo: RT2512Y, imprimir las primeras 14 páginas',
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
                        'Blanco y negro, tamaño carta',
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
                child: Icon(Icons.chat, color: Colors.white,),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Chat()),
                  );
                },
              )))
        ])
      );
  }
}
