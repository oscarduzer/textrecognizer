import 'dart:async';
import 'package:flutter/material.dart';

import 'main.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => new _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 5),
            () => Navigator.push(context, MaterialPageRoute(builder: (builder) => MainScreen()))
    );
  }


  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Center(
        child: Container(
          child: Image(image: AssetImage("mage.jfif"),
          repeat: ImageRepeat.noRepeat,),
        ),
      ),
    );
  }
}
