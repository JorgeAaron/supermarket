import 'package:flutter/material.dart';
import 'package:supermarket/data/db/user_db.dart';
import 'package:supermarket/data/models/user_model.dart';
import 'package:supermarket/presentation/product_list_page.dart';

import 'cart_page.dart';
import 'demo_page.dart';

class RegisterPage extends StatefulWidget {
  RegisterPage({Key key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  String name = 'fss';
  String lastName;
  String email;
  int celNumber;
  String address;
  String password;

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
              'Registro',
              style: TextStyle(fontSize: 80.0, fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 35.0, left: 20.0, right: 20.0),
            child: Column(
              children: <Widget>[
                TextField(
                    onChanged: (value) {
                      setState(() {
                        name = value;
                      });
                    },
                    decoration: InputDecoration(
                        labelText: 'NOMBRE',
                        labelStyle: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                        ))),
                TextField(
                    onChanged: (value) {
                      setState(() {
                        lastName = value;
                      });
                    },
                    decoration: InputDecoration(
                        labelText: 'APELLIDO',
                        labelStyle: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                        ))),
                TextField(
                    onChanged: (value) {
                      setState(() {
                        celNumber = int.parse(value);
                      });
                    },
                    decoration: InputDecoration(
                        labelText: 'TELÉFONO CELULAR',
                        labelStyle: TextStyle(
                          // add fontFamaly: Monserat
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                        ))),
                TextField(
                    onChanged: (value) {
                      setState(() {
                        address = value;
                      });
                    },
                    decoration: InputDecoration(
                        labelText: 'DIRECCIÓN',
                        labelStyle: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                        ))),
                TextField(
                  onChanged: (value) {
                    setState(() {
                      email = value;
                    });
                  },
                  decoration: InputDecoration(
                      labelText: 'CORREO',
                      labelStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.grey,
                      )),
                ),
                TextField(
                  onChanged: (value) {
                    setState(() {
                      password = value;
                    });
                  },
                  decoration: InputDecoration(
                      labelText: 'CONTRASEÑA',
                      labelStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.grey,
                      )),
                  obscureText: true,
                ),
                Text(name),
                FlatButton(
                  color: Colors.amber,
                  child: Text('Registrarse'),
                  onPressed: () {
                    var newDBUser = User(
                        name: name,
                        lastName: lastName,
                        address: address,
                        celNumber: celNumber,
                        email: email,
                        password: password);
                    DBProvider.db.newUser(newDBUser);

                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => CartPage()),
                    );
                  },
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
