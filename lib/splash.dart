import 'package:calculater/home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _navigatetohome();
  }
  _navigatetohome()async{
    await Future.delayed( const Duration(milliseconds: 2700),(){});
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const Calculater()));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(

        child: Container(

          padding: EdgeInsets.all(100),
          child: Image.asset("img/calculator.png"),
        ),
      ),
    );
  }
}

