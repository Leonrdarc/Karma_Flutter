import 'package:flutter/material.dart';
import 'widgets/login.dart';

const primary = Color(0xffF76D98);
const accent = Color(0xffF04A75);
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
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
          textTheme: TextTheme(
            headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
            headline6: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
            bodyText2: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
          ),
        ));
  }
}
