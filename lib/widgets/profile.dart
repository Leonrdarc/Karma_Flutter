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

class Profile extends StatelessWidget {
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
                    text: 'Juan Rambal',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: primary)),
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
                            text: '2',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                color: primary)),
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
                        color: primary)),
              ],
            ),
          ),
        )
      ],
    ));
  }
}
