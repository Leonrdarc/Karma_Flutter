import 'package:flutter/material.dart';

const primary = Color(0xffF76D98);
const accent = Color(0xffF04A75);

class RegisterApp extends StatelessWidget {
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
          body: Center(
            child: Register(),
          ),
        ),
        theme: ThemeData(
          primaryColor: primary,
          accentColor: accent,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ));
  }
}

class Register extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.fromLTRB(0, 0, 0, 15),
            child: Column(children: [
              Image.asset('assets/ic_karma.png', color: accent),
              RichText(
                text: TextSpan(
                  style: DefaultTextStyle.of(context).style,
                  children: <TextSpan>[
                    TextSpan(
                        text: 'Karma',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 32,
                            color: primary)),
                  ],
                ),
              ),
            ]),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(0, 0, 0, 15),
            width: 300,
            child: TextField(
              obscureText: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Nombre',
              ),
            ),
          ),
          Container(
            width: 300,
            padding: EdgeInsets.fromLTRB(0, 0, 0, 15),
            child: TextField(
              obscureText: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Correo',
              ),
            ),
          ),
          Container(
            width: 300,
            padding: EdgeInsets.fromLTRB(0, 0, 0, 15),
            child: TextField(
              obscureText: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Contraseña',
              ),
            ),
          ),
          Container(
            width: 300,
            padding: EdgeInsets.fromLTRB(0, 0, 0, 15),
            child: TextField(
              obscureText: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Confirmar Contraseña',
              ),
            ),
          ),
          ElevatedButton(
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(accent),
                padding:
                    MaterialStateProperty.all<EdgeInsets>(EdgeInsets.all(10)),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      side: BorderSide(color: accent)),
                )),
            onPressed: () {
              print("Pressed!");
            },
            child: RichText(
              text: TextSpan(
                style: DefaultTextStyle.of(context).style,
                children: <TextSpan>[
                  TextSpan(
                      text: 'Registrar',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 22,
                          color: Colors.white)),
                ],
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(0, 12, 0, 12),
            child: RichText(
              text: TextSpan(
                style: DefaultTextStyle.of(context).style,
                children: <TextSpan>[
                  TextSpan(
                      text: 'Ya tienes cuenta ?',
                      style: TextStyle(fontSize: 14, color: Colors.grey)),
                  TextSpan(
                      text: ' Inicia sesión',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          color: Colors.grey))
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
