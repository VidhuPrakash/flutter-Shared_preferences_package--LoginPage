import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:login/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class screenHome extends StatelessWidget {
  const screenHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('LOGGED'),
        ),
        body: Center(
          child: ElevatedButton(
              onPressed: () {
                _logout(context);
              },
              child: Text('Logout')),
        ));
  }

  Future<void> _logout(BuildContext context) async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    await sp.clear();
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (ctx1) => screenLog()), (route) => false);
  }
}
