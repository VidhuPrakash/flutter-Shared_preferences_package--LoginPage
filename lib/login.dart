import 'dart:ffi';
import 'main.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:login/home.dart';
import 'package:shared_preferences/shared_preferences.dart';

class screenLog extends StatefulWidget {
  screenLog({super.key});

  @override
  State<screenLog> createState() => _screenLogState();
}

final _userControl = TextEditingController();
final _pswdControl = TextEditingController();
bool stateOfData = true;

class _screenLogState extends State<screenLog> {
  @override
  final invalidText = '';
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('LOGIN '),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(padding: EdgeInsets.all(20)),
            TextField(
              decoration: InputDecoration(
                labelText: 'Username',
                border: OutlineInputBorder(),
              ),
              controller: _userControl,
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(), labelText: 'password'),
              controller: _pswdControl,
            ),
            Visibility(
                visible: !stateOfData,
                child: Text(
                  'Enter valid info',
                  style: TextStyle(color: Colors.redAccent),
                )),
            ElevatedButton(
              onPressed: () {
                _ClickLog();
              },
              child: Icon(Icons.login),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _ClickLog() async {
    // if (_userControl.text.isEmpty || _pswdControl.text.isEmpty) {
    //   String invalidText = 'Please enter valid information';
    // } else {
    //   _StoreData();
    //   Navigator.of(context).pushAndRemoveUntil(
    //       MaterialPageRoute(builder: (context) => screenHome()),
    //       (route) => false);
    // }
    if (_userControl.text == _pswdControl.text &&
        _pswdControl.text.isNotEmpty &&
        _userControl.text.isNotEmpty) {
      _StoreData();
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => screenHome()));
    } else {
      setState(() {
        stateOfData = false;
      });
    }
  }

  Future<void> _StoreData() async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    final log = sp.setBool(SAVED_USER, true);
  }
}
