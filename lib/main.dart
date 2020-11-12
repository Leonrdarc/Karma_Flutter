import 'package:Karma_flutter/widgets/taskState.dart';
import 'package:Karma_flutter/widgets/taskslist.dart';
import 'package:Karma_flutter/widgets/register.dart';
import 'package:Karma_flutter/widgets/profile.dart';
import 'package:Karma_flutter/widgets/login.dart';
import 'package:flutter/material.dart';

const primary = Color(0xffF76D98);
const accent = Color(0xffF04A75);
void main() {
  runApp(MyHomePage());
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
        '/': (context) => TaskStateApp(),
        // '/tasks': (context) => TasksLists()
      },
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: primary,
        accentColor: accent,
        primarySwatch: Colors.red,
      ),
    );
  }
}
