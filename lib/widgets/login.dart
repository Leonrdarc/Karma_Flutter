import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  const Login({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(  
        child: Row(children: [
          Text("Login"),
          Container(
            width: 200,
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Email',
              ),
              obscureText: true 
            ),
          )
          
        ]),
      ),
    );
  }
}