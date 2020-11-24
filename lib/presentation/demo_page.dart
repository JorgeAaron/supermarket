import 'package:flutter/material.dart';
import 'package:supermarket/data/db/user_db.dart';

class DemoPage extends StatefulWidget {
  final String email;
  final String password;

  DemoPage({this.email, this.password});

  @override
  _DemoPageState createState() => _DemoPageState();
}

class _DemoPageState extends State<DemoPage> {
  Map<String, dynamic> newUser = {};
  Future _userFuture;

  @override
  void initState() {
    super.initState();
    _userFuture = getUser();
  }

  getUser() async {
    final _userData =
        await DBProvider.db.getLogin(widget.email, widget.password);
    return _userData;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: FutureBuilder(
          future: _userFuture,
          builder: (_, userData) {
            switch (userData.connectionState) {
              case ConnectionState.none:
                return Container();
              case ConnectionState.waiting:
                return Container();
              case ConnectionState.active:
              case ConnectionState.done:
                if (!newUser.containsKey('email')) {
                  newUser = Map<dynamic, dynamic>.from(userData.data);
                }

                return Column(
                  children: <Widget>[
                    Text(newUser['name']),
                    Text(newUser['password']),
                  ],
                );
            }
            return Container();
          }),
    );
  }
}
