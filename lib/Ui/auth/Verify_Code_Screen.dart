import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_series/Ui/auth/signup_screen.dart';
import 'package:flutter/material.dart';

import '../../Utils/Firebase Toast.dart';
import '../../Widgets/round_button.dart';


class VerifyCodeScreen extends StatefulWidget {


  String  verificationId;
     VerifyCodeScreen({Key? key,required this .verificationId}) : super(key: key);

  @override
  State<VerifyCodeScreen> createState() => _VerifyCodeScreenState();
}

class _VerifyCodeScreenState extends State<VerifyCodeScreen> {

  final _verifyNumberController=TextEditingController();
  bool loading =false;
  FirebaseAuth auth=FirebaseAuth.instance;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Verif  Code Screen',),backgroundColor: Colors.orangeAccent,),
      body:  Column(

        children: [
          SizedBox(height: 50,),

          Padding(
            padding: const EdgeInsets.all(25),
            child: TextFormField(
              keyboardType: TextInputType.phone,

              controller: _verifyNumberController,

              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.cell_wifi_outlined),
                  filled: true,
                  enabled: true,
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.black,



                    ),





                  ),


                  fillColor: Colors.blueGrey.shade50,
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.green,



                    ),





                  ),
                  hintText: 'Enter COde'






              ),




            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25,right: 25),
            child: RoundButton(
                loading: loading,

                title: 'Verify', onTap: ()

           async {
                  setState(() {
                    loading=true;



                  });



             final tokens=PhoneAuthProvider.credential(
                 verificationId: widget.verificationId,
                 smsCode: _verifyNumberController.text.toString());
             try{

                  await auth.signInWithCredential(tokens);
                  Navigator.push(context, MaterialPageRoute(builder: (context) =>Signup() ,));
             }
             catch(e)
             {



             }







            }


            ),
          ),











        ],



      ),








    );
  }
}
