import 'package:Karma_flutter/widgets/drawer.dart';
import 'package:flutter/material.dart';

const primary = Color(0xffF76D98);
const accent = Color(0xffF04A75);

class TaskStateApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Karma',
        color: Color(0xffDD969C),
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
          primaryColor: primary,
          accentColor: accent,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ));
  }
}

class TaskState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: [
        Container(
            padding: EdgeInsets.fromLTRB(0, 32, 0, 0),
            child: Text(
              'Estado de tu favor',
              style: TextStyle(
                  color: primary, fontWeight: FontWeight.bold, fontSize: 22),
            )),
        Container(
            padding: EdgeInsets.fromLTRB(0, 32, 0, 32),
            child: Icon(
              Icons.check_circle_outline,
              color: Colors.grey[400],
              size: 250,
            )),
        Container(
            child: Text(
          'Tu favor ha sido entregado y verificado correctamente',
          style: TextStyle(color: Colors.grey, fontSize: 14),
        )),
        Container(
            padding: EdgeInsets.only(top: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.work,
                  color: primary,
                ),
                Text(
                  'Sacar Fotocopias',
                  style: TextStyle(
                      color: primary,
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
                Icon(Icons.location_on, color: primary),
                Text(
                  'Bambú 2',
                  style: TextStyle(
                      color: primary,
                      fontSize: 14,
                      fontWeight: FontWeight.bold),
                )
              ],
            )),
        Container(
            padding: EdgeInsets.fromLTRB(64, 24, 0, 64),
            alignment: Alignment.center,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                    child: Text(
                  'Descripción',
                  style: TextStyle(
                      color: primary,
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
                          color: primary,
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
        Container(
            padding: EdgeInsets.fromLTRB(0, 48, 16, 0),
            alignment: Alignment.bottomRight,
            child: FloatingActionButton(
              child: Icon(Icons.speaker_notes),
              onPressed: () {
                print('Pressed!');
              },
            ))
      ]),
    );
  }
}
