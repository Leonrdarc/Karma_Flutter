import 'package:Karma_flutter/model/user.dart';
import 'package:Karma_flutter/services/auth.dart';
import 'package:Karma_flutter/services/database/user.dart';
import 'package:Karma_flutter/widgets/login.dart';
import 'package:Karma_flutter/widgets/profile.dart';
import 'package:flutter/material.dart';
import 'package:toast/toast.dart';

const primary = Color(0xffF76D98);
const accent = Color(0xffF04A75);

class RegisterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Karma',
        color: accent,
        home: Scaffold(
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

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final AuthService _auth = AuthService();
  final UserService _user = UserService();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passController = TextEditingController();
  final pass2Controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.fromLTRB(0, 0, 0, 15),
            child: Column(children: [
              Image.asset('assets/logo.png', color: accent, width: 200)
            ]),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(0, 0, 0, 15),
            width: 300,
            child: TextField(
              controller: nameController,
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
              controller: emailController,
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
              controller: passController,
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
              controller: pass2Controller,
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
            onPressed: () async {
              await _register(
                  context,
                  nameController.text,
                  emailController.text,
                  passController.text,
                  pass2Controller.text);
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
              child: new GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginApp()),
                  );
                },
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
              ))
        ],
      ),
    );
  }

  Future _register(BuildContext context, String name, String email, String pass,
      String confirmation) async {
    DateTime now = new DateTime.now();
    DateTime date = new DateTime(now.year, now.month, now.day);
    dynamic user = await _auth.signUp(email, pass);
    await _user.create(
        User(name: name, email: email, karma: 2, createdAt: date.toString()));
    if (user != null) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ProfileApp()),
      );
    } else {
      Toast.show("Registro invalido", context,
          duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);
    }
  }
}
