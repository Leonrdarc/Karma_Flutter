import 'package:Karma_flutter/widgets/profile.dart';
import 'package:Karma_flutter/widgets/register.dart';
import 'package:flutter/material.dart';

const primary = Color(0xffF76D98);
const accent = Color(0xffF04A75);

class LoginApp extends StatelessWidget {
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
            child: Login(),
          ),
        ),
        theme: ThemeData(
          primaryColor: primary,
          accentColor: accent,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ));
  }
}

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.fromLTRB(0, 0, 0, 25),
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
            width: 300,
            child: TextField(
              keyboardType: TextInputType.emailAddress,
              obscureText: false,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Correo',
              ),
            ),
          ),
          Container(
            width: 300,
            padding: EdgeInsets.fromLTRB(0, 15, 0, 24),
            child: TextField(
              obscureText: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Contraseña',
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
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProfileApp()),
              );
            },
            child: RichText(
              text: TextSpan(
                style: DefaultTextStyle.of(context).style,
                children: <TextSpan>[
                  TextSpan(
                      text: 'Ingresar',
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
                    MaterialPageRoute(builder: (context) => RegisterApp()),
                  );
                },
                child: RichText(
                  text: TextSpan(
                    style: DefaultTextStyle.of(context).style,
                    children: <TextSpan>[
                      TextSpan(
                          text: 'No tienes cuenta ?',
                          style: TextStyle(fontSize: 14, color: Colors.grey)),
                      TextSpan(
                          text: ' Registrarse',
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
}
