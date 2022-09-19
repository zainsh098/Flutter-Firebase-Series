import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_series/Ui/auth/Verify_Code_Screen.dart';
import 'package:firebase_series/Utils/Firebase%20Toast.dart';
import 'package:firebase_series/Widgets/round_button.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class phoneNumAuth extends StatefulWidget {
  const phoneNumAuth({Key? key}) : super(key: key);

  @override
  State<phoneNumAuth> createState() => _phoneNumAuthState();
}

class _phoneNumAuthState extends State<phoneNumAuth> {
  final _phoneNumberController=TextEditingController();
 bool loading =false;
 FirebaseAuth auth=FirebaseAuth.instance;




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Vertification'),),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 30),
        child: Column(

          children: [
            SizedBox(height: 50,),

            Padding(
              padding: const EdgeInsets.all(25),
              child: TextFormField(
                keyboardType: TextInputType.phone,

                controller: _phoneNumberController,

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
                  hintText: '+1 732 023 030'






                ),




              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25,right: 25),
              child: RoundButton(
                loading: loading,

                  title: 'Send Code', onTap: ()

              {
                setState(() {

                  loading=true;



                });



                auth.verifyPhoneNumber(
                  phoneNumber: _phoneNumberController.text.toString(),
                    verificationCompleted: (_){
                      setState(() {

                        loading=false;



                      });





                    },
                    verificationFailed: (e)
                    {
                      setState(() {

                        loading=false;



                      });

                      flutterToast().toastmessage(e.toString());



                    },
                    codeSent:(String verification,int?  token)
                    {
                      Navigator.push(context, MaterialPageRoute(builder: (context) =>
                          VerifyCodeScreen(verificationId: verification,),));
                      setState(() {

                        loading=true;



                      });




                    },


                    codeAutoRetrievalTimeout: (e)
                {
                  setState(() {

                    loading=true;



                  });

                  flutterToast().toastmessage(e.toString());



                });



              }),
            ),











          ],



        ),
      ),




    );
  }
}
