
import 'dart:async';

import 'package:firebase_series/Ui/auth/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SplashServic
{


  void isLogin(BuildContext context)
  {
    Timer(Duration(seconds: 3), () {

      Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen(),));
      


    });




  }





}
