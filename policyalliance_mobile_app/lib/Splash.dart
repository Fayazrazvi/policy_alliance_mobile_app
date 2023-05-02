import 'package:flutter/material.dart';

import 'main.dart';

class Splash extends StatefulWidget {

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState(){
    super.initState();
    _navigatetohome();
  }

  _navigatetohome()async{
    await Future.delayed(Duration(milliseconds: 2000),(){});
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>PolicyAlliance()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: Image.asset('assets/images/Group 18.jpg'),),
        ),

    );
  }
}
