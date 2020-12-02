import 'package:Karma_flutter/widgets/login.dart';
import 'package:Karma_flutter/widgets/taskState.dart';
import 'package:Karma_flutter/widgets/taskslist.dart';
import 'package:Karma_flutter/widgets/register.dart';
import 'package:Karma_flutter/widgets/profile.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

const primary = Color(0xffF76D98);
const accent = Color(0xffF04A75);
void main() {
  runApp(FireLoad());
}

class FireLoad extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      // Initialize FlutterFire
      future: Firebase.initializeApp(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return MyHomePage();
        }

        return Container(width: 0.0, height: 0.0);
        // return Container(
        //   color: Colors.lightBlue,
        //   child: Center(
        //     child: Loading(
        //         indicator: BallPulseIndicator(), size: 100.0, color: primary),
        //   ),
        // );
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Karma",
      routes: {
        '/': (context) => LoginApp(),
        '/register': (context) => RegisterApp(),
        '/profile': (context) => ProfileApp(),
        '/tasks': (context) => TasksLists(),
        '/tasks/state': (context) => TaskStateApp(),
      },
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Color(0xffF04A75),
        primaryColorLight: Color(0xFFF76D98),
        accentColor: Color(0xFF1EDD28),
        primarySwatch: Colors.pink,
      ),
    );
  }
}
