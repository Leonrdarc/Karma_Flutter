import 'package:Karma_flutter/model/user.dart';
import 'package:Karma_flutter/services/database/user.dart';
import 'package:Karma_flutter/widgets/drawer.dart';
import 'package:flutter/material.dart';

const primary = Color(0xffF76D98);
const accent = Color(0xffF04A75);

class ProfileApp extends StatelessWidget {
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
            child: Profile(),
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

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  User _data = User(
      name: 'Cargando...',
      email: 'Cargando...',
      karma: 0,
      createdAt: 'Cargando...');
  final UserService _user = UserService();
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
    return Container(
        child: Column(
      children: [
        Container(
            padding: EdgeInsets.fromLTRB(0, 40, 0, 5),
            child: Image.asset(
              'assets/avatar.png',
              width: 125,
              height: 125,
            )),
        Container(
          child: RichText(
            text: TextSpan(
              style: DefaultTextStyle.of(context).style,
              children: <TextSpan>[
                TextSpan(
                    text: _data.name,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: accent)),
              ],
            ),
          ),
        ),
        Container(
            padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  child: Image.asset(
                    'assets/ic_karma.png',
                    color: accent,
                    width: 28,
                    height: 28,
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                  child: RichText(
                    text: TextSpan(
                      style: DefaultTextStyle.of(context).style,
                      children: <TextSpan>[
                        TextSpan(
                            text: _data.karma.toString(),
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                color: accent)),
                      ],
                    ),
                  ),
                )
              ],
            )),
        Container(
          child: Divider(
            color: primary,
            thickness: 4,
            indent: 20,
            endIndent: 20,
          ),
        ),
        Container(
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
          child: RichText(
            text: TextSpan(
              style: DefaultTextStyle.of(context).style,
              children: <TextSpan>[
                TextSpan(
                    text: 'Ultimos movimientos',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        color: accent)),
              ],
            ),
          ),
        )
      ],
    ));
  }
}
