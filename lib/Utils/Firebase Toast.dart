import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';

class flutterToast
{
  void toastmessage( String message)

  {

    Fluttertoast.showToast(
        msg: message,

        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 13.0
    );




  }







  }























