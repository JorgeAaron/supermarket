import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  Login({Key key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: EdgeInsets.fromLTRB(15.0, 110.0, 0.0, 0.0),
            child: Text(
              'Bienvenido',
              style: TextStyle(fontSize: 80.0, fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 35.0, left: 20.0, right: 20.0),
            child: Column(
              children: <Widget>[
                TextField(
                    decoration: InputDecoration(
                        labelText: 'CORREO',
                        labelStyle: TextStyle(
                          // add fontFamaly: Monserat
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                        ))),
                TextField(
                  decoration: InputDecoration(
                      labelText: 'CONTRASEÑA',
                      labelStyle: TextStyle(
                        // add fontFamaly: Monserat
                        fontWeight: FontWeight.bold,
                        color: Colors.grey,
                      )),
                  obscureText: true,
                ),
                FlatButton(
                  child: Text('Ingresar'),
                  onPressed: null,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
