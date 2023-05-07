import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:login/home.dart';
import 'package:login/login.dart';
import 'package:shared_preferences/shared_preferences.dart';
// 'package:login/main.dart';
import 'main.dart';

class ScreenSplash extends StatefulWidget {
  const ScreenSplash({super.key});

  @override
  State<ScreenSplash> createState() => _ScreenSplashState();
}

class _ScreenSplashState extends State<ScreenSplash> {
  @override
  void initState() {
    _userCheck();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: Image(
          image: AssetImage(
            'assets/images/splash.png',
          ),
          width: 250,
          height: 250,
        ),
      )),
    );
  }

  Future<void> _screenlog() async {
    await Future.delayed(Duration(seconds: 3), () {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (ct1) => screenLog()));
    });
  }

  Future<void> _userCheck() async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    final log = sp.getBool(SAVED_USER);
    if (log == false || log == null) {
      _screenlog();
      // Navigator.of(context).pushAndRemoveUntil(
      //     MaterialPageRoute(builder: (cotx) => screenLog()), (route) => false);
    } else {
      //  Navigator.of(context).pushAndRemoveUntil(
      //     MaterialPageRoute(builder: (ctx) => screenHome()), (route) => false);
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (ctx1) => screenHome()));
    }
  }
}
