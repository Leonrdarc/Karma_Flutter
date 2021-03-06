import 'package:Karma_flutter/model/user.dart';
import 'package:Karma_flutter/services/auth.dart';
import 'package:Karma_flutter/services/database/user.dart';
import 'package:Karma_flutter/widgets/login.dart';
import 'package:Karma_flutter/widgets/profile.dart';
import 'package:Karma_flutter/widgets/taskState.dart';
import 'package:Karma_flutter/widgets/taskslist.dart';
import 'package:flutter/material.dart';

const primary = Color(0xffF76D98);
const accent = Color(0xffF04A75);

class MainDrawer extends StatefulWidget {
  @override
  _MainDrawerState createState() => _MainDrawerState();
}

class _MainDrawerState extends State<MainDrawer> {
  User _data = User(
      name: 'Cargando...',
      email: 'Cargando...',
      karma: 0,
      createdAt: 'Cargando...');
  final UserService _user = UserService();
  final AuthService _auth = AuthService();

  Future<void> getData() async {
    User userInfo = await _user.getMe();
    print("newName: ${userInfo.name}");
    setState(() {
      _data = userInfo;
    });
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(
      padding: EdgeInsets.zero,
      children: <Widget>[
        DrawerHeader(
          decoration: BoxDecoration(
            color: accent,
          ),
          child: Row(children: [
            Container(
              padding: EdgeInsets.only(right: 10),
              child: Image.asset(
                'assets/avatar.png',
                width: 100,
                height: 100,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.only(top: 25),
                  child: Text(
                    'Bievenido a Karma!',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 6),
                  child: Text(
                    _data.name,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ),
                Container(
                    padding: EdgeInsets.only(top: 6),
                    child: Row(children: [
                      Container(
                        padding: EdgeInsets.only(right: 5),
                        child: Image.asset(
                          'assets/ic_karma.png',
                          color: Colors.white,
                          width: 22,
                          height: 22,
                        ),
                      ),
                      Text(_data.karma.toString(),
                          style: TextStyle(color: Colors.white, fontSize: 18)),
                    ]))
              ],
            )
          ]),
        ),
        ListTile(
            leading: Icon(Icons.account_circle, color: primary),
            title: Text('Perfil'),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => ProfileApp()),
              );
            }),
        ListTile(
            leading: Icon(Icons.assignment_turned_in, color: primary),
            title: Text('Tareas'),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => TasksLists()),
              );
            }),
        ListTile(
            leading: Icon(Icons.receipt, color: primary),
            title: Text('Favores'),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => TaskStateApp()),
              );
            }),
        ListTile(
            leading: Icon(Icons.power_settings_new, color: primary),
            title: Text('Desconectarse'),
            onTap: () {
              _auth.logout();
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => LoginApp()),
              );
            }),
      ],
    ));
  }
}
