import 'package:firebase_series/Firebase_Services/splash%20Services.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

SplashServic splashServic=SplashServic();




@override
  void initState() {
    // TODO: implement initState


  splashServic.isLogin(context);
    super.initState();
  }










  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: Text("Splash Screen ",style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),))
          
          
          
          
          
        ],
        
        
        
        
        
      ),
      
      
      
    );
  }
}
